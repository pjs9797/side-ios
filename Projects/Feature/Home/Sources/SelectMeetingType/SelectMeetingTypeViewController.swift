import UIKit
import RxSwift
import RxCocoa
import SnapKit

public class SelectMeetingTypeViewController: UIViewController {
<<<<<<< HEAD
    let disposeBag = DisposeBag()
    var selectMeetingTypeViewModel: SelectMeetingTypeViewModel
    weak var homeNavigationController: UINavigationController?
    let dimmedView: UIView = {
=======
    
    let disposeBag = DisposeBag()
    var selectMeetingTypeViewModel: SelectMeetingTypeViewModel
    weak var homeNavigationController: UINavigationController?
    
<<<<<<< HEAD
    lazy var dimmedView: UIView = {
>>>>>>> 67ee1ca ([FEAT] 모임 생성 타입 화면 개발)
=======
    let dimmedView: UIView = {
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        return view
    }()
<<<<<<< HEAD
    let backView: UIView = {
=======
    
<<<<<<< HEAD
    lazy var backView: UIView = {
>>>>>>> 67ee1ca ([FEAT] 모임 생성 타입 화면 개발)
=======
    let backView: UIView = {
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.transform = CGAffineTransform(translationX: 0, y: view.frame.height)
        return view
    }()
<<<<<<< HEAD
    let handleView: UIView = {
=======
    
<<<<<<< HEAD
    lazy var handleView: UIView = {
>>>>>>> 67ee1ca ([FEAT] 모임 생성 타입 화면 개발)
=======
    let handleView: UIView = {
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 2.5
        return view
    }()
<<<<<<< HEAD
    let oneDayButton: UIButton = {
=======
    
<<<<<<< HEAD
    lazy var oneDayButton: UIButton = {
>>>>>>> 67ee1ca ([FEAT] 모임 생성 타입 화면 개발)
=======
    let oneDayButton: UIButton = {
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
        let button = UIButton()
        button.setTitle("원데이 멤버 모집하기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
<<<<<<< HEAD
    let shortTermButton: UIButton = {
=======
    
<<<<<<< HEAD
    lazy var shortTermButton: UIButton = {
>>>>>>> 67ee1ca ([FEAT] 모임 생성 타입 화면 개발)
=======
    let shortTermButton: UIButton = {
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
        let button = UIButton()
        button.setTitle("단기 멤버 모집하기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
<<<<<<< HEAD
    let continuousButton: UIButton = {
=======
    
<<<<<<< HEAD
    lazy var continuousButton: UIButton = {
>>>>>>> 67ee1ca ([FEAT] 모임 생성 타입 화면 개발)
=======
    let continuousButton: UIButton = {
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
        let button = UIButton()
        button.setTitle("지속형 멤버 모집하기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
<<<<<<< HEAD
    let firstSeparateView: UIView = {
=======
    
<<<<<<< HEAD
    lazy var firstSeparateView: UIView = {
>>>>>>> 67ee1ca ([FEAT] 모임 생성 타입 화면 개발)
=======
    let firstSeparateView: UIView = {
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
<<<<<<< HEAD
    let secondSeparateView: UIView = {
=======
    
<<<<<<< HEAD
    lazy var secondSeparateView: UIView = {
>>>>>>> 67ee1ca ([FEAT] 모임 생성 타입 화면 개발)
=======
    let secondSeparateView: UIView = {
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    public init(selectMeetingTypeViewModel: SelectMeetingTypeViewModel) {
        self.selectMeetingTypeViewModel = selectMeetingTypeViewModel
        super.init(nibName: nil, bundle: nil)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
        self.modalTransitionStyle = .crossDissolve
=======
        self.modalTransitionStyle = .coverVertical
>>>>>>> 67ee1ca ([FEAT] 모임 생성 타입 화면 개발)
=======
        self.modalTransitionStyle = .crossDissolve
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
=======

>>>>>>> a38b360 ([FEAT] 모임 생성 타입 present  애니메이션 개발)
        self.modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
<<<<<<< HEAD
<<<<<<< HEAD
        tapEvent()
        bind()
        layout()
=======
        
        bind()
        layout()
        
        
        let tapGesture = UITapGestureRecognizer()
        self.dimmedView.addGestureRecognizer(tapGesture)
        
        tapGesture.rx.event
            .bind { [weak self] gesture in
                self?.backViewDown()
            }
            .disposed(by: disposeBag)
        
>>>>>>> 67ee1ca ([FEAT] 모임 생성 타입 화면 개발)
=======
        tapEvent()
        bind()
        layout()
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
    }
    
<<<<<<< HEAD
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
<<<<<<< HEAD
<<<<<<< HEAD
        
=======
        guard let presentingViewController else { return }
        presentingViewController.view.addSubview(dimmedView)
        dimmedView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
>>>>>>> 67ee1ca ([FEAT] 모임 생성 타입 화면 개발)
=======
        
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
        UIView.animate(withDuration: 0.3) {
=======
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        UIView.animate(withDuration: 0.3, animations: {
>>>>>>> a38b360 ([FEAT] 모임 생성 타입 present  애니메이션 개발)
            self.dimmedView.alpha = 0.6
            self.backView.transform = .identity
        })
    }
    
    func appearAnimation(){
        UIView.animate(withDuration: 0.3, animations: {
            self.dimmedView.alpha = 0.6
            self.backView.transform = .identity
        })
    }
    
    func dismissAnimation() {
        UIView.animate(withDuration: 0.3, animations: {
            self.backView.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height)
            self.dimmedView.alpha = 0
        }, completion: { _ in
            self.dismiss(animated: false, completion: nil)
        })
    }
    
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
    func tapEvent(){
        let tapGesture = UITapGestureRecognizer()
        let swipeGesture = UISwipeGestureRecognizer()
        self.dimmedView.addGestureRecognizer(tapGesture)
        self.backView.addGestureRecognizer(swipeGesture)
        swipeGesture.direction = .down
<<<<<<< HEAD
        tapGesture.rx.event
<<<<<<< HEAD
            .bind { [weak self] gesture in
                print(2323)
                self?.dismiss(animated: true)
=======
        
        tapGesture.rx.event
            .bind { [weak self] gesture in
                print(2323)
                self?.backViewDown()
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
=======
            .bind { [weak self] _ in
                self?.dismissAnimation()
>>>>>>> a38b360 ([FEAT] 모임 생성 타입 present  애니메이션 개발)
            }
            .disposed(by: disposeBag)
        
        swipeGesture.rx.event
            .bind { [weak self] _ in
                self?.dismissAnimation()
            }
            .disposed(by: disposeBag)
    }
    
<<<<<<< HEAD
=======
>>>>>>> 67ee1ca ([FEAT] 모임 생성 타입 화면 개발)
=======
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
    func bind(){
        oneDayButton.rx.tap
            .bind(to: selectMeetingTypeViewModel.oneDayButtonTapped)
            .disposed(by: disposeBag)
        
        selectMeetingTypeViewModel.oneDayButtonTapped
            .bind(onNext: { [weak self] in
                self?.dismiss(animated: false, completion: {
                    let createMeetingVC = CreateMeetingViewController(meetingTitle: "원데이 멤버 모집하기", createMeetingViewModel: CreateMeetingViewModel())
                    self?.homeNavigationController!.pushViewController(createMeetingVC, animated: true)
                })
            })
            .disposed(by: disposeBag)
        
        shortTermButton.rx.tap
            .bind(to: selectMeetingTypeViewModel.shortTermButtonTapped)
            .disposed(by: disposeBag)
        
        selectMeetingTypeViewModel.shortTermButtonTapped
            .bind(onNext: { [weak self] in
                self?.dismiss(animated: false, completion: {
                    let createMeetingVC = CreateMeetingViewController(meetingTitle: "단기 멤버 모집하기", createMeetingViewModel: CreateMeetingViewModel())
                    self?.homeNavigationController!.pushViewController(createMeetingVC, animated: true)
                })
            })
            .disposed(by: disposeBag)
        
        continuousButton.rx.tap
            .bind(to: selectMeetingTypeViewModel.continuousButtonTapped)
            .disposed(by: disposeBag)
        
        selectMeetingTypeViewModel.continuousButtonTapped
            .bind(onNext: { [weak self] in
                self?.dismiss(animated: false, completion: {
                    let createMeetingVC = CreateMeetingViewController(meetingTitle: "지속형 멤버 모집하기", createMeetingViewModel: CreateMeetingViewModel())
                    self?.homeNavigationController!.pushViewController(createMeetingVC, animated: true)
                })
            })
            .disposed(by: disposeBag)
    }
    
    func layout(){
<<<<<<< HEAD
<<<<<<< HEAD
        self.view.addSubview(dimmedView)
=======
        
>>>>>>> 67ee1ca ([FEAT] 모임 생성 타입 화면 개발)
=======
        self.view.addSubview(dimmedView)
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
        self.view.addSubview(backView)
        [handleView,oneDayButton,firstSeparateView,shortTermButton,secondSeparateView,continuousButton]
            .forEach{ self.backView.addSubview($0) }
        
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
        dimmedView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
<<<<<<< HEAD
=======
>>>>>>> 67ee1ca ([FEAT] 모임 생성 타입 화면 개발)
=======
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
        backView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(263)
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        handleView.snp.makeConstraints { make in
            make.width.equalTo(56)
            make.height.equalTo(5)
            make.top.equalToSuperview().offset(8)
            make.centerX.equalToSuperview()
        }
        
        oneDayButton.snp.makeConstraints { make in
            make.width.equalTo(335)
            make.height.equalTo(55)
            make.top.equalTo(handleView.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
        
        firstSeparateView.snp.makeConstraints { make in
            make.width.equalTo(335)
            make.height.equalTo(1)
            make.top.equalTo(oneDayButton.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        shortTermButton.snp.makeConstraints { make in
            make.width.equalTo(335)
            make.height.equalTo(55)
            make.top.equalTo(firstSeparateView.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        secondSeparateView.snp.makeConstraints { make in
            make.width.equalTo(335)
            make.height.equalTo(1)
            make.top.equalTo(shortTermButton.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        continuousButton.snp.makeConstraints { make in
            make.width.equalTo(335)
            make.height.equalTo(55)
            make.top.equalTo(secondSeparateView.snp.bottom)
            make.centerX.equalToSuperview()
        }
    }
<<<<<<< HEAD
=======
    
    func backViewUp(){
        
        UIView.animate(withDuration: 0.3) {
            self.backView.snp.remakeConstraints { make in
                make.width.equalToSuperview()
                make.height.equalTo(263)
                make.leading.equalToSuperview()
                make.bottom.equalToSuperview()
            }
            self.loadViewIfNeeded()
        }
    }
    
    func backViewDown(){
        
        self.dismiss(animated: true)
        
    }
    
>>>>>>> 67ee1ca ([FEAT] 모임 생성 타입 화면 개발)
}
