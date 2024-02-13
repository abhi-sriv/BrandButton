//
//  Colors.swift
//  BrandButtonDemo
//
//  Created by Abhishek Srivastava on 11/02/24.
//

import Foundation
import UIKit

// MARK: - Asset Color
public enum Colors {    
    //Border Colors
    public static let secondaryBorderBlue = ColorAsset(name: "SecondaryBorderBlue").color
    public static let secondaryBorderDisabled = ColorAsset(name: "SecondaryBorderDisabled").color
    public static let secondaryBorderGreen = ColorAsset(name: "SecondaryBorderGreen").color

    //ButtonBG
    public static let primaryDefaultBlueBG = ColorAsset(name: "PrimaryDefaultBlueBG").color
    public static let primaryDefaultGreenBG = ColorAsset(name: "PrimaryDefaultGreenBG").color
    public static let primaryDisabledBG = ColorAsset(name: "PrimaryDisabledBG").color
    public static let primaryPressedBlueBG = ColorAsset(name: "PrimaryPressedBlueBG").color
    public static let primaryPressedGreenBG = ColorAsset(name: "PrimaryPressedGreenBG").color
    public static let secondaryDefaultBG = ColorAsset(name: "SecondaryDefaultBG").color
    public static let secondaryPressedBlueBG = ColorAsset(name: "SecondaryPressedBlueBG").color
    public static let secondaryPressedGreenBG = ColorAsset(name: "SecondaryPressedGreenBG").color
    
    //Font
    public static let primaryFontTitle = ColorAsset(name: "PrimaryFontTitle").color
    public static let secondaryFontBlue = ColorAsset(name: "SecondaryFontBlue").color
    public static let secondaryFontDisabled = ColorAsset(name: "SecondaryFontDisabled").color
    public static let secondaryFontGreen = ColorAsset(name: "SecondaryFontGreen").color
    public static let secondaryFontBluePressed = ColorAsset(name: "SecondaryFontBluePressed").color
    public static let secondaryFontGreenPressed = ColorAsset(name: "SecondaryFontGreenPressed").color
    
    //IconBG
    public static let primaryIconBG = ColorAsset(name: "PrimaryIconBG").color
    public static let secondaryDisabledIconBG = ColorAsset(name: "SecondaryDisabledIconBG").color
    public static let secondaryIconBG = ColorAsset(name: "SecondaryIconBG").color
}

// MARK: - Implementation Details
public final class ColorAsset {
    public fileprivate(set) var name: String
    
    public private(set) lazy var color: UIColor = {
        guard let color = UIColor(asset: self) else {
            fatalError("Unable to load color asset named \(name).")
        }
        return color
    }()
    
    fileprivate init(name: String) {
        self.name = name
    }
}

public extension UIColor {
    convenience init?(asset: ColorAsset) {
        self.init(named: asset.name, in: Bundle.current, compatibleWith: nil)
    }
}

