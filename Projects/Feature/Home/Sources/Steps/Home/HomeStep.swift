import RxFlow

public enum HomeStep: Step {
    case popViewController
    case goToHomeViewController
    case goToCreateMeetingFlow(meetingTitle: String)
    case presentSelectMeetingTypeViewController
}
