import UIKit.UIImage
import RxCocoa
import ReactorKit
import RxFlow
import Shared
import Domain
import Alamofire
import RxAlamofire

public class CreateMeetingContentReactor: ReactorKit.Reactor, Stepper{
    public var initialState: State
    public var steps = PublishRelay<Step>()
    let provider: ServiceProviderType
    let disposeBag = DisposeBag()
    public init(provider: ServiceProviderType){
        self.initialState = State()
        self.provider = provider
    }
    
    public enum Action {
        case backButtonTapped
        case createButtonTapped
        case writeTitleText(String)
        case setRegionText(String)
        case writeMemberLimitText(String)
        case setSelectedDate(String)
        case setSelectedTime(String)
        case setImage(UIImage?)
        case writeIntroductionText(String)
    }
    
    public enum Mutation {
        case setTitleText(String)
        case setRegionText(String)
        case setMemberLimitText(String)
        case setSelectedDate(String)
        case setSelectedTime(String)
        case setImage(UIImage?)
        case setIntroductionText(String)
    }
    
    public struct State {
        var titleText: String = ""
        var regionText: String = ""
        var memberLimitText: String = ""
        var selectedDate: String = ""
        var selectedTime: String = ""
        var introductionText: String = ""
        var image: UIImage? = nil
        var isCreateButtonEnabled: Bool = false
    }
    
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .backButtonTapped:
            DispatchQueue.main.async{
                EditPhotoReactor.shared.action.onNext(.clearImage)
                self.steps.accept(CreateMeetingStep.popViewController)
            }
            return .empty()
        case .createButtonTapped:
            self.provider.createMeetingService.transformImageToURL(image: [CreateMeetingImageModel.randomImages[1]])
                .flatMapLatest { uploadRequest -> Observable<String> in
                    return uploadRequest.rx.responseData()
                        .flatMap { response, data -> Observable<String> in
                            let decoder = JSONDecoder()
                            do {
                                let getUrlImageResponse = try decoder.decode(TransformImageResponse.self, from: data)
                                if let urlImage = getUrlImageResponse.urls.first {
                                    print(urlImage)
                                    return Observable.just(urlImage)
                                } else {
                                    print("Not Find First Data Error")
                                    return Observable.error(NSError(domain: "No URL Found", code: -1, userInfo: nil))
                                }
                            } catch {
                                print("Decoding error: \(error)")
                                return Observable.error(error)
                            }
                        }
                }
                .subscribe(onNext: { urlImage in
                    print("Upload successful", urlImage)
                }, onError: { error in
                    print("Upload failed: \(error)")
                })
                .disposed(by: disposeBag)
            return .empty()
        case .writeTitleText(let text):
            return .just(.setTitleText(text))
        case .setRegionText(let text):
            return .just(.setRegionText(text))
        case .writeMemberLimitText(let text):
            return .just(.setMemberLimitText(text))
        case .setSelectedDate(let date):
            return .just(.setSelectedDate(date))
        case .setSelectedTime(let time):
            return .just(.setSelectedTime(time))
        case .setImage(let image):
            return .just(.setImage(image))
        case .writeIntroductionText(let text):
            return .just(.setIntroductionText(text))
        }
    }
    
    public func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setTitleText(let text):
            newState.titleText = text
        case .setRegionText(let text):
            newState.regionText = text
        case .setMemberLimitText(let text):
            newState.memberLimitText = text
        case .setSelectedDate(let date):
            newState.selectedDate = date
        case .setSelectedTime(let time):
            newState.selectedTime = time
        case .setImage(let image):
            newState.image = image
        case .setIntroductionText(let text):
            newState.introductionText = text
        }
        newState.isCreateButtonEnabled = isCreateButtonEnabled(newState: newState)
        return newState
    }
    
    private func isCreateButtonEnabled(newState: State) -> Bool {
        return !newState.titleText.isEmpty &&
        !newState.regionText.isEmpty &&
        !newState.memberLimitText.isEmpty &&
        !newState.selectedDate.isEmpty &&
        !newState.selectedTime.isEmpty &&
        newState.image != nil &&
        ( !newState.introductionText.isEmpty && newState.introductionText != "자유롭게 소개글을 작성해 보세요!" )
    }
}
