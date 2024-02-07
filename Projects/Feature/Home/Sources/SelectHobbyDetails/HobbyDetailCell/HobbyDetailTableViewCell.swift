import UIKit
import RxSwift
import RxCocoa
import ReactorKit
import SnapKit
import Shared

class HobbyDetailTableViewCell: UITableViewCell, ReactorKit.View{
    public var disposeBag = DisposeBag()
    var myIndexPath: IndexPath?
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
        layout.itemSize = CGSize(width: 56, height: 77)
        layout.minimumLineSpacing = 20
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HobbyDetailCollectionViewCell.self, forCellWithReuseIdentifier: "HobbyDetailCollectionViewCell")
        collectionView.isScrollEnabled = false
        collectionView.isHidden = true
        return collectionView
    }()
    private var backViewHeightConstraint: Constraint?
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
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(4)
            make.bottom.equalToSuperview().offset(-4)
            self.backViewHeightConstraint = make.height.greaterThanOrEqualTo(72).constraint
        }
        
        titleLabel.snp.makeConstraints { make in
            make.height.equalTo(22)
            make.leading.equalToSuperview().offset(24)
            make.top.equalToSuperview().offset(24)
        }
        
        plusButton.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.trailing.equalToSuperview().offset(-24)
            make.top.equalToSuperview().offset(24)
        }
        
        hobbyDetailCollectionView.snp.makeConstraints { make in
            make.height.equalTo(277)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
    }
    
//    func updateBorderViews(selectedIndexPath: IndexPath) {
//        for cell in self.hobbyDetailCollectionView.visibleCells as? [HobbyDetailCollectionViewCell] ?? [] {
//            print(cell,self.hobbyDetailCollectionView.indexPath(for: cell))
//            if let cellIndexPath = self.hobbyDetailCollectionView.indexPath(for: cell) {
//                let isSelected = selectedIndexPath == cellIndexPath
//                print(cellIndexPath,isSelected)
//                cell.setSelectedState(isSelected: isSelected)
//                self.hobbyDetailCollectionView.reloadItems(at: [selectedIndexPath])
//            }
    //        }
    //    }
    func updateBorderViews(selectedIndexPath: IndexPath) {
        print(selectedIndexPath)
        print("Visible Cells Count: \(self.hobbyDetailCollectionView.visibleCells.count)")
        print("Number of Items: \(self.hobbyDetailCollectionView.numberOfItems(inSection: 0))")

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
        titleLabel.text = reactor.initialState.hobbyModel.title
        
        plusButton.rx.tap
            .map { Reactor.Action.toggleCollectionView }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
//        hobbyDetailCollectionView.rx.itemSelected
//            .map{ Reactor.Action.selectCollectionViewItem($0) }
//            .bind(to: reactor.action)
//            .disposed(by: disposeBag)
    }
    
    private func bindState(reactor: HobbyDetailTableViewCellReactor){
        reactor.state.map { $0.isCollectionViewHidden }
            .bind(to: hobbyDetailCollectionView.rx.isHidden)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.collectionViewHeight }
            .distinctUntilChanged()
            .bind(onNext: { [weak self] height in
                
                if height == 0 {
                    self?.plusButton.setImage(SharedDSKitAsset.Icons.iconArrowPlus24.image, for: .normal)
                } else {
                    self?.plusButton.setImage(SharedDSKitAsset.Icons.iconArrowFold24.image, for: .normal)
                }
                UIView.animate(withDuration: 0.3) {
                    self?.hobbyDetailCollectionView.snp.updateConstraints { make in
                        make.height.equalTo(height)
                    }
                    self?.backViewHeightConstraint?.update(offset: 72 + height)
                }
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.hobbyDetailModels }
            .take(1)
            .bind(to: hobbyDetailCollectionView.rx.items(cellIdentifier: "HobbyDetailCollectionViewCell", cellType: HobbyDetailCollectionViewCell.self)) { index, detailModel, cell in
                cell.configure(model: detailModel)
            }
            .disposed(by: disposeBag)
        
        reactor.state.map{ $0.currentCollectionViewIndexPath }
            .bind(onNext: { [weak self] selectionInfo in
                guard let self = self else { return }
                if let selectionInfo = selectionInfo, selectionInfo.tableViewIndexPath == self.myIndexPath {
                    self.updateBorderViews(selectedIndexPath: selectionInfo.collectionViewIndexPath)
                } else {
                    self.updateBorderViews(selectedIndexPath: IndexPath(row: -1, section: 0))
                }
            })
            .disposed(by: disposeBag)
        
    }
}
