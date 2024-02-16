import RxCocoa
import ReactorKit
import RxFlow

public class SettingReactor: ReactorKit.Reactor, Stepper{
    public var initialState: State
    public var steps = PublishRelay<Step>()
    
    public init(){
        self.initialState = State(cellData: [
            .Info(mainLabelText: "버전 정보", infoLabelText: "v3.0"),
            .Info(mainLabelText: "계정연동정보", infoLabelText: "Test@gmail.com"),
            .Terms(mainLabelText: "서비스 이용약관"),
            .Terms(mainLabelText: "개인정보처리방침"),
            .Terms(mainLabelText: "위치기반서비스 이용약관"),
            .Logout(mainLabelText: "로그아웃"),
            .Logout(mainLabelText: "회원 탈퇴")
        ])
    }
    
    public enum Action {
        case backButtonTapped
        case logoutTapped
        case withdrawalTapped
    }
    
    public enum Mutation {
        
    }
    
    public struct State {
        var cellData: [SettingTableViewItem]
    }
    
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .backButtonTapped:
            self.steps.accept(MyPageStep.popViewController)
            return .empty()
        case .logoutTapped:
            //TODO: 로그아웃버튼탭
            return .empty()
        case .withdrawalTapped:
            self.steps.accept(MyPageStep.presentToWithdrawalAlert)
            return .empty()
        }
    }
    
    public func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        }
        return newState
    }
}
