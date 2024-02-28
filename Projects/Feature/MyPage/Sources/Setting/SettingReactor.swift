import RxCocoa
import ReactorKit
import RxFlow
import Domain

public class SettingReactor: ReactorKit.Reactor, Stepper{
    public var initialState: State
    public var steps = PublishRelay<Step>()
    public let provider: ServiceProviderType
    
    public init(provider: ServiceProviderType, memberId: Int, email: String){
        self.initialState = State(cellData: [
            .Info(mainLabelText: "버전 정보", infoLabelText: "v1.0"),
            .Info(mainLabelText: "계정연동정보", infoLabelText: email),
            .Terms(mainLabelText: "서비스 이용약관"),
            .Terms(mainLabelText: "개인정보처리방침"),
            .Terms(mainLabelText: "위치기반서비스 이용약관"),
            .Logout(mainLabelText: "로그아웃"),
            .Logout(mainLabelText: "회원 탈퇴")
        ], memberId: memberId)
        self.provider = provider
    }
    
    public enum Action {
        case backButtonTapped
        case rightButtonTapped(String)
        case logoutTapped
        case withdrawalTapped
        case withdrawalConfirm
    }
    
    public enum Mutation {
        
    }
    
    public struct State {
        var cellData: [SettingTableViewItem]
        var memberId: Int
    }
    
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .backButtonTapped:
            self.steps.accept(MyPageStep.popViewController)
            return .empty()
        case .rightButtonTapped(let type):
            switch type{
            case "서비스 이용약관":
                self.steps.accept(MyPageStep.goToTermsOfServiceViewController)
            case "개인정보처리방침":
                self.steps.accept(MyPageStep.goToPrivacyPolicyViewController)
            case "위치기반서비스 이용약관":
                self.steps.accept(MyPageStep.goToLocationServicesTermsViewController)
            default:
                break
            }
            return .empty()
        case .logoutTapped:
            //TODO: AppStep 연결 후 주석 삭제
            //self?.steps.accept(MyPageStep.endMyPage)
            return .empty()
        case .withdrawalTapped:
            self.steps.accept(MyPageStep.presentToWithdrawalAlert)
            return .empty()
        case .withdrawalConfirm:
            return self.provider.myPageService.widthdraw(memberId: self.currentState.memberId).responseData()
                .flatMap { [weak self] _ -> Observable<Mutation> in
                    //TODO: AppStep 연결 후 주석 삭제
                    //self?.steps.accept(MyPageStep.endMyPage)
                    return .empty()
                }
        }
    }
    
    public func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        }
        return newState
    }
}
