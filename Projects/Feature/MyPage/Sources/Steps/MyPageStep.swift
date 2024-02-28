import RxFlow

public enum MyPageStep: Step {
    case popViewController
    case goToMyPageViewController
    case goToMyActivityViewController(myClubCount: Int, clubBookmarkCount: Int)
    case goToSettingViewController(memberId: Int, email: String)
    case goToModifyProfileViewController
    case goToTermsOfServiceViewController
    case goToPrivacyPolicyViewController
    case goToLocationServicesTermsViewController
    case presentToSelectPositionViewController
    case presentToWithdrawalAlert
    //TODO: AppStep 연결 후 주석 삭제
    //case endMyPage
}
