import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Shared

class HobbyDetailTableViewCell: UITableViewCell {
    var disposeBag = DisposeBag()
<<<<<<< HEAD
    let backView: UIView = {
=======
    
    lazy var backView: UIView = {
>>>>>>> 9e05e25 ([FEAT] 모임생성-취미 화면 개발)
        let view = UIView()
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 1
        view.layer.borderColor = SharedDSKitAsset.Colors.gr10.color.cgColor
        return view
    }()
<<<<<<< HEAD
    let titleLabel: UILabel = {
=======
    
    lazy var titleLabel: UILabel = {
>>>>>>> 9e05e25 ([FEAT] 모임생성-취미 화면 개발)
        let label = UILabel()
        label.font = Fonts.SH02Bold.font
        return label
    }()
<<<<<<< HEAD
    let plusButton: UIButton = {
=======
    
    lazy var plusButton: UIButton = {
>>>>>>> 9e05e25 ([FEAT] 모임생성-취미 화면 개발)
        let button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconArrowPlus24.image, for: .normal)
        return button
    }()
<<<<<<< HEAD
=======
    
>>>>>>> 9e05e25 ([FEAT] 모임생성-취미 화면 개발)
    lazy var hobbyDetailCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 56, height: 77)
<<<<<<< HEAD
<<<<<<< HEAD
        layout.minimumLineSpacing = 20
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HobbyDetailCollectionViewCell.self, forCellWithReuseIdentifier: "HobbyDetailCollectionViewCell")
        collectionView.isScrollEnabled = false
        collectionView.isHidden = true
        return collectionView
    }()
=======
        //        let screenWidth = UIScreen.main.bounds.width
        //        let lineSpacing = (screenWidth - 312) / 3
=======
>>>>>>> 67ee1ca ([FEAT] 모임 생성 타입 화면 개발)
        layout.minimumLineSpacing = 20
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HobbyDetailCollectionViewCell.self, forCellWithReuseIdentifier: "HobbyDetailCollectionViewCell")
        collectionView.isScrollEnabled = false
        collectionView.isHidden = true
        return collectionView
    }()
    
>>>>>>> 9e05e25 ([FEAT] 모임생성-취미 화면 개발)
    var myIndexPath: IndexPath?
    let heightDidChange = PublishRelay<Void>()
    let selectedIndexPath = BehaviorRelay<(tableCellIndexPath: IndexPath, collectionViewIndexPath: IndexPath)?>(value: nil)
    
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
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
            make.leading.equalTo(contentView.snp.leading).offset(20)
            make.trailing.equalTo(contentView.snp.trailing).offset(-20)
            make.top.equalTo(contentView.snp.top).offset(4)
            make.bottom.equalTo(contentView.snp.bottom).offset(-4)
<<<<<<< HEAD
        }
        
        titleLabel.snp.makeConstraints { make in
            make.height.equalTo(22)
=======
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(4)
            make.bottom.equalToSuperview().offset(-4)
        }
        
        titleLabel.snp.makeConstraints { make in
<<<<<<< HEAD
>>>>>>> 9e05e25 ([FEAT] 모임생성-취미 화면 개발)
=======
            make.height.equalTo(24)
>>>>>>> 67ee1ca ([FEAT] 모임 생성 타입 화면 개발)
=======
        }
        
        titleLabel.snp.makeConstraints { make in
            make.height.equalTo(22)
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
            make.leading.equalToSuperview().offset(24)
            make.top.equalToSuperview().offset(24)
        }
        
        plusButton.snp.makeConstraints { make in
<<<<<<< HEAD
<<<<<<< HEAD
            make.width.height.equalTo(24)
=======
>>>>>>> 9e05e25 ([FEAT] 모임생성-취미 화면 개발)
=======
            make.width.height.equalTo(24)
>>>>>>> 67ee1ca ([FEAT] 모임 생성 타입 화면 개발)
            make.trailing.equalToSuperview().offset(-24)
            make.top.equalToSuperview().offset(24)
        }
        
        hobbyDetailCollectionView.snp.makeConstraints { make in
            //make.height.equalTo(0)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.bottom.equalToSuperview().offset(-4)
        }
=======
            make.top.equalToSuperview().offset(62)
            make.height.equalTo(0)
=======
            make.top.equalToSuperview().offset(58)
            //make.bottom.equalToSuperview().offset(-14)
>>>>>>> 67ee1ca ([FEAT] 모임 생성 타입 화면 개발)
=======
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.bottom.equalToSuperview().offset(-4)
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
        }
        
>>>>>>> 9e05e25 ([FEAT] 모임생성-취미 화면 개발)
    }
    
    func configure(model: HobbyModel){
        titleLabel.text = model.title
<<<<<<< HEAD
<<<<<<< HEAD
        plusButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
=======
        
        plusButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                
>>>>>>> 9e05e25 ([FEAT] 모임생성-취미 화면 개발)
=======
        plusButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
>>>>>>> 5e24642 ([FEAT] 모임 생성 마지막 페이지 개발)
                let itemCount = model.hobbyDetailModel.count
                let rowHeight: CGFloat = 77
                let spacing: CGFloat = 20
                let rows = CGFloat((itemCount + 3) / 4)
                let collectionViewHeight = rows * rowHeight + (rows - 1) * spacing
<<<<<<< HEAD
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
=======
                
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
                    
                    self.heightDidChange.onNext(())
                    self.contentView.layoutIfNeeded()
                })
                
                
>>>>>>> 9e05e25 ([FEAT] 모임생성-취미 화면 개발)
            })
            .disposed(by: disposeBag)
        
        Driver.just(model.hobbyDetailModel)
            .drive(hobbyDetailCollectionView.rx.items(cellIdentifier: "HobbyDetailCollectionViewCell", cellType: HobbyDetailCollectionViewCell.self)) { index, detailModel, cell in
                cell.configure(model: detailModel)
            }
            .disposed(by: disposeBag)
<<<<<<< HEAD
=======
        
>>>>>>> 9e05e25 ([FEAT] 모임생성-취미 화면 개발)
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
<<<<<<< HEAD
=======
    
>>>>>>> 9e05e25 ([FEAT] 모임생성-취미 화면 개발)
}

