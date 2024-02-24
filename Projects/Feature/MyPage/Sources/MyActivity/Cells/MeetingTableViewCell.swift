import UIKit
import RxSwift
import ReactorKit
import Shared
import SnapKit
import Kingfisher

class MeetingTableViewCell: UITableViewCell, ReactorKit.View {
    var disposeBag = DisposeBag()
    let meetingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 16*Constants.standardHeight
        imageView.clipsToBounds = true
        return imageView
    }()
    let typeButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = Fonts.ST01.font
        button.titleLabel?.textAlignment = .center
        button.contentEdgeInsets = UIEdgeInsets(top: 4*Constants.standardHeight, left: 12*Constants.standardWidth, bottom: 4*Constants.standardHeight, right: 12*Constants.standardWidth)
        button.layer.cornerRadius = 12.5*Constants.standardHeight
        return button
    }()
    let leaderImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.leader.image
        return imageView
    }()
    let bookmarkButton: UIButton = {
        let button = UIButton()
        button.setImage(SharedDSKitAsset.Icons.iconHeartcolor24.image, for: .normal)
        return button
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.SH02Bold.font
        return label
    }()
    let locationLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Caption.font
        label.textColor = SharedDSKitAsset.Colors.text03.color
        return label
    }()
    let pointLabel: UILabel = {
        let label = UILabel()
        label.text = " · "
        label.font = Fonts.Caption.font
        label.textColor = SharedDSKitAsset.Colors.text03.color
        return label
    }()
    let personImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.iconArrowUser16.image
        return imageView
    }()
    let memberNumberLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Caption.font
        label.textColor = SharedDSKitAsset.Colors.text03.color
        return label
    }()
    let categoryButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = Fonts.ST01.font
        button.setTitleColor(SharedDSKitAsset.Colors.text02.color, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.contentEdgeInsets = UIEdgeInsets(top: 4*Constants.standardHeight, left: 8*Constants.standardWidth, bottom: 4*Constants.standardHeight, right: 8*Constants.standardWidth)
        button.layer.cornerRadius = 12.5*Constants.standardHeight
        button.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
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
        [meetingImageView, typeButton, leaderImageView, bookmarkButton, titleLabel, locationLabel, pointLabel, personImageView, memberNumberLabel, categoryButton]
            .forEach{ self.contentView.addSubview($0) }
        
        meetingImageView.snp.makeConstraints { make in
            make.width.height.equalTo(100*Constants.standardHeight)
            make.leading.equalToSuperview()
            make.top.equalToSuperview().offset(15*Constants.standardHeight)
        }
        
        typeButton.snp.makeConstraints { make in
            make.height.equalTo(25*Constants.standardHeight)
            make.leading.equalTo(meetingImageView.snp.trailing).offset(16*Constants.standardWidth)
            make.top.equalTo(meetingImageView.snp.top)
        }
        
        leaderImageView.snp.makeConstraints { make in
            make.width.height.equalTo(16*Constants.standardHeight)
            make.leading.equalTo(typeButton.snp.trailing).offset(8*Constants.standardWidth)
            make.centerY.equalTo(typeButton)
        }
        
        bookmarkButton.snp.makeConstraints { make in
            make.width.height.equalTo(24*Constants.standardHeight)
            make.trailing.equalToSuperview()
            make.top.equalTo(meetingImageView.snp.top)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.height.equalTo(22*Constants.standardHeight)
            make.leading.equalTo(typeButton.snp.leading)
            make.top.equalTo(typeButton.snp.bottom).offset(8*Constants.standardHeight)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.height.equalTo(17*Constants.standardHeight)
            make.leading.equalTo(typeButton.snp.leading)
            make.top.equalTo(titleLabel.snp.bottom).offset(4*Constants.standardHeight)
        }
        
        pointLabel.snp.makeConstraints { make in
            make.centerY.equalTo(locationLabel)
            make.leading.equalTo(locationLabel.snp.trailing)
        }
        
        personImageView.snp.makeConstraints { make in
            make.centerY.equalTo(locationLabel)
            make.leading.equalTo(pointLabel.snp.trailing)
        }
        
        memberNumberLabel.snp.makeConstraints { make in
            make.centerY.equalTo(locationLabel)
            make.leading.equalTo(personImageView.snp.trailing).offset(2*Constants.standardWidth)
        }
        
        categoryButton.snp.makeConstraints { make in
            make.height.equalTo(25*Constants.standardHeight)
            make.leading.equalTo(typeButton.snp.leading)
            make.top.equalTo(locationLabel.snp.bottom).offset(8*Constants.standardHeight)
            make.bottom.equalToSuperview().offset(-15*Constants.standardHeight).priority(.medium)
        }
    }
}

extension MeetingTableViewCell{
    func bind(reactor: MeetingTableViewCellReactor) {
        reactor.state.map{ $0.meetingImage}
            .distinctUntilChanged()
            .bind(onNext: { [weak self] urlImage in
                self?.meetingImageView.kf.setImage(with:URL(string: urlImage), options: [.processor(RoundCornerImageProcessor(cornerRadius: 50*Constants.standardHeight))])
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.typeText }
            .distinctUntilChanged()
            .bind(onNext: { [weak self] text in
                self?.typeButton.setTitle(text, for: .normal)
                switch text{
                case "원데이":
                    self?.typeButton.backgroundColor = SharedDSKitAsset.Colors.oneDay.color
                case "단기":
                    self?.typeButton.backgroundColor = SharedDSKitAsset.Colors.short.color
                case "지속형":
                    self?.typeButton.backgroundColor = SharedDSKitAsset.Colors.continuous.color
                default:
                    break
                }
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isLeader }
            .map{ !$0 }
            .distinctUntilChanged()
            .bind(to: leaderImageView.rx.isHidden)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isBookmark }
            .map{ !$0 }
            .distinctUntilChanged()
            .bind(to: bookmarkButton.rx.isHidden)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.titleText }
            .distinctUntilChanged()
            .bind(to: titleLabel.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.locationText }
            .distinctUntilChanged()
            .bind(to: locationLabel.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.map{ ($0.currentMemberCnt, $0.maxMemberCnt) }
            .distinctUntilChanged { (prev, curr) in
                return prev.1 == curr.1
            }
            .bind(onNext: { [weak self] currentMemberCnt, maxMemberCnt in
                self?.memberNumberLabel.text = "\(currentMemberCnt) / \(maxMemberCnt)"
            })
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.categoryText }
            .distinctUntilChanged()
            .bind(onNext: { [weak self] text in
                self?.categoryButton.setTitle("# \(text)", for: .normal)
            })
            .disposed(by: disposeBag)
    }
}
