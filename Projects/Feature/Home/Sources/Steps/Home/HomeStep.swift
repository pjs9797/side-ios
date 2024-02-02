import RxFlow

public enum HomeStep: Step {
    case popViewController
    case dismissViewController
    case goToCreateMeetingFlow
    case presentSelectMeetingTypeViewController
}
