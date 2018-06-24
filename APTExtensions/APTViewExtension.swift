//
//  APTViewExtension.swift
//  APTViewExtensions
//
//  Created by Rishad Appat on 6/18/18.
//  Copyright © 2018 Rishad Appat. All rights reserved.
//

import UIKit

extension UIView
{
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func makeCircle()
    {
        layer.cornerRadius = frame.size.height/2
    }
    
    func setGradientBackground(colors: [CGColor], angle: Float = 0) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colors
        
        let alpha: Float = angle / 360
        let startPointX = powf(
            sinf(2 * Float.pi * ((alpha + 0.75) / 2)),
            2
        )
        let startPointY = powf(
            sinf(2 * Float.pi * ((alpha + 0) / 2)),
            2
        )
        let endPointX = powf(
            sinf(2 * Float.pi * ((alpha + 0.25) / 2)),
            2
        )
        let endPointY = powf(
            sinf(2 * Float.pi * ((alpha + 0.5) / 2)),
            2
        )
        
        gradient.endPoint = CGPoint(x: CGFloat(endPointX),y: CGFloat(endPointY))
        gradient.startPoint = CGPoint(x: CGFloat(startPointX), y: CGFloat(startPointY))
        
        self.layer.insertSublayer(gradient, at: 0)
    }
    
//    func setRadialGradientBackground(colors: [CGColor]) {
//        let context = UIGraphicsGetCurrentContext()
//        let colorSpace = CGColorSpaceCreateDeviceRGB()
//        var locations = [CGFloat]()
//        for i in 0...colors.count-1 {
//            locations.append(CGFloat(i) / CGFloat(colors.count))
//        }
//        let gradient = CGGradient(colorsSpace: colorSpace, colors: colors as CFArray, locations: locations)
//        let center = CGPoint(x: bounds.width / 2.0, y: bounds.height / 2.0)
//        let radius = min(bounds.width / 2.0, bounds.height / 2.0)
//        context?.drawRadialGradient(gradient!, startCenter: center, startRadius: 0.0, endCenter: center, endRadius: radius, options: .drawsAfterEndLocation)
//        let clipPath: CGPath = UIBezierPath(roundedRect: frame, cornerRadius: 10.0).cgPath
//
//        context?.addPath(clipPath)
//        self.layer.masksToBounds = true
//    }
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            let color = UIColor.init(cgColor:layer.borderColor!)
            return color
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat{
        get {
            return layer.shadowRadius
        }
        set {
            if(shadowRadius != 0)
            {
                layer.masksToBounds = false
                layer.shadowColor = UIColor.black.cgColor
                layer.shadowOffset = shadowOffset
                layer.shadowOpacity = shadowOpacity
                layer.shadowRadius = newValue
            }
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize{
        get {
            return CGSize(width: 0, height: 0)
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float{
        get {
            return 0.3
        }
        set {
            if(newValue > 1)
            {
                layer.shadowOpacity = 1
            }
            else if(newValue < 0)
            {
                layer.shadowOpacity = 0
            }
            else
            {
                layer.shadowOpacity = newValue
            }
        }
    }
    
    func addBlureEffect(style: UIBlurEffectStyle)
    {
        self.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        //always fill the view
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.insertSubview(blurEffectView, at: 0)
    }
    
    static func nibForClass() -> Self {
        return loadNib(self)
    }
    
    static func loadNib<A>(_ owner: AnyObject, bundle: Bundle = Bundle.main) -> A {
        
        let nibName = NSStringFromClass(classForCoder()).components(separatedBy: ".").last!
        
        let nib = bundle.loadNibNamed(nibName, owner: owner, options: nil)!
        
        for item in nib {
            if let item = item as? A {
                return item
            }
        }
        return nib.last as! A
    }
    
    public var x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame.origin.x = newValue
        }
    }
    
    public var y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame.origin.y = newValue
        }
    }
    
    func addBorder(edges: [UIRectEdge]) {
        
        let border = CALayer();
        
        for edge in edges
        {
            switch edge {
            case UIRectEdge.top:
                border.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.borderWidth)
                break
            case UIRectEdge.bottom:
                border.frame = CGRect(x:0, y:self.frame.height - self.borderWidth, width:self.frame.width, height:self.borderWidth)
                break
            case UIRectEdge.left:
                border.frame = CGRect(x:0, y:0, width: self.borderWidth, height: self.frame.height)
                break
            case UIRectEdge.right:
                border.frame = CGRect(x:self.frame.width - self.borderWidth, y: 0, width: self.borderWidth, height:self.frame.height)
                break
            default:
                break
            }
        }
        border.backgroundColor = self.borderColor!.cgColor;
        
        self.layer.addSublayer(border)
    }
}
