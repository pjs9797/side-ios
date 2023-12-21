//
//  UIView+Extension.swift
//  SharedDSKit
//
//  Created by 강민성 on 11/16/23.
//

import UIKit

extension UIView {
    public func addSubViews<T: UIView>(_ subviews: [T], completionHandler closure: (([T]) -> Void)? = nil) {
        subviews.forEach { addSubview($0) }
        closure?(subviews)
    }
}
