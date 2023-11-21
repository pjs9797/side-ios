//
//  ChatSegmentedControl.swift
//  FeatureChat
//
//  Created by 강민성 on 11/21/23.
//

import UIKit
import Shared

class UnderlineSegmentedControl: UISegmentedControl {
    private lazy var underlineView: UIView = {
        let width = self.bounds.width / 2
        let height = 2.0
        let xPosition = CGFloat(self.selectedSegmentIndex * Int(width))
        let yPosition = self.bounds.height - 1.0
        var frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
        var view = UIView(frame: frame)
        view.backgroundColor = SharedDSKitAsset.Colors.bgLightGreen.color
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }
    
    override init(items: [Any]?) {
        super.init(items: items)
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func render() {
        let image = UIImage()
        self.setBackgroundImage(image, for: .normal, barMetrics: .default)
        self.setBackgroundImage(image, for: .selected, barMetrics: .default)
        self.setBackgroundImage(image, for: .highlighted, barMetrics: .default)
        self.setDividerImage(image, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let underlineXPosition = (self.bounds.width / 2.0) * CGFloat(self.selectedSegmentIndex)
        UIView.animate(
            withDuration: 0.1,
            animations: {
                self.underlineView.frame.origin.x = underlineXPosition
            }
        )
    }
}
