import RxFlow

public enum CreateMeetingStep: Step {
    case popViewController
    case dismissViewController
    case goToInitializeCreateMeetingViewController
    case goToSelectDevelopDetailsViewController
    case goToSelectHobbyDetailsViewController
    case goToCreateMeetingContentViewController
    case presentSelectMeetingRegionViewController
}
