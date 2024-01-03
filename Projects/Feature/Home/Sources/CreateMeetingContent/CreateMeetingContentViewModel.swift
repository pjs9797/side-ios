import Foundation
import RxSwift
import RxCocoa
<<<<<<< HEAD
import Shared
=======
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)

public class CreateMeetingContentViewModel{
    let disposeBag = DisposeBag()
    let titleTextRelay = BehaviorRelay<String>(value: "")
    let onlineSwitchRelay = PublishRelay<Bool>()
    let memberTextRelay = BehaviorRelay<String>(value: "")
    let introductionTextRelay = BehaviorRelay<String>(value: "")
    let selectedDateRelay = BehaviorRelay<String>(value: "")
    let selectedTimeRelay = BehaviorRelay<String>(value: "")
<<<<<<< HEAD
    let setDefaultImageButtonTapped = PublishRelay<Void>()
    let imageCancelButtonTapped = PublishRelay<Void>()
    var representativeImagesDriver: Driver<SharedDSKitImages.Image>
    
    public init(createMeetingPeriodViewModel: CreateMeetingPeriodViewModel){
        let representativeImages = [SharedDSKitAsset.Icons.representativeImage1.image,SharedDSKitAsset.Icons.representativeImage2.image,SharedDSKitAsset.Icons.representativeImage3.image,SharedDSKitAsset.Icons.representativeImage4.image,SharedDSKitAsset.Icons.representativeImage5.image,SharedDSKitAsset.Icons.representativeImage6.image,SharedDSKitAsset.Icons.representativeImage7.image,SharedDSKitAsset.Icons.representativeImage8.image,SharedDSKitAsset.Icons.representativeImage9.image]
        
        representativeImagesDriver = setDefaultImageButtonTapped
            .map { _ in
                let randomIndex = Int.random(in: 0..<representativeImages.count)
                return representativeImages[randomIndex]
            }
            .asDriver(onErrorDriveWith: Driver.empty())
        
<<<<<<< HEAD:Projects/Feature/Home/Sources/CreateMeetingContent/CreatingGatheringViewModel.swift
=======
    
    public init(){
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
        Observable.combineLatest(selectedDateRelay,selectedTimeRelay)
            .map { date, time in
                return "\(date) \(time)"
            }
            .bind(onNext: { [weak self] dateTimeString in
                print(dateTimeString)
=======
        createMeetingPeriodViewModel.timeRelay
            .bind(onNext: { aa in
                print(aa)
>>>>>>> a38b360 ([FEAT] 모임 생성 타입 present  애니메이션 개발):Projects/Feature/Home/Sources/CreateMeetingContent/CreateMeetingContentViewModel.swift
            })
            .disposed(by: disposeBag)
        
        createMeetingPeriodViewModel.timeRelay
            .bind(to: selectedTimeRelay)
            .disposed(by: disposeBag)
        
        selectedTimeRelay
            .bind(onNext: { aa in
                print(aa)
            })
            .disposed(by: disposeBag)
        
    }
    
}
