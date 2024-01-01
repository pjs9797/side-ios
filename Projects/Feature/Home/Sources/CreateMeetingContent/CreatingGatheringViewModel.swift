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
    let selectedTimeRelay = BehaviorRelay<String>(value: "")
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
        
        Observable.combineLatest(selectedDateRelay,selectedTimeRelay)
            .map { date, time in
                return "\(date) \(time)"
            }
            .bind(onNext: { [weak self] dateTimeString in
                print(dateTimeString)
            })
            .disposed(by: disposeBag)
    }
    
    func getDateStandardString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
    
    func getTimeSubTitleString(time: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "a h:mm"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: time)
    }
    
    func getTimeStandardString(time: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter.string(from: time)
    }
}
