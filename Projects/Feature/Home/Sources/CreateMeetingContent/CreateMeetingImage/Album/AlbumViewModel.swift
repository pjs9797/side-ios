import UIKit
import Photos
import RxSwift
import RxCocoa

class AlbumViewModel{
    let backButtonTapped = PublishRelay<Void>()
    let selectButtonTapped = PublishRelay<Void>()
    let morePhotoButtonTapped = PublishRelay<Void>()
    let photoAuthorizationSettingButtonTapped = PublishRelay<Void>()
    let photosRelay = BehaviorRelay<[PHAsset]>(value: [])
    let photosCntDriver: Driver<Int>
    var selectedPhotoRelay = PublishRelay<UIImage>()
    var selectedPhotoIndexRelay: BehaviorRelay<IndexPath?> = BehaviorRelay(value: nil)
    
    init(){
        photosCntDriver = photosRelay.map{ $0.count }.asDriver(onErrorJustReturn: 0)
        
        fetchLimitedPhotos()
    }
    
    func fetchLimitedPhotos() {
        let fetchOptions = PHFetchOptions()
        fetchOptions.includeAssetSourceTypes = [.typeUserLibrary]
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        let assetsFetchResult = PHAsset.fetchAssets(with: fetchOptions)
        var assets: [PHAsset] = []
        assetsFetchResult.enumerateObjects { (asset, _, _) in
            assets.append(asset)
        }
        self.photosRelay.accept(assets)
    }
    
}
