//
//  BaseButtonStyle.swift
//  BrandButtonDemo
//
//  Created by Abhishek Srivastava on 11/02/24.
//

import Foundation
import UIKit

public enum Size {
    case regular
    case medium
    case fullWidth
    
    func value() -> CGFloat {
        switch self {
        case .regular:
            return 158.0
        case .medium:
            return 199.0
        case .fullWidth:
            return UIScreen.main.bounds.width
        }
    }
}

public enum BaseButtonStyle {
    case primaryGreen
    case primaryBlue
    case secondaryGreen
    case secondaryBlue
    case none
    
    func getHeight() -> CGFloat { 44 }
    
    func getTitleColor() -> (normalColor: UIColor, highlightedColor: UIColor?, disabledColor: UIColor) {
        switch self {
        case .primaryGreen, .primaryBlue:
            return (Colors.primaryFontTitle, Colors.primaryFontTitle, Colors.primaryFontTitle)
        case .secondaryGreen:
            return (Colors.secondaryFontGreen, Colors.secondaryFontGreenPressed, Colors.secondaryFontDisabled)
        case .secondaryBlue:
            return (Colors.secondaryFontBlue, Colors.secondaryFontBluePressed, Colors.secondaryFontDisabled)
        case .none:
            return (.clear, .clear, .clear)
        }
    }
    
    func getFont() -> UIFont {
        UIFont.boldSystemFont(ofSize: 16.0)
    }
    
    func getBackgroundColor() -> (normalColor: UIColor, highlightedColor: UIColor?, disabledColor: UIColor) {
        switch self {
        case .primaryGreen:
            return (Colors.primaryDefaultGreenBG, Colors.primaryPressedGreenBG, Colors.primaryDisabledBG)
        case .primaryBlue:
            return (Colors.primaryDefaultBlueBG, Colors.primaryPressedBlueBG, Colors.primaryDisabledBG)
        case .secondaryGreen:
            return (Colors.secondaryDefaultBG, Colors.secondaryPressedGreenBG, Colors.secondaryDefaultBG)
        case .secondaryBlue:
            return (Colors.secondaryDefaultBG, Colors.secondaryPressedBlueBG, Colors.secondaryDefaultBG)
        case .none:
            return (.clear, .clear, .clear)
        }
    }
    
    func getSecondaryBorderColor() -> (normalColor: UIColor?, highlightedColor: UIColor?, disabledColor: UIColor?) {
        switch self {
        case .secondaryGreen:
            return (Colors.secondaryBorderGreen, Colors.secondaryPressedGreenBG, Colors.secondaryBorderDisabled)
        case .secondaryBlue:
            return (Colors.secondaryBorderBlue, Colors.secondaryPressedBlueBG, Colors.secondaryBorderDisabled)
        case .none:
            return (.clear, .clear, .clear)
        default:
            return (nil, nil, nil)
        }
    }
    
    func getIconTintColor(isEnabled: Bool) -> UIColor {
        if self == .primaryGreen || self == .primaryBlue {
            return Colors.primaryIconBG
        }
        if isEnabled {
            if self == .secondaryBlue || self == .secondaryGreen {
                return Colors.secondaryIconBG
            }
        } else {
            if self == .secondaryBlue || self == .secondaryGreen {
                return Colors.secondaryDisabledIconBG
            }
        }
        return .clear
    }
    
    func getSize(_ size: Size) -> CGFloat {
        return size.value()
    }
}
