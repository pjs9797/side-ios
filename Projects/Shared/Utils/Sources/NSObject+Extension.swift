//
//  NSObject+Extension.swift
//  SharedUtils
//
//  Created by 강민성 on 11/21/23.
//

import Foundation

public extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
