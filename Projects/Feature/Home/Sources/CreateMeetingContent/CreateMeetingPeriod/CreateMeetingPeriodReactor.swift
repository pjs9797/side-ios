import Foundation
import RxSwift
import RxCocoa
import ReactorKit
import RxFlow

public class CreateMeetingPeriodReactor: ReactorKit.Reactor, Stepper{
    public var initialState: State
    public var steps = PublishRelay<Step>()
    
    public init(){
        self.initialState = State()
    }
    
    public enum Action {
        //CalendarView
        case previousButtonTapped
        case nextButtonTapped
        case setCurrentPage(Date)
        case selectDate(String)
        //TimePickerView
        case selectTime(amPmIndex: Int, hourIndex: Int, minuteIndex: Int)
        //ToggleView
        case toggleCalendarView
        case toggleTimePickerView
    }
    
    public enum Mutation {
        //CalendarView
        case changeCurrentPage(Date)
        case setCurrentPage(Date)
        case setSelectedDate(String)
        //TimePickerView
        case setSelectedTime(String)
        //ToggleView
        case setCalendarViewVisibility(Bool)
        case setTimePickerViewVisibility(Bool)
    }
    
    public struct State {
        //CalendarView
        var currentPage: Date = Date()
        var selectedDate: String? = nil
        //TimePickerView
        var selectedTime: String? = nil
        let amPm = ["오전", "오후"]
        let hours = Array(repeating: (1...12).map { String(format: "%02d", $0) }, count: 1000).flatMap { $0 }
        let minutes = Array(repeating: (0...59).map { String(format: "%02d", $0) }, count: 1000).flatMap { $0 }
        //ToggleView
        var isCalendarViewVisible: Bool = false
        var isTimePickerViewVisible: Bool = false
    }
    
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
            //CalendarView
        case .previousButtonTapped:
            let currentDate = self.currentState.currentPage
            let newDate = Calendar.current.date(byAdding: .month, value: -1, to: currentDate) ?? currentDate
            return .just(.changeCurrentPage(newDate))
        case .nextButtonTapped:
            let currentDate = self.currentState.currentPage
            let newDate = Calendar.current.date(byAdding: .month, value: 1, to: currentDate) ?? currentDate
            return .just(.changeCurrentPage(newDate))
        case .setCurrentPage(let date):
            return .just(.setCurrentPage(date))
        case .selectDate(let date):
            return .just(.setSelectedDate(date))
            //TimePickerView
        case .selectTime(let amPmIndex, let hourIndex, let minuteIndex):
            let amPm = self.currentState.amPm[amPmIndex % 2]
            let hour = self.currentState.hours[hourIndex % 12]
            let minute = self.currentState.minutes[minuteIndex % 60]
            let timeString = "\(amPm) \(hour):\(minute)"
            return .just(.setSelectedTime(timeString))
            //ToggleView
        case .toggleCalendarView:
            let newVisibility = !currentState.isCalendarViewVisible
            return .just(.setCalendarViewVisibility(newVisibility))
        case .toggleTimePickerView:
            let newVisibility = !currentState.isTimePickerViewVisible
            return .just(.setTimePickerViewVisibility(newVisibility))
        }
    }
    
    public func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
            //CalendarView
        case .setCurrentPage(let date):
            newState.currentPage = date
        case .setSelectedDate(let date):
            newState.selectedDate = date
        case .changeCurrentPage(let date):
            newState.currentPage = date
            //TimePickerView
        case .setSelectedTime(let timeString):
            newState.selectedTime = timeString
            //ToggleView
        case .setCalendarViewVisibility(let isVisible):
            newState.isCalendarViewVisible = isVisible
            if isVisible {
                newState.isTimePickerViewVisible = false
            }
        case .setTimePickerViewVisibility(let isVisible):
            newState.isTimePickerViewVisible = isVisible
            if isVisible {
                newState.isCalendarViewVisible = false
            }
        }
        return newState
    }
}
