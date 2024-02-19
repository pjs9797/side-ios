import RxFlow
import UIKit

public enum CreateMeetingStep: Step {
    case popViewController
    case dismissViewController
    case dismissEditPhotoViewController
    case doubleDismissViewController
    case goToInitializeCreateMeetingViewController
    case goToSelectDevelopDetailsViewController
    case goToSelectHobbyDetailsViewController
    case goToCreateMeetingContentViewController
    case createMeetingCompleted
    case presentSelectMeetingRegionViewController
    case presentAlbumViewController(type: String)
    case presentCameraViewController
    case presentEditPhotoViewController(image: UIImage)
    case presentPhotoCameraActionSheet
    case presentDeniedAlert(target: String)
}
