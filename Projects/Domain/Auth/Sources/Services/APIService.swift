//
//  APIService.swift
//  CoreNetwork
//
//  Created by 강민성 on 1/17/24.
//

import Foundation
import CoreNetwork

import Alamofire
import RxSwift
import RxAlamofire
import UIKit

public class APIService {
    
    let baseURL: String
    let configuration: URLSessionConfiguration
    let session: Session
    let requestInterceptor = RequestAuthInterceptor()
    let eventLogger = APIEventLogger()
    
    private let disposeBag: DisposeBag = DisposeBag()
    
    init(baseURL: String, isLogging: Bool = false, configuration: URLSessionConfiguration = .default) {
        self.baseURL = baseURL
        self.configuration = configuration
        self.session = Session(configuration: configuration, interceptor: requestInterceptor, eventMonitors: isLogging ? [self.eventLogger] : [])
    }
    
    func request(_ method: HTTPMethod, _ url: String, useAuthHeader: Bool = true, parameters: Parameters? = nil, encoding: ParameterEncoding = JSONEncoding.default, headers: [String: String]? = nil) -> Observable<DataRequest> {
        
        var httpHeaders = HTTPHeaders()
        httpHeaders.add(name: "Content-Type", value: "application/json")
        httpHeaders.add(name: "accept", value: "*/*")
        
        if let headers = headers {
            for (key, value) in headers {
                httpHeaders.update(name: key, value: value)
            }
            if useAuthHeader {
                httpHeaders.update(name: "Authorization", value: "Bearer \(SettingService.shared.accessToken)")
            }
        }
        
        return self.session.rx.request(method, baseURL + url, parameters: parameters, encoding: encoding, headers: httpHeaders)
    }
    
    func upload(_ method: HTTPMethod, _ url: String, useAuthHeader: Bool = true, images: [UIImage?], headers: [String: String]? = nil) -> Observable<UploadRequest> {
        
        var httpHeaders = HTTPHeaders()
        httpHeaders.add(name: "Content-Type", value: "multipart/form-data")
        httpHeaders.add(name: "accept", value: "*/*")
        
        if let headers = headers {
            for (key, value) in headers {
                httpHeaders.update(name: key, value: value)
            }
            if useAuthHeader {
                httpHeaders.update(name: "Authorization", value: "Bearer \(SettingService.shared.accessToken)")
            }
        }
        return Observable.create { [weak self] observer in
            guard let self = self else { return Disposables.create() }
            self.session.rx.upload(multipartFormData: { multipartFormData in
                for (index, image) in images.enumerated() {
                    if let image = image, let imageData = image.jpegData(compressionQuality: 0.5) {
                        multipartFormData.append(imageData, withName: "files", fileName: "image\(index).jpg", mimeType: "image/jpeg")
                    }
                }
            }, to: self.baseURL + url, method: method, headers: httpHeaders)
            .subscribe(
                onNext: { request in
                    observer.onNext(request)
                },
                onError: { error in
                    observer.onError(error)
                },
                onCompleted: {
                    observer.onCompleted()
                }
            ).disposed(by: self.disposeBag)
            
            return Disposables.create()
        }
    }
}
