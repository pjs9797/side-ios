import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Shared

class HobbyDetailTableViewCell: UITableViewCell {
    var disposeBag = DisposeBag()
    var myIndexPath: IndexPath?
    let heightDidChange = PublishRelay<Void>()
    let selectedIndexPath = BehaviorRelay<(tableCellIndexPath: IndexPath, collectionViewIndexPath: IndexPath)?>(value: nil)
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
    lazy var hobbyDetailCollectionView: UICollectionView = {
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        bind()
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
            make.height.equalTo(72)
            make.leading.equalTo(contentView.snp.leading).offset(20)
            make.trailing.equalTo(contentView.snp.trailing).offset(-20)
            make.top.equalTo(contentView.snp.top).offset(4)
            make.bottom.equalTo(contentView.snp.bottom).offset(-4)
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
            make.height.equalTo(77)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
    }
    
    func configure(model: HobbyModel){
        titleLabel.text = model.title
        plusButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                let itemCount = model.hobbyDetailModel.count
                let rowHeight: CGFloat = 77
                let spacing: CGFloat = 20
                let rows = CGFloat((itemCount + 3) / 4)
                let collectionViewHeight = rows * rowHeight + (rows - 1) * spacing
                let isCurrentlyHidden = self.hobbyDetailCollectionView.isHidden
                let newHeight = isCurrentlyHidden ? collectionViewHeight : 0
                let buttonImageName = isCurrentlyHidden ? SharedDSKitAsset.Icons.iconArrowFold24.image : SharedDSKitAsset.Icons.iconArrowPlus24.image
                self.plusButton.setImage(buttonImageName, for: .normal)
                self.hobbyDetailCollectionView.isHidden = !isCurrentlyHidden
                UIView.animate(withDuration: 0.3, animations: {
                    self.backView.snp.updateConstraints { make in
                        make.height.equalTo(72 + newHeight)
                    }
                    self.hobbyDetailCollectionView.snp.updateConstraints { make in
                        make.height.equalTo(newHeight)
                    }
                    self.heightDidChange.accept(())
                    self.contentView.layoutIfNeeded()
                })
            })
            .disposed(by: disposeBag)
        
        Driver.just(model.hobbyDetailModel)
            .drive(hobbyDetailCollectionView.rx.items(cellIdentifier: "HobbyDetailCollectionViewCell", cellType: HobbyDetailCollectionViewCell.self)) { index, detailModel, cell in
                cell.configure(model: detailModel)
            }
            .disposed(by: disposeBag)
    }
    
    func bind(){
        SharedSelectHobbyState.shared.selectedIndexPath
            .subscribe(onNext: { [weak self] selectionInfo in
                guard let self = self else { return }
                if let selectionInfo = selectionInfo, selectionInfo.tableCellIndexPath == self.myIndexPath {
                    self.updateBorderViews(selectedIndexPath: selectionInfo.collectionViewIndexPath)
                } else {
                    self.updateBorderViews(selectedIndexPath: IndexPath(row: -1, section: 0))
                }
            })
            .disposed(by: disposeBag)
    }
    
    func updateBorderViews(selectedIndexPath: IndexPath) {
        for cell in self.hobbyDetailCollectionView.visibleCells as? [HobbyDetailCollectionViewCell] ?? [] {
            let isSelected = selectedIndexPath == self.hobbyDetailCollectionView.indexPath(for: cell)
            cell.setSelectedState(isSelected: isSelected)
        }
    }
}

