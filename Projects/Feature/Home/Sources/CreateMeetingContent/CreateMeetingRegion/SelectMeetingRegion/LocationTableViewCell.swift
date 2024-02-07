//import UIKit
//import RxSwift
//import RxCocoa
//import ReactorKit
//import SnapKit
//import Shared
//
//class LocationTableViewCell: UITableViewCell, ReactorKit.View{
//    public var disposeBag = DisposeBag()
//    let locationButton: UIButton = {
//        let button = UIButton()
//        button.setImage(SharedDSKitAsset.Icons.iconArrowPlus24.image, for: .normal)
//        return button
//    }()
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        selectionStyle = .none
//        layout()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        
//        disposeBag = DisposeBag()
//    }
//    
//    private func layout(){
//        self.contentView.addSubview(locationButton)
//        
//        locationButton.snp.makeConstraints { make in
//            
//        }
//    }
//    
////    func configure(model: HobbyModel){
////        titleLabel.text = model.title
////    }
////        plusButton.rx.tap
////            .subscribe(onNext: { [weak self] in
////                guard let self = self else { return }
////                let itemCount = model.hobbyDetailModel.count
////                let rowHeight: CGFloat = 77
////                let spacing: CGFloat = 20
////                let rows = CGFloat((itemCount + 3) / 4)
////                let collectionViewHeight = rows * rowHeight + (rows - 1) * spacing
////                let isCurrentlyHidden = self.hobbyDetailCollectionView.isHidden
////                let newHeight = isCurrentlyHidden ? collectionViewHeight : 0
////                let buttonImageName = isCurrentlyHidden ? SharedDSKitAsset.Icons.iconArrowFold24.image : SharedDSKitAsset.Icons.iconArrowPlus24.image
////                self.plusButton.setImage(buttonImageName, for: .normal)
////                self.hobbyDetailCollectionView.isHidden = !isCurrentlyHidden
////                UIView.animate(withDuration: 0.3, animations: {
////                    self.backViewHeightConstraint?.update(offset: 72 + newHeight)
////                    self.hobbyDetailCollectionView.snp.updateConstraints { make in
////                        make.height.equalTo(newHeight)
////                    }
////                    self.heightDidChange.accept(())
////                    self.contentView.layoutIfNeeded()
////                })
////            })
////            .disposed(by: disposeBag)
////
////        Driver.just(model.hobbyDetailModel)
////            .drive(hobbyDetailCollectionView.rx.items(cellIdentifier: "HobbyDetailCollectionViewCell", cellType: HobbyDetailCollectionViewCell.self)) { index, detailModel, cell in
////                cell.configure(model: detailModel)
////            }
////            .disposed(by: disposeBag)
////    }
//    
////    func bind(){
////        SharedSelectHobbyState.shared.selectedIndexPath
////            .subscribe(onNext: { [weak self] selectionInfo in
////                guard let self = self else { return }
////                if let selectionInfo = selectionInfo, selectionInfo.tableCellIndexPath == self.myIndexPath {
////                    self.updateBorderViews(selectedIndexPath: selectionInfo.collectionViewIndexPath)
////                } else {
////                    self.updateBorderViews(selectedIndexPath: IndexPath(row: -1, section: 0))
////                }
////            })
////            .disposed(by: disposeBag)
////    }
//    
////    func updateBorderViews(selectedIndexPath: IndexPath) {
////        for cell in self.hobbyDetailCollectionView.visibleCells as? [HobbyDetailCollectionViewCell] ?? [] {
////            let isSelected = selectedIndexPath == self.hobbyDetailCollectionView.indexPath(for: cell)
////            print(self.hobbyDetailCollectionView.indexPath(for: cell),isSelected,self.hobbyDetailCollectionView.indexPath(for: cell)?.item)
////            cell.setSelectedState(isSelected: isSelected)
////        }
////    }
//    func updateBorderViews(selectedIndexPath: IndexPath) {
//        for cell in self.hobbyDetailCollectionView.visibleCells as? [HobbyDetailCollectionViewCell] ?? [] {
//            if let cellIndexPath = self.hobbyDetailCollectionView.indexPath(for: cell) {
//                let isSelected = selectedIndexPath == cellIndexPath
//                print(cellIndexPath,isSelected)
//                cell.setSelectedState(isSelected: isSelected)
//                self.hobbyDetailCollectionView.reloadItems(at: [selectedIndexPath])
//            }
//        }
//    }
//
//}
//
//extension HobbyDetailTableViewCell{
//    func bind(reactor: HobbyDetailTableViewCellReactor) {
//        bindAction(reactor: reactor)
//        bindState(reactor: reactor)
//    }
//    
//    private func bindAction(reactor: HobbyDetailTableViewCellReactor){
//        titleLabel.text = reactor.initialState.hobbyModel.title
//        
//        plusButton.rx.tap
//            .map { Reactor.Action.toggleCollectionView }
//            .bind(to: reactor.action)
//            .disposed(by: disposeBag)
//        
////        hobbyDetailCollectionView.rx.itemSelected
////               .subscribe(onNext: { [weak self] indexPath in
////                   self?.selectedIndexPath = indexPath
////                   self?.hobbyDetailCollectionView.reloadData()
////               })
////               .disposed(by: disposeBag)
//        
//        hobbyDetailCollectionView.rx.itemSelected
//            .map{ Reactor.Action.selectCollectionViewItem($0) }
//            .bind(to: reactor.action)
//            .disposed(by: disposeBag)
//    }
//    
//    private func bindState(reactor: HobbyDetailTableViewCellReactor){
//        reactor.state.map { $0.isCollectionViewHidden }
//            .bind(to: hobbyDetailCollectionView.rx.isHidden)
//            .disposed(by: disposeBag)
//        
//        reactor.state.map { $0.collectionViewHeight }
//            .distinctUntilChanged()
//            .bind(onNext: { [weak self] height in
//                self?.hobbyDetailCollectionView.snp.updateConstraints { make in
//                    make.height.equalTo(height)
//                }
//                self?.backViewHeightConstraint?.update(offset: 72 + height)
//                if height == 0 {
//                    self?.plusButton.setImage(SharedDSKitAsset.Icons.iconArrowPlus24.image, for: .normal)
//                } else {
//                    self?.plusButton.setImage(SharedDSKitAsset.Icons.iconArrowFold24.image, for: .normal)
//                }
//                UIView.animate(withDuration: 0.3) {
//                    self?.contentView.layoutIfNeeded()
//                }
//            })
//            .disposed(by: disposeBag)
//        
////        reactor.state.map{ $0.selectedIndexPath }
////            .bind(onNext: { [weak self] selectionInfo in
////                guard let self = self else { return }
////                if let selectionInfo = selectionInfo, selectionInfo.tableCellIndexPath == self.reactor?.currentState.myIndexPath {
////                    print("self.reactor?.currentState.myIndexPath",self.reactor?.currentState.myIndexPath)
////                    print("selectionInfo",selectionInfo)
////                    self.updateBorderViews(selectedIndexPath: selectionInfo.collectionViewIndexPath)
////                }
////            })
////            .disposed(by: disposeBag)
//        
//        
//        reactor.state.map { $0.hobbyDetailModels }
//            .bind(to: hobbyDetailCollectionView.rx.items(cellIdentifier: "HobbyDetailCollectionViewCell", cellType: HobbyDetailCollectionViewCell.self)) { index, detailModel, cell in
//                cell.configure(model: detailModel)
//                let isSelected = self.reactor?.currentState.currentCollectionViewIndexPath == IndexPath(row: index, section: 0)
//                cell.setSelectedState(isSelected: isSelected)
//            }
//            .disposed(by: disposeBag)
//        
//        
//    }
//}
