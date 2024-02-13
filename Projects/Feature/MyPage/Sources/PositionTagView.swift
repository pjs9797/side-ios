//
//  PositionTagView.swift
//  FeatureMyPageInterface
//
//  Created by coco on 2023/12/26.
//

import UIKit
import Shared
import AVFoundation

class PositionTagView: UIView {
    private var tagButtons = [UIButton]()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    @objc private func buttonClicked(sender: UIButton) {
        print(#function)
    }

    func addTag(tag: String, image: UIImage) {
        var configuration = UIButton.Configuration.plain()
        configuration.imagePlacement = .leading
        configuration.image = image.resize(16, 16)
        configuration.imagePadding = 8

        let tagButton = UIButton(configuration: configuration)
        tagButton.backgroundColor = SharedDSKitAsset.Colors.bgGray.color
        tagButton.layer.borderColor = SharedDSKitAsset.Colors.bgGray.color.cgColor
        tagButton.layer.borderWidth = 1
        tagButton.layer.cornerRadius = 20
        tagButton.imageView?.contentMode = .center

        let attribute = NSAttributedString(string: tag, attributes: [.font: Fonts.SH01.font, .foregroundColor: SharedDSKitAsset.Colors.gr100.color])
        tagButton.setAttributedTitle(attribute, for: .normal)
        tagButton.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        
        self.addSubview(tagButton)
        tagButtons.append(tagButton)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        let horizontalSpacing: CGFloat = 8
        let verticalSpacing: CGFloat = 8
        let tagHeight: CGFloat = 40
        let maxWidth = self.frame.width
        var xOffset: CGFloat = horizontalSpacing
        var yOffset: CGFloat = verticalSpacing

        tagButtons.forEach { button in
            let buttonSize = button.intrinsicContentSize.width + 16
            
            if xOffset + buttonSize + horizontalSpacing > maxWidth {
                xOffset = horizontalSpacing
                yOffset += tagHeight + verticalSpacing
            }
            
            button.frame = CGRect(x: xOffset, y: yOffset, width: buttonSize, height: tagHeight)
            xOffset += buttonSize + horizontalSpacing
        }
    }
}

extension UIImage {
    func resize (_ width: Int, _ height: Int) -> UIImage {
        let maxSize = CGSize(width: width, height: height)
        let availableRect = AVFoundation.AVMakeRect(aspectRatio: self.size, insideRect: .init(origin: .zero, size: maxSize))
        let targetSize = availableRect.size
        let format = UIGraphicsImageRendererFormat()
        format.scale = 1
        let renderer = UIGraphicsImageRenderer(size: targetSize, format: format)
        let resize = renderer.image { _  in
            self.draw(in: CGRect (origin: .zero, size: targetSize))
        }
        return resize
    }
}
