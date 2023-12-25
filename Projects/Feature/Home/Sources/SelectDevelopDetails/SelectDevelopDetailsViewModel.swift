import RxSwift
import RxCocoa

public class SelectDevelopDetailsViewModel{
    let disposeBag = DisposeBag()
    let developDetailTypeRelay = BehaviorRelay<DevelopDetailType>(value: .none)
    
    let backButtonTapped = PublishRelay<Void>()
    let studyBtViewTapped = PublishRelay<Void>()
    let sideProjectBtViewTapped = PublishRelay<Void>()
    let jobChangeBtViewTapped = PublishRelay<Void>()
    let languageBtViewTapped = PublishRelay<Void>()
    let investmentBtViewTapped = PublishRelay<Void>()
    let etcBtViewTapped = PublishRelay<Void>()
    
    public init(){
        studyBtViewTapped
            .map { DevelopDetailType.study }
            .bind(to: developDetailTypeRelay)
            .disposed(by: disposeBag)
        
        sideProjectBtViewTapped
            .map { DevelopDetailType.sideProject }
            .bind(to: developDetailTypeRelay)
            .disposed(by: disposeBag)
        
        jobChangeBtViewTapped
            .map { DevelopDetailType.jobChange }
            .bind(to: developDetailTypeRelay)
            .disposed(by: disposeBag)
        
        languageBtViewTapped
            .map { DevelopDetailType.language }
            .bind(to: developDetailTypeRelay)
            .disposed(by: disposeBag)
        
        investmentBtViewTapped
            .map { DevelopDetailType.investment }
            .bind(to: developDetailTypeRelay)
            .disposed(by: disposeBag)
        
        etcBtViewTapped
            .map { DevelopDetailType.etc }
            .bind(to: developDetailTypeRelay)
            .disposed(by: disposeBag)
    }
}
