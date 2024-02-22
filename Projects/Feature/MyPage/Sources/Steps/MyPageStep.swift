import RxFlow

public enum MyPageStep: Step {
    case popViewController
    case goToMyPageViewController
    case goToSettingViewController(memberId: Int, email: String)
    case goToModifyProfileViewController
    case goToTermsOfServiceViewController
    case goToPrivacyPolicyViewController
    case goToLocationServicesTermsViewController
    case presentToSelectPositionViewController
    case presentToWithdrawalAlert
}
