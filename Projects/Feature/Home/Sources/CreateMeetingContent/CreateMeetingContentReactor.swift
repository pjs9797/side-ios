import UIKit.UIImage
import RxCocoa
import ReactorKit
import RxFlow
import Shared
import Domain

public class CreateMeetingContentReactor: ReactorKit.Reactor, Stepper{
    public var initialState: State
    public var steps = PublishRelay<Step>()
    let provider: ServiceProviderType
    
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
            return self.provider.createMeetingService.transformImageToURL(image: [EditPhotoReactor.shared.currentState.image])
                .flatMapLatest { uploadRequest -> Observable<String> in
                    return uploadRequest.rx.responseData()
                        .flatMap { response, data -> Observable<String> in
                            let decoder = JSONDecoder()
                            do {
                                let getUrlImageResponse = try decoder.decode(TransformImageToURLResponse.self, from: data)
                                if let urlImage = getUrlImageResponse.urls.first {
                                    return Observable.just(urlImage)
                                } 
                                else {
                                    return Observable.error(NSError(domain: "No URL Found", code: -1, userInfo: nil))
                                }
                            } 
                            catch {
                                return Observable.error(error)
                            }
                        }
                }
                .flatMapLatest{ urlImage -> Observable<Mutation> in
                    let startAt = self.convertDateString(dateString: self.currentState.selectedDate, timeString: self.currentState.selectedTime)
                    var activityType: String
                    var locationInfo: String?
                    if self.currentState.regionText == "온라인" {
                        activityType = "온라인"
                        locationInfo = nil
                    } else {
                        activityType = "오프라인"
                        locationInfo = self.currentState.regionText
                    }
                    return self.provider.createMeetingService.createMeeting(name: self.currentState.titleText, description: self.currentState.introductionText, memberMaxNumber: Int(self.currentState.memberLimitText) ?? 100, startAt: startAt, mainImage: urlImage, categoryMajor: MeetingDataManager.shared.categoryMajor, categorySub: MeetingDataManager.shared.categorySub, type: MeetingDataManager.shared.meetingType, activityType: activityType, locationInfo: locationInfo, locationDetail: nil).responseData()
                        .flatMap{ response, data -> Observable<Mutation> in
                            EditPhotoReactor.shared.action.onNext(.clearImage)
                            self.steps.accept(CreateMeetingStep.createMeetingCompleted)
                            return .empty()
                        }
                }
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
        ( !newState.regionText.isEmpty && newState.regionText != "읍,면,동으로 검색하세요." ) &&
        !newState.memberLimitText.isEmpty &&
        !newState.selectedDate.isEmpty &&
        !newState.selectedTime.isEmpty &&
        newState.image != nil &&
        ( !newState.introductionText.isEmpty && newState.introductionText != "자유롭게 소개글을 작성해 보세요!" )
    }
    
    private func convertDateString(dateString: String, timeString: String) -> String {
        let inputDateFormat = "yyyy.MM.dd a hh:mm"
        let outputDateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = inputDateFormat
        let combinedDateTimeString = dateString + " " + timeString
        let date = dateFormatter.date(from: combinedDateTimeString)
        dateFormatter.dateFormat = outputDateFormat
        
        return dateFormatter.string(from: date ?? Date())
    }
}
