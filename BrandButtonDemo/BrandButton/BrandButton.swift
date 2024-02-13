//
//  BrandButton.swift
//  BrandButtonDemo
//
//  Created by Abhishek Srivastava on 11/02/24.
//

import Foundation
import UIKit

class BrandButton: UIButton {
    
    public var isLeading: Bool?
    public lazy var varient: BaseButtonStyle = .none {
        didSet {
            initialSetup()
        }
    }
    
    public var fullWidth: Bool = false {
        didSet {
            if fullWidth {
                frame.size.width = Size.value(.fullWidth)()
                setNeedsDisplay()
            }
        }
    }
    
    public var label: String {
        get {
            return titleLabel?.text ?? ""
        }
        set {
            setTitle(newValue, for: .normal)
        }
    }
    
    public override var isEnabled: Bool {
        didSet {
            setDisplay(isEnabled: isEnabled)
        }
    }
        
    public override var isHighlighted: Bool {
        didSet {
            setDisplay(isEnabled: isEnabled)
        }
    }
    
    public var size: Size = .regular {
        didSet {
            let newSize = varient.getSize(size)
            frame.size.width = newSize
            setNeedsDisplay()
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        varient = varient
        initialSetup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        varient = varient
        initialSetup()
    }
    
    public convenience init(type: BaseButtonStyle) {
        self.init(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
        varient = type
    }
    
    public convenience init(type: BaseButtonStyle, icon: UIImage?, leadingIcon: Bool) {
        self.init(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
        varient = type
        isLeading = leadingIcon
        setImageView(icon, leadingIcon)
    }
}

extension BrandButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

extension BrandButton {
    func initialSetup() {
        setDisplay(isEnabled: isEnabled)
        setTitleColor()
        refreshCorners()
        setFont()
    }
    
    func setDisplay(isEnabled: Bool) {
        setBackgroundColor()
        setTitleColor()
        setBorderColor()
        setBorderWidth()
        setIconBackgroundColor()
    }
    
    func setTitleColor() {
        let colors = varient.getTitleColor()
        setTitleColor(colors.normalColor, for: .normal)
        setTitleColor(colors.highlightedColor ?? colors.normalColor, for: .highlighted)
        setTitleColor(colors.disabledColor, for: .disabled)
    }
    
    func setBackgroundColor() {
        let colors = varient.getBackgroundColor()
        setBackgroundColor(color: colors.normalColor, forState: .normal)
        setBackgroundColor(color: colors.highlightedColor ?? colors.normalColor, forState: .highlighted)
        setBackgroundColor(color: colors.disabledColor, forState: .disabled)
    }
    
    fileprivate func setImageView(_ icon: UIImage?, _ leadingIcon: Bool) {
        if let _icon = icon {
            imageView?.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
            if leadingIcon {
                titleEdgeInsets.left = -(imageView?.frame.width ?? 24 + 5)
                titleEdgeInsets.right = -12
                imageEdgeInsets = UIEdgeInsets(top: 10, left: -frame.midX/2.3, bottom: 10, right: titleLabel?.frame.origin.x ?? 0 - 12)
            } else {
                let leftInset =
                (frame.size.width) - (titleLabel?.frame.origin.x ?? 0) + (titleLabel?.frame.width ?? 0) + (imageView?.frame.size.width ?? 0)
                titleEdgeInsets.left = -frame.midX/2.3
                titleEdgeInsets.right = 5
                imageEdgeInsets = UIEdgeInsets(top: 10, left: leftInset, bottom: 10, right: 16)
            }
            setImage(_icon, for: .normal)
            setImage(_icon, for: .highlighted)
        }
    }
    
    func setIconBackgroundColor() {
        imageView?.tintColor = varient.getIconTintColor(isEnabled: isEnabled)
    }
    
    func setBorderColor() {
        guard varient == .secondaryBlue || varient == .secondaryGreen else {return}
        let colors = varient.getSecondaryBorderColor()
        layer.borderColor = isEnabled ? colors.normalColor?.cgColor : colors.disabledColor?.cgColor
    }
    
    func setBorderWidth() {
        switch varient {
        case .secondaryGreen, .secondaryBlue:
            layer.borderWidth = 1
        default:
            layer.borderWidth = 0
        }
    }
    
    func refreshCorners(radius: CGFloat = 4) {
        self.layer.cornerRadius = radius
    }
    
    func setFont() {
        self.titleLabel?.font = varient.getFont()
    }
}
