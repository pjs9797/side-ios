import UIKit
import Photos
import ReactorKit
import RxFlow
import RxCocoa

class AlbumViewReactor: ReactorKit.Reactor, Stepper {
    let initialState: State
    var steps = PublishRelay<Step>()
    
    init(photoAuthType: String) {
        self.initialState = State(photoAuthType: photoAuthType)
        fetchLimitedPhotos()
    }
    
    enum Action {
        case backButtonTapped
        case morePhotoButtonTapped(AlbumViewController)
        case photoAuthorizationSettingButtonTapped
        case selectButtonTapped
        case getPhotos([PHAsset])
        case selectPhoto(UIImage?,IndexPath)
    }
    
    enum Mutation {
        case setPhotos([PHAsset])
        case setPhotosCnt(Int)
        case setSelectPhoto(UIImage?)
        case setSelectIndexPath(IndexPath?)
        case setPreviousSelectedIndexPath(IndexPath?)
    }
    
    struct State {
        var photoAuthType: String
        var photos: [PHAsset] = []
        var photosCnt: Int = 0
        var selectedPhoto: UIImage? = nil
        var selectedIndexPath: IndexPath? = nil
        var previousSelectedIndexPath: IndexPath? = nil
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .backButtonTapped:
            self.steps.accept(CreateMeetingStep.dismissViewController)
            return .empty()
        case .morePhotoButtonTapped(let albumViewController):
            PHPhotoLibrary.shared().presentLimitedLibraryPicker(from: albumViewController)
            return .empty()
        case .photoAuthorizationSettingButtonTapped:
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
            return .empty()
        case .selectButtonTapped:
            if let selectedPhoto = self.currentState.selectedPhoto{
                self.steps.accept(CreateMeetingStep.presentEditPhotoViewController(image: selectedPhoto))
            }
            return .empty()
        case .getPhotos(let photos):
            return Observable.concat([
                .just(.setPhotos(photos)),
                .just(.setPhotosCnt(photos.count))
            ])
        case .selectPhoto(let photo, let indexPath):
            return Observable.concat([
                .just(.setSelectPhoto(photo)),
                .just(.setSelectIndexPath(indexPath)),
                .just(.setPreviousSelectedIndexPath(self.currentState.selectedIndexPath))
            ])
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setPhotos(let photos):
            newState.photos = photos
        case .setPhotosCnt(let cnt):
            newState.photosCnt = cnt
        case .setSelectPhoto(let photo):
            newState.selectedPhoto = photo
        case .setSelectIndexPath(let indexPath):
            newState.selectedIndexPath = indexPath
        case .setPreviousSelectedIndexPath(let indexPath):
            newState.previousSelectedIndexPath = indexPath
        }
        return newState
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
        self.action.onNext(.getPhotos(assets))
    }
}
