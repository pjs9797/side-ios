@_exported import SharedUtils
@_exported import SharedUtilsInterface
@_exported import SharedDSKit
@_exported import SharedThirdPartyLib

import UIKit

public struct CustomColor {
    // Black & White
    public static let black = hexColor(hex: "000000")
    public static let white = hexColor(hex: "FFFFFF")

    // Gray
    public static let gray100 = hexColor(hex: "000000", alpha: 1)
    public static let gray90 = hexColor(hex: "000000", alpha: 0.9)
    public static let gray80 = hexColor(hex: "000000", alpha: 0.8)
    public static let gray70 = hexColor(hex: "000000", alpha: 0.7)
    public static let gray60 = hexColor(hex: "000000", alpha: 0.6)
    public static let gray50 = hexColor(hex: "000000", alpha: 0.5)
    public static let gray40 = hexColor(hex: "000000", alpha: 0.4)
    public static let gray30 = hexColor(hex: "000000", alpha: 0.3)
    public static let gray20 = hexColor(hex: "000000", alpha: 0.2)
    public static let gray10 = hexColor(hex: "000000", alpha: 0.1)

    // Background Color
    public static let bgWhite = hexColor(hex: "FFFFFF")
    public static let bgGray = hexColor(hex: "F5F5F5")
    public static let bgGreen = hexColor(hex: "ECF4E2")
    public static let bgLightGreen = hexColor(hex: "F2F6EC")
    public static let bgLightGray = hexColor(hex: "F8F8F8")

    // Text Color
    public static let text01 = hexColor(hex: "111111")
    public static let text02 = hexColor(hex: "404040")
    public static let text03 = hexColor(hex: "6F6F6F")
    public static let textDisabled = hexColor(hex: "B5B5B5")

    // Primary
    public static let lightGreen = hexColor(hex: "68BE12")
    public static let green = hexColor(hex: "51A300")

    public static func rgbColor(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: r / 255, green: g / 255, blue: b / 255, alpha: alpha)
    }

    public static func hexColor(hex: String, alpha: CGFloat = 1) -> UIColor? {
        guard hex.count == 6 else { return .white }
        var rgbValue: UInt64 = 0

        Scanner(string: hex).scanHexInt64(&rgbValue)

        return UIColor.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255,
            blue: CGFloat(rgbValue & 0x0000FF) / 255,
            alpha: alpha)
    }
}
