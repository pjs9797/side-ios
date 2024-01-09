import Foundation
import RxSwift
import AVFoundation
import Photos
import UIKit

class AuthorizationManager {
    func requestCameraAuthorization() -> Observable<Bool> {
        return Observable.create { observer in
            switch AVCaptureDevice.authorizationStatus(for: .video) {
            case .authorized:
                observer.onNext(true)
            case .notDetermined:
                AVCaptureDevice.requestAccess(for: .video) { granted in
                    observer.onNext(granted)
                }
            default:
                observer.onNext(false)
            }
            return Disposables.create()
        }
    }

    func requestPhotoLibraryAuthorization() -> Observable<Int> {
        return Observable.create { observer in
            let status = PHPhotoLibrary.authorizationStatus()
            switch status {
            case .authorized:
                observer.onNext(1)
            case .limited:
                observer.onNext(1)
            case .denied:
                observer.onNext(0)
            case .notDetermined:
                PHPhotoLibrary.requestAuthorization { newStatus in
                    if newStatus == .authorized || newStatus == .limited {
                        observer.onNext(1)
                    } 
                    else if newStatus == .denied{
                        observer.onNext(0)
                    }
                    else{
                        observer.onNext(-1)
                    }
                }
            default:
                observer.onNext(-1)
            }
            return Disposables.create()
        }
    }
}
