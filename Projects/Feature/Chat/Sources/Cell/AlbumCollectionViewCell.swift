//
//  AlbumCollectionViewCell.swift
//  FeatureChatInterface
//
//  Created by 강민성 on 12/13/23.
//

import UIKit
import Shared

class AlbumCollectionViewCell: UICollectionViewCell {
    
    var photoImageView: UIImageView = {
       var imageView = UIImageView()
        imageView.image = SharedDSKitAsset.Icons.testPhoto.image
        imageView.layer.cornerRadius = 16
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.frame = frame
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render() {
        addSubViews([photoImageView])
        
        photoImageView.snp.makeConstraints { make in
            make.size.equalTo(65)
        }
    }
    
}
