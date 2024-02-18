import UIKit
import RxSwift
import RxCocoa
import ReactorKit
import SnapKit
import Shared

class HobbyDetailTableViewCell: UITableViewCell, ReactorKit.View{
    public var disposeBag = DisposeBag()
    let backView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 1
        view.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        return view
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.SH02Bold.font
        return label
    }()
    let plusButton: UIButton = {
        let button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconArrowPlus24.image, for: .normal)
        return button
    }()
    let hobbyDetailCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 56*Constants.standardWidth, height: 77*Constants.standardHeight)
        layout.minimumLineSpacing = 20*Constants.standardHeight
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HobbyDetailCollectionViewCell.self, forCellWithReuseIdentifier: "HobbyDetailCollectionViewCell")
        collectionView.isScrollEnabled = false
        collectionView.isHidden = true
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        disposeBag = DisposeBag()
    }
    
    private func layout(){
        self.contentView.addSubview(backView)
        [titleLabel,plusButton,hobbyDetailCollectionView]
            .forEach { backView.addSubview($0) }
        
        backView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20*Constants.standardWidth)
            make.trailing.equalToSuperview().offset(-20*Constants.standardWidth)
            make.top.equalToSuperview().offset(4*Constants.standardHeight)
            make.bottom.equalToSuperview().offset(-4*Constants.standardHeight)
            make.height.equalTo(72*Constants.standardHeight).priority(.high)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.height.equalTo(22*Constants.standardHeight)
            make.leading.equalToSuperview().offset(24*Constants.standardWidth)
            make.top.equalToSuperview().offset(24*Constants.standardHeight)
        }
        
        plusButton.snp.makeConstraints { make in
            make.width.height.equalTo(24*Constants.standardHeight)
            make.trailing.equalToSuperview().offset(-24*Constants.standardWidth)
            make.centerY.equalTo(titleLabel)
        }
        
        hobbyDetailCollectionView.snp.makeConstraints { make in
            make.height.equalTo(0)
            make.leading.equalToSuperview().offset(24*Constants.standardWidth)
            make.trailing.equalToSuperview().offset(-24*Constants.standardWidth)
            make.top.equalToSuperview().offset(72*Constants.standardHeight)
        }
    }
    
    func updateBorderViews(selectedIndexPath: IndexPath) {
        for cell in self.hobbyDetailCollectionView.visibleCells as? [HobbyDetailCollectionViewCell] ?? [] {
            let isSelected = selectedIndexPath == self.hobbyDetailCollectionView.indexPath(for: cell)
            cell.setSelectedState(isSelected: isSelected)
        }
    }
}

extension HobbyDetailTableViewCell{
    func bind(reactor: HobbyDetailTableViewCellReactor) {
        bindAction(reactor: reactor)
        bindState(reactor: reactor)
    }
    
    private func bindAction(reactor: HobbyDetailTableViewCellReactor){
        plusButton.rx.tap
            .map { Reactor.Action.toggleCollectionView }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    private func bindState(reactor: HobbyDetailTableViewCellReactor){
        reactor.state.map{ $0.title }
            .distinctUntilChanged()
            .bind(to: titleLabel.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isCollectionViewHidden }
            .bind(onNext: { [weak self] status in
                self?.hobbyDetailCollectionView.isHidden = status
                self?.layoutIfNeeded()
                if status {
                    self?.plusButton.setImage(SharedDSKitAsset.Icons.iconArrowPlus24.image, for: .normal)
                } else {
                    self?.plusButton.setImage(SharedDSKitAsset.Icons.iconArrowFold24.image, for: .normal)
                }
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.hobbyDetailModels }
            .take(1)
            .bind(to: hobbyDetailCollectionView.rx.items(cellIdentifier: "HobbyDetailCollectionViewCell", cellType: HobbyDetailCollectionViewCell.self)) { index, detailModel, cell in
                let cellReactor = HobbyDetailCollectionViewCellReactor(hobbyDetailModel: detailModel)
                cell.reactor = cellReactor
            }
            .disposed(by: disposeBag)
        
        reactor.state.map{ $0.currentCollectionViewIndexPath }
            .bind(onNext: { [weak self] selectionInfo in
                if let selectionInfo = selectionInfo, selectionInfo.tableViewIndexPath == reactor.currentState.tableViewIndexPath {
                    self?.updateBorderViews(selectedIndexPath: selectionInfo.collectionViewIndexPath)
                }
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.collectionViewHeight }
            .distinctUntilChanged()
            .bind(onNext: { [weak self] height in
                UIView.animate(withDuration: 0.3){
                    
                    self?.hobbyDetailCollectionView.snp.updateConstraints { make in
                        make.height.equalTo(height*Constants.standardHeight)
                    }
                    self?.backView.snp.updateConstraints{ make in
                        make.height.equalTo((72+height)*Constants.standardHeight).priority(.high)
                    }
                    //self?.layoutIfNeeded()
                }
            })
            .disposed(by: disposeBag)
    }
}
