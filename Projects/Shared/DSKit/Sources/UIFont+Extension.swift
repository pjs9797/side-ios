//
//  UIFont+Extension.swift
//  SharedDSKit
//
//  Created by 강민성 on 11/13/23.
//

import UIKit

extension UIFont {
    enum FontFamily: String {
        case bold = "Pretendard-Bold"
        case medium = "Pretendard-Medium"
        case regular = "Pretendard-Regular"
        
        var name: String {
            return self.rawValue
        }
        
        static func font(_ family: FontFamily, ofsize size: CGFloat) -> UIFont {
            return UIFont(name: family.rawValue, size: size)!
        }
    }
}

public struct FontProperty {
    let font: UIFont.FontFamily
    let size: CGFloat
    let kern: CGFloat
    let lineHeight: CGFloat?
}

public enum Fonts {
    case H07
    case H06
    case H05
    case H04
    case H03
    case H02
    case H01
    
    case SH03
    case SH03Bold
    case SH02
    case SH02Bold
    case SH01
    case SH01Bold
    
    case ST01
    
    case Body03
    case Body02
    case Body01
    
    case Caption
    
    public var fontProperty: FontProperty {
        switch self {
            
        case .H07:
            return FontProperty(font: .bold, size: 56, kern: -0.3, lineHeight: 72.8)
        case .H06:
            return FontProperty(font: .bold, size: 48, kern: -0.3, lineHeight: 62.4)
        case .H05:
            return FontProperty(font: .bold, size: 40, kern: -0.3, lineHeight: 52)
        case .H04:
            return FontProperty(font: .bold, size: 32, kern: -0.3, lineHeight: 41.6)
        case .H03:
            return FontProperty(font: .bold, size: 28, kern: -0.3, lineHeight: 39.2)
        case .H02:
            return FontProperty(font: .bold, size: 24, kern: -0.3, lineHeight: 33.6)
        case .H01:
            return FontProperty(font: .bold, size: 20, kern: -0.3, lineHeight: 28)
        case .SH03:
            return FontProperty(font: .medium, size: 18, kern: -0.3, lineHeight: 25.2)
        case .SH03Bold:
            return FontProperty(font: .bold, size: 18, kern: -0.3, lineHeight: 25.2)
        case .SH02:
            return FontProperty(font: .medium, size: 16, kern: -0.3, lineHeight: 22.4)
        case .SH02Bold:
            return FontProperty(font: .bold, size: 16, kern: -0.3, lineHeight: 22.4)
        case .SH01:
            return FontProperty(font: .medium, size: 14, kern: -0.3, lineHeight: 19.6)
        case .SH01Bold:
            return FontProperty(font: .bold, size: 14, kern: -0.3, lineHeight: 19.6)
        case .ST01:
            return FontProperty(font: .bold, size: 12, kern: -0.3, lineHeight: 16.8)
        case .Body03:
            return FontProperty(font: .regular, size: 18, kern: -0.3, lineHeight: 27)
        case .Body02:
            return FontProperty(font: .regular, size: 16, kern: -0.3, lineHeight: 24)
        case .Body01:
            return FontProperty(font: .regular, size: 14, kern: -0.3, lineHeight: 21)
        case .Caption:
            return FontProperty(font: .regular, size: 12, kern: 0, lineHeight: 16.8)
        }
    }
}

public extension Fonts {
    var font: UIFont {
        guard let font = UIFont(name: fontProperty.font.name, size: fontProperty.size) else {
            return UIFont()
        }
        return font
    }
}
