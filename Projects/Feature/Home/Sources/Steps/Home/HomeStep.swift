import RxFlow

public enum HomeStep: Step {
    case popViewController
    case goToCreateMeetingFlow(meetingTitle: String)
    case presentSelectMeetingTypeViewController
}
