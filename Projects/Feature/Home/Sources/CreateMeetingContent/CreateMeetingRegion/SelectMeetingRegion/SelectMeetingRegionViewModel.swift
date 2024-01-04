import RxSwift
import RxCocoa

class SelectMeetingRegionViewModel{
    let backButtonTapped = PublishRelay<Void>()
    let cancelButtonTapped = PublishRelay<Void>()
    let clearButtonTapped = PublishRelay<Void>()
    var textFieldRelay = PublishRelay<String?>()
    var isTextExistDriver: Driver<Bool>
    
    init(){
        isTextExistDriver = textFieldRelay.map { !($0?.isEmpty ?? true) }.asDriver(onErrorJustReturn: true)
    }
}
