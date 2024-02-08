import RxSwift
import RxCocoa
import ReactorKit
import RxFlow
import CoreLocation
import Domain

public class LocationTableViewCellReactor: NSObject, ReactorKit.Reactor, Stepper{
    public var initialState: State
    public var steps = PublishRelay<Step>()
    
    public init(locationName: String){
        self.initialState = State(locationName: locationName)
    }
    
    public enum Action {
        
    }
    
    public enum Mutation {
    }
    
    public struct State {
        var locationName: String
    }
    
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
            
        }
    }
    
    public func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
            
        }
    }
}
