import RxCocoa
import UIKit

class EditPhotoViewModel{
    static let shared = EditPhotoViewModel()
    let imgRelay = PublishRelay<UIImage?>()
    
    private init(){
        
    }
}
