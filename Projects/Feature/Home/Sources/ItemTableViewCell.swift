//
//  ItemCell.swift
//  FeatureHome
//
//  Created by yoonyeosong on 2023/12/07.
//

import UIKit
import SnapKit
import Shared

class ItemTableViewCell: UITableViewCell {

    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.thumb3.image
        return imageView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "상어"
        label.textColor = SharedDSKitAsset.Colors.text01.color
        label.font = Fonts.SH02Bold.font
        return label
    }()
    
    let tagButton: UIButton  = {
        let button = UIButton()
        button.titleLabel?.font = Fonts.ST01.font
        button.layer.cornerRadius = 12
        return button
    }()

    let categoryButton: UIButton = {
        let button = UIButton()
        button.setTitle("# 사이드프로젝트", for: .normal)
        button.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
        button.setTitleColor(SharedDSKitAsset.Colors.text02.color, for: .normal)
        button.titleLabel?.font = Fonts.ST01.font
        button.layer.cornerRadius = 12
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraint()
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder): has not been implemented")
    }
    
    private func setConstraint() {
        contentView.addSubview(itemImageView)
        contentView.addSubview(label)
        contentView.addSubview(tagButton)
        contentView.addSubview(categoryButton)
        
        itemImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(tagButton.snp.bottom).offset(10)
            make.leading.equalTo(itemImageView.snp.trailing).offset(10)
            make.trailing.equalToSuperview()
        }
        
        tagButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(itemImageView.snp.trailing).offset(10)
            make.width.equalTo(45)
            make.height.equalTo(25)
        }
        
        categoryButton.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(20)
            make.leading.equalTo(itemImageView.snp.trailing).offset(10)
            make.width.equalTo(99)
            make.height.equalTo(25)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
