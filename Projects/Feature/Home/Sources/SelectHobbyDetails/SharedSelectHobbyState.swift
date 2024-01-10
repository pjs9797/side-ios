import RxCocoa
import Foundation

class SharedSelectHobbyState {
    static let shared = SharedSelectHobbyState()
    let selectedIndexPath = BehaviorRelay<(tableCellIndexPath: IndexPath, collectionViewIndexPath: IndexPath)?>(value: nil)
}
