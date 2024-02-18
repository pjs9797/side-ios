import UIKit
import RxSwift
import RxCocoa
import ReactorKit
import SnapKit

public class SelectMeetingTypeViewController: UIViewController, ReactorKit.View {
    public var disposeBag = DisposeBag()
    let tapGesture = UITapGestureRecognizer()
    let swipeGesture = UISwipeGestureRecognizer()
    let dimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        return view
    }()
    let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16*Constants.standardHeight
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()
    let handleView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 2.5*Constants.standardHeight
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
    
    public init(with reactor: SelectMeetingTypeReactor) {
        super.init(nibName: nil, bundle: nil)

        self.reactor = reactor
        self.modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        tapEvent()
        layout()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        appearAnimation()
    }
    
    func appearAnimation(){
        backView.transform = CGAffineTransform(translationX: 0, y: view.frame.height)
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
    
    func tapEvent(){
        self.dimmedView.addGestureRecognizer(tapGesture)
        self.backView.addGestureRecognizer(swipeGesture)
        swipeGesture.direction = .down
    }
    
    func layout(){
        [dimmedView,backView]
            .forEach{ self.view.addSubview($0) }
        [handleView,oneDayButton,firstSeparateView,shortTermButton,secondSeparateView,continuousButton]
            .forEach{ self.backView.addSubview($0) }
        
        dimmedView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        backView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(263*Constants.standardHeight)
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        handleView.snp.makeConstraints { make in
            make.width.equalTo(56*Constants.standardWidth)
            make.height.equalTo(5*Constants.standardHeight)
            make.top.equalToSuperview().offset(8*Constants.standardHeight)
            make.centerX.equalToSuperview()
        }
        
        oneDayButton.snp.makeConstraints { make in
            make.width.equalTo(335*Constants.standardWidth)
            make.height.equalTo(55*Constants.standardHeight)
            make.top.equalTo(handleView.snp.bottom).offset(40*Constants.standardHeight)
            make.centerX.equalToSuperview()
        }
        
        firstSeparateView.snp.makeConstraints { make in
            make.width.equalTo(335*Constants.standardWidth)
            make.height.equalTo(1*Constants.standardHeight)
            make.top.equalTo(oneDayButton.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        shortTermButton.snp.makeConstraints { make in
            make.width.equalTo(335*Constants.standardWidth)
            make.height.equalTo(55*Constants.standardHeight)
            make.top.equalTo(firstSeparateView.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        secondSeparateView.snp.makeConstraints { make in
            make.width.equalTo(335*Constants.standardWidth)
            make.height.equalTo(1*Constants.standardHeight)
            make.top.equalTo(shortTermButton.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        continuousButton.snp.makeConstraints { make in
            make.width.equalTo(335*Constants.standardWidth)
            make.height.equalTo(55*Constants.standardHeight)
            make.top.equalTo(secondSeparateView.snp.bottom)
            make.centerX.equalToSuperview()
        }
    }
}

extension SelectMeetingTypeViewController {
    public func bind(reactor: SelectMeetingTypeReactor) {
        bindAction(reactor: reactor)
        bindState(reactor: reactor)
    }
    
    private func bindAction(reactor: SelectMeetingTypeReactor) {
        oneDayButton.rx.tap
            .map { Reactor.Action.oneDayButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        shortTermButton.rx.tap
            .map { Reactor.Action.shortTermButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        continuousButton.rx.tap
            .map { Reactor.Action.continuousButtonTapped }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        tapGesture.rx.event
            .map { _ in Reactor.Action.dimmedViewTapped}
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        swipeGesture.rx.event
            .map { _ in Reactor.Action.swipeGesturePerformed }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    private func bindState(reactor: SelectMeetingTypeReactor) {
        reactor.state
            .map { $0.isDismissed }
            .filter{ $0 }
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] _ in
                self?.dismissAnimation()
            })
            .disposed(by: disposeBag)
    }
}
