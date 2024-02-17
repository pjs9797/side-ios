import UIKit
import RxSwift
import RxCocoa
import ReactorKit
import SnapKit
import Shared

class SelectPositionViewController: UIViewController, ReactorKit.View {
     var disposeBag = DisposeBag()
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
    let positionLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.SH03Bold.font
        label.text = "직무"
        return label
    }()
    let positionCollectionView: UICollectionView = {
        let layout = LeftAlignedCollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8*Constants.standardHeight
        layout.minimumInteritemSpacing = 8*Constants.standardWidth
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PositionCollectionViewCell.self, forCellWithReuseIdentifier: "PositionCollectionViewCell")
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    init(with reactor: SelectPositionReactor) {
        super.init(nibName: nil, bundle: nil)

        self.reactor = reactor
        self.modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        tapEvent()
        layout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
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
        [handleView,positionLabel,positionCollectionView]
            .forEach{ self.backView.addSubview($0) }
        
        dimmedView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        backView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(598*Constants.standardHeight)
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        handleView.snp.makeConstraints { make in
            make.width.equalTo(56*Constants.standardWidth)
            make.height.equalTo(5*Constants.standardHeight)
            make.top.equalToSuperview().offset(8*Constants.standardHeight)
            make.centerX.equalToSuperview()
        }
        
        positionLabel.snp.makeConstraints { make in
            make.height.equalTo(25*Constants.standardHeight)
            make.leading.equalToSuperview().offset(20*Constants.standardWidth)
            make.top.equalTo(handleView.snp.bottom).offset(40*Constants.standardHeight)
        }
        
        positionCollectionView.snp.makeConstraints { make in
            make.height.equalTo(472*Constants.standardHeight)
            make.leading.equalToSuperview().offset(20*Constants.standardWidth)
            make.trailing.equalToSuperview().offset(-20*Constants.standardWidth)
            make.top.equalTo(positionLabel.snp.bottom).offset(16*Constants.standardHeight)
        }
    }
}

extension SelectPositionViewController {
    func bind(reactor: SelectPositionReactor) {
        bindAction(reactor: reactor)
        bindState(reactor: reactor)
    }
    
    private func bindAction(reactor: SelectPositionReactor) {
        positionCollectionView.rx.setDelegate(self)
            .disposed(by: disposeBag)
        
        positionCollectionView.rx.itemSelected
            .map { Reactor.Action.selectPosition($0) }
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
    
    private func bindState(reactor: SelectPositionReactor) {
        reactor.state.map{ $0.cellData }
            .bind(to: positionCollectionView.rx.items(cellIdentifier: "PositionCollectionViewCell", cellType: PositionCollectionViewCell.self)){ row, item, cell in
                let cellReactor = PositionCollectionViewReactor(image: item.image, title: item.title)
                cell.reactor = cellReactor
            }
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isDismissed }
            .filter{ $0 }
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] _ in
                self?.dismissAnimation()
            })
            .disposed(by: disposeBag)
    }
}

extension SelectPositionViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let text = self.reactor?.currentState.cellData[indexPath.item].title ?? ""
        let font = Fonts.ST01.font
        let textAttributes = [NSAttributedString.Key.font: font]
        let estimatedTextSize = NSString(string: text).boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: 20*Constants.standardHeight),options: .usesLineFragmentOrigin,attributes: textAttributes,context: nil).size
        let cellPadding: CGFloat = 60*Constants.standardWidth
        let cellWidth = estimatedTextSize.width + cellPadding
        let cellHeight: CGFloat = 40*Constants.standardHeight
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
