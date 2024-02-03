//
//  RequestAuthInterceptor.swift
//  CoreNetwork
//
//  Created by 강민성 on 1/17/24.
//

import Foundation
import Alamofire
import RxFlow

final class RequestAuthInterceptor: RequestInterceptor {
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        guard urlRequest.url?.absoluteString.hasPrefix("PREIFX") == true, SettingService.shared.accessToken != "" else {
            completion(.success(urlRequest))
            return
        }
        
        var urlRequest = urlRequest
        urlRequest.setValue(SettingService.shared.accessToken, forHTTPHeaderField: "X-ACCESS-TOKEN")
        completion(.success(urlRequest))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        guard let response = request.task?.response as? HTTPURLResponse, 400...499 ~= response.statusCode else {
            completion(.doNotRetryWithError(error))
            return
        }
        
        DataRepository.shared.userService.refresh().data().decode(type: TokenRefreshResult.self, decoder: JSONDecoder()).subscribe(onNext: { result in
            SettingService.shared.accessToken = result.accessToken
                    completion(.retry)
                }, onError: { error in
                    completion(.doNotRetryWithError(error))
                }).disposed(by: DataRepository.shared.disposeBag)
    }
}
