//
//  APTTextField.swift
//  APTViewExtensions
//
//  Created by Rishad Appat on 6/19/18.
//  Copyright © 2018 Rishad Appat. All rights reserved.
//

import UIKit

extension UITextField
{
    @IBInspectable
    public var rightPadding: CGFloat
    {
        get {
            return 0
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: self.frame.size.height))
            self.rightView = paddingView
            self.rightViewMode = .always
        }
    }
    
    @IBInspectable
    public var righImagetView: UIImage
    {
        get {
            return UIImage()
        }
        set {
            let paddingView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: frame.size.height, height: frame.size.height))
            paddingView.image = newValue
            self.rightView = paddingView
            self.rightViewMode = .always
        }
    }
    
    @IBInspectable
    public var leftImagetView: UIImage
    {
        get {
            return UIImage()
        }
        set {
            let paddingView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: frame.size.height, height: frame.size.height))
            paddingView.image =  newValue
            self.leftView = paddingView
            self.leftViewMode = .always
        }
    }
    
    @IBInspectable
    public var leftPadding: CGFloat
    {
        get {
            return 0
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: self.frame.size.height))
            self.leftView = paddingView
            self.leftViewMode = .always
        }
    }
    
    @IBInspectable
    public var placeHolderColor: UIColor
    {
        get {
            return UIColor.darkGray
        }
        set {
            attributedPlaceholder = NSAttributedString(string: placeholder!, attributes: [NSAttributedStringKey.foregroundColor: newValue])
        }
    }
}
