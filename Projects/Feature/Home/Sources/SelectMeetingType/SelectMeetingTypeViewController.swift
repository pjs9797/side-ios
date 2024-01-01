import UIKit
import RxSwift
import RxCocoa
import SnapKit

public class SelectMeetingTypeViewController: UIViewController {
    let disposeBag = DisposeBag()
    var selectMeetingTypeViewModel: SelectMeetingTypeViewModel
    weak var homeNavigationController: UINavigationController?
    let dimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        return view
    }()
    let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()
    let handleView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 2.5
        return view
    }()
    let oneDayButton: UIButton = {
        let button = UIButton()
        button.setTitle("원데이 멤버 모집하기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    let shortTermButton: UIButton = {
        let button = UIButton()
        button.setTitle("단기 멤버 모집하기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    let continuousButton: UIButton = {
        let button = UIButton()
        button.setTitle("지속형 멤버 모집하기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    let firstSeparateView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    let secondSeparateView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    public init(selectMeetingTypeViewModel: SelectMeetingTypeViewModel) {
        self.selectMeetingTypeViewModel = selectMeetingTypeViewModel
        super.init(nibName: nil, bundle: nil)
        self.modalTransitionStyle = .crossDissolve
        self.modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        tapEvent()
        bind()
        layout()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 0.3) {
            self.dimmedView.alpha = 0.6
        }
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        UIView.animate(withDuration: 0.3) {
            self.dimmedView.alpha = 0
        } completion: { _ in
            self.dimmedView.removeFromSuperview()
        }
    }
    
    func tapEvent(){
        let tapGesture = UITapGestureRecognizer()
        let swipeGesture = UISwipeGestureRecognizer()
        self.dimmedView.addGestureRecognizer(tapGesture)
        self.backView.addGestureRecognizer(swipeGesture)
        swipeGesture.direction = .down
        tapGesture.rx.event
            .bind { [weak self] gesture in
                print(2323)
                self?.dismiss(animated: true)
            }
            .disposed(by: disposeBag)
        
        swipeGesture.rx.event
            .bind { [weak self] gesture in
                self?.dismiss(animated: true)
            }
            .disposed(by: disposeBag)
    }
    
    func bind(){
        oneDayButton.rx.tap
            .bind(to: selectMeetingTypeViewModel.oneDayButtonTapped)
            .disposed(by: disposeBag)
        
        selectMeetingTypeViewModel.oneDayButtonTapped
            .bind(onNext: { [weak self] in
                self?.dismiss(animated: true, completion: {
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
                self?.dismiss(animated: true, completion: {
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
                self?.dismiss(animated: true, completion: {
                    let createMeetingVC = CreateMeetingViewController(meetingTitle: "지속형 멤버 모집하기", createMeetingViewModel: CreateMeetingViewModel())
                    self?.homeNavigationController!.pushViewController(createMeetingVC, animated: true)
                })
            })
            .disposed(by: disposeBag)
    }
    
    func layout(){
        self.view.addSubview(dimmedView)
        self.view.addSubview(backView)
        [handleView,oneDayButton,firstSeparateView,shortTermButton,secondSeparateView,continuousButton]
            .forEach{ self.backView.addSubview($0) }
        
        dimmedView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
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
}
