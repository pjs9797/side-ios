import RxFlow

public enum HomeStep: Step {
    case popViewController
    case createMeetingCompleted
    case goToHomeViewController
    case goToCreateMeetingFlow(meetingTitle: String)
    case presentSelectMeetingTypeViewController
}
