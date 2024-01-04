import Foundation
import RxSwift
import RxCocoa
import Shared

public class CreateMeetingContentViewModel{
    let disposeBag = DisposeBag()
    let titleTextRelay = BehaviorRelay<String>(value: "")
    let onlineSwitchRelay = PublishRelay<Bool>()
    let memberTextRelay = BehaviorRelay<String>(value: "")
    let introductionTextRelay = BehaviorRelay<String>(value: "")
    let selectedDateRelay = BehaviorRelay<String>(value: "")
    let selectedTimeRelay = PublishRelay<String>()
    let backButtonTapped = PublishRelay<Void>()
    let setDefaultImageButtonTapped = PublishRelay<Void>()
    let imageCancelButtonTapped = PublishRelay<Void>()
    var representativeImagesDriver: Driver<SharedDSKitImages.Image>
    
    public init(){
        let representativeImages = [SharedDSKitAsset.Icons.representativeImage1.image,SharedDSKitAsset.Icons.representativeImage2.image,SharedDSKitAsset.Icons.representativeImage3.image,SharedDSKitAsset.Icons.representativeImage4.image,SharedDSKitAsset.Icons.representativeImage5.image,SharedDSKitAsset.Icons.representativeImage6.image,SharedDSKitAsset.Icons.representativeImage7.image,SharedDSKitAsset.Icons.representativeImage8.image,SharedDSKitAsset.Icons.representativeImage9.image]
        
        representativeImagesDriver = setDefaultImageButtonTapped
            .map { _ in
                let randomIndex = Int.random(in: 0..<representativeImages.count)
                return representativeImages[randomIndex]
            }
            .asDriver(onErrorDriveWith: Driver.empty())
        
    }
}
