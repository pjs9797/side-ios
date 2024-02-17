import UIKit
import SharedDSKit

struct PositionCollectionViewModel{
    let image: UIImage
    let title: String
}

struct PositionCollectionViewCellData{
    static let cellData = [
        PositionCollectionViewModel(image: SharedDSKitAsset.Icons.iconPlan16.image, title: "기획 · 전략 · 경영"),
        PositionCollectionViewModel(image: SharedDSKitAsset.Icons.iconDevelopment16.image, title: "개발"),
        PositionCollectionViewModel(image: SharedDSKitAsset.Icons.iconData16.image, title: "데이터 · AI · ML"),
        PositionCollectionViewModel(image: SharedDSKitAsset.Icons.iconIdea16.image, title: "마케팅 · 광고 · 홍보"),
        PositionCollectionViewModel(image: SharedDSKitAsset.Icons.iconDesign16.image, title: "디자인"),
        PositionCollectionViewModel(image: SharedDSKitAsset.Icons.iconMedia16.image, title: "미디어 · 전시 · 예술"),
        PositionCollectionViewModel(image: SharedDSKitAsset.Icons.iconBox16.image, title: "유통 · 물류"),
        PositionCollectionViewModel(image: SharedDSKitAsset.Icons.iconCoin16.image, title: "금융"),
        PositionCollectionViewModel(image: SharedDSKitAsset.Icons.iconAccounting16.image, title: "재무 · 회계 · 세무"),
        PositionCollectionViewModel(image: SharedDSKitAsset.Icons.iconMy16.image, title: "인사 · 노무"),
        PositionCollectionViewModel(image: SharedDSKitAsset.Icons.iconTie16.image, title: "영업 · 고객"),
        PositionCollectionViewModel(image: SharedDSKitAsset.Icons.iconMedicine16.image, title: "의료 · 바이오 · 제약"),
        PositionCollectionViewModel(image: SharedDSKitAsset.Icons.iconRnd16.image, title: "연구 · RND"),
        PositionCollectionViewModel(image: SharedDSKitAsset.Icons.iconSetting16.image, title: "엔지니어링 · 설계"),
        PositionCollectionViewModel(image: SharedDSKitAsset.Icons.iconMedal16.image, title: "품질 · 생산"),
        PositionCollectionViewModel(image: SharedDSKitAsset.Icons.iconEdu16.image, title: "교육"),
        PositionCollectionViewModel(image: SharedDSKitAsset.Icons.iconSports16.image, title: "체육 · 스포츠직"),
        PositionCollectionViewModel(image: SharedDSKitAsset.Icons.iconLaw16.image, title: "법률 · 법무직"),
        PositionCollectionViewModel(image: SharedDSKitAsset.Icons.iconLeaf16.image, title: "공공 · 복지"),
        PositionCollectionViewModel(image: SharedDSKitAsset.Icons.iconHand16.image, title: "서비스직"),
        PositionCollectionViewModel(image: SharedDSKitAsset.Icons.iconEtc16.image, title: "기타")
    ]
}
