//
//  CodingCustomTableViewCell.swift
//  FeatureHome
//
//  Created by yoonyeosong on 2023/12/05.
//

import UIKit
import Shared

class CodingCustomTableViewCell: UITableViewCell {
    let image: UIImageView = {
        let image = UIImageView()
        image.image = SharedDSKitAsset.Icons.thumb3.image
        return image
    }()
   
    
    let label: UILabel = {
        let label = UILabel()
        label.font = Fonts.SH02Bold.font
        return label
    }()
    
    let categoryButton: UIButton = {
        let button = UIButton()
        button.setTitle("# 사이드프로젝트", for: .normal)
        button.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
        button.setTitleColor(SharedDSKitAsset.Colors.text02.color, for: .normal)
        button.titleLabel?.font = Fonts.ST01.font
        button.layer.cornerRadius = 16
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraint()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraint() {
       
        contentView.addSubview(label)
        contentView.addSubview(image)
        contentView.addSubview(categoryButton)
     
        image.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
            
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        
        label.snp.makeConstraints { make in
            make.leading.equalTo(image.snp.trailing).offset(10)
            make.top.equalTo(image.snp.top)
            
            make.trailing.equalToSuperview().offset(30)
            
        }
        categoryButton.snp.makeConstraints { make in
            make.bottom.equalTo(image.snp.bottom)
            make.leading.equalTo(label.snp.leading)
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
