//
//  SuffixTextField.swift
//  suffixtextfield
//


import Foundation
import UIKit

public class SuffixTextField: UITextField {
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        addTarget(self, action:  #selector(textFieldDidChange(sender:)), for: UIControl.Event.editingChanged)
        clipsToBounds = false
    }
    
    // A suffix string that will appear just to the right of visible text
    public var suffix:String? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    // A prefix string that will appear just to the left of visible text
    public var prefix:String? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    // Color for the suffix, default to the same color as the text
    public var suffixTextColor:UIColor?

    // Color for the prefix, default to the same color as the text
    public var prefixTextColor:UIColor?
    
    // Fallback text color
    private let placeHolderTextColor = UIColor(red: 120/255.0, green: 120/255.0, blue: 120/255.0, alpha: 1)
    
    private func centerWithPrefix(offset: CGFloat) {
        self.layer.sublayerTransform = CATransform3DMakeTranslation(offset, 0, 0);
    }
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        clipsToBounds = false
        // Only draw suffix when we have a suffix and a text
        if (suffix ?? "").isEmpty == false && (text ?? "").isEmpty == false {
            
            // We use some handy methods on NSString
            let text = (self.text ?? "") as NSString
            
            // The x position of the suffix
            var suffixXPosition:CGFloat = 0
            
            // Spacing between suffix and text
            let spacing:CGFloat = 0.0
            
            // Font and color for the suffix
            let color = suffixTextColor ?? self.textColor ?? placeHolderTextColor
            let attrs:[NSAttributedString.Key: AnyObject] = [NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue): self.font!, NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): color]
            
            // Calc the x position of the suffix
            if textAlignment == .center {
                let fieldWidth = frame.size.width
                let textWidth = text.size(withAttributes: attrs).width
                suffixXPosition = (fieldWidth / 2) + (textWidth / 2)
            } else {
                suffixXPosition = text.size(withAttributes: attrs).width
            }
            
            // Calc the rect to draw the suffix in
            let height = text.size(withAttributes: attrs).height
            let verticalCenter = height / 2.0
            let top:CGFloat = frame.size.height / 2 - ceil(verticalCenter)
            let width = (suffix! as NSString).size(withAttributes: attrs).height
            let offset = (width + spacing) / 2
            let rect = CGRect(x: suffixXPosition + spacing + offset, y: top, width: width, height: height)
            
            // Draw it
            (suffix! as NSString).draw(in: rect, withAttributes: attrs)
        }
        
        // Only prefix when we have a prefix and a text
        if (prefix ?? "").isEmpty == false && (text ?? "").isEmpty == false {
            
            // We use some handy methods on NSString
            let text = (self.text ?? "") as NSString
            
            // The x position of the prefix
            var prefixXPosition:CGFloat = 0
            
            // Spacing between prefix and text
            let spacing:CGFloat = 3.0
            
            // Font and color for the prefix
            let color = prefixTextColor ?? self.textColor ?? placeHolderTextColor
            let attrs:[NSAttributedString.Key: AnyObject] = [NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue): self.font!, NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): color]
            
            // Calc the x position of the prefix
            if textAlignment == .center {
                let fieldWidth = frame.size.width
                let textWidth = text.size(withAttributes: attrs).width
                prefixXPosition = (fieldWidth / 2) - (textWidth / 2)
            } else if textAlignment == .right {
                let fieldWidth = frame.size.width
                let textWidth = text.size(withAttributes: attrs).width
                prefixXPosition = fieldWidth - textWidth
            }
            
            prefixXPosition -= (prefix! as NSString).size(withAttributes: attrs).width
            prefixXPosition -= spacing
            
            // Calc the rect to draw the suffix in
            let height = text.size(withAttributes: attrs).height
            let verticalCenter = height / 2.0
            let top:CGFloat = frame.size.height / 2 - ceil(verticalCenter)
            let width = (prefix! as NSString).size(withAttributes: attrs).width
            let offset = (width + spacing) / 2
            let rect = CGRect(x: prefixXPosition + offset, y: top, width: width, height: height)
            
            // Draw it
            (prefix! as NSString).draw(in: rect, withAttributes: attrs)
            centerWithPrefix(offset: offset)
        } else {
            centerWithPrefix(offset: 0)
        }
    }
    
    @objc func textFieldDidChange(sender: AnyObject) {
        setNeedsDisplay()
    }
}
