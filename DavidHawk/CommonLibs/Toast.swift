//
//  Toast.swift
//  David
//
//  Created by macpro on 25/02/19.
//  Copyright © 2019 MacTest. All rights reserved.
//

import Foundation
import UIKit

class Toast {
    
    class private func showAlert(backgroundColor:UIColor, textColor:UIColor, message:String)
    {
        
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let label = UILabel(frame: CGRect.zero)
        label.textAlignment = NSTextAlignment.center
        label.text = message
        label.font = UIFont(name: FontNames.Nunito.NunitoSansRegular, size: 15) ?? UIFont(name: "", size: 15)
        label.adjustsFontSizeToFitWidth = true
        
        label.backgroundColor =  backgroundColor //UIColor.whiteColor()
        label.textColor = textColor //TEXT COLOR
        label.layer.zPosition = 1000
        label.sizeToFit()
        label.numberOfLines = 4
        label.layer.shadowColor = UIColor.gray.cgColor
        label.layer.shadowOffset = CGSize(width: 4, height: 3)
        label.layer.shadowOpacity = 0.3
        label.frame = CGRect(x: 0, y: appDelegate.window?.frame.height ?? Constants.SCREEN_HEIGHT, width: appDelegate.window?.frame.size.width ?? Constants.SCREEN_WIDTH, height: 44)
        
        label.alpha = 1
        
        appDelegate.window?.addSubview(label)
        
        var basketTopFrame: CGRect = label.frame;
        var bottomSpace:CGFloat = 0
        if Constants.SCREEN_HEIGHT >= 812{
            bottomSpace = 64
        }else{
            bottomSpace = 44
        }
        basketTopFrame.origin.y = (appDelegate.window?.frame.height ?? Constants.SCREEN_HEIGHT) - bottomSpace
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
            label.frame = basketTopFrame
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 1.0, options: .curveEaseIn, animations: {
                label.alpha = 0.0
            }, completion: { (_) in
                label.removeFromSuperview()
            })
        }
    }
    
    class func showPositiveMessage(message:String)
    {
        showAlert(backgroundColor: AppColor.appGreenColor, textColor: UIColor.white, message: message)
    }
    class func showNegativeMessage(message:String)
    {
        if message.trim().count == 0 {
            return
        }
        showAlert(backgroundColor: UIColor.red, textColor: UIColor.white, message: message)
    }
    class func showNeutralMessage(message:String)
    {
        showAlert(backgroundColor: UIColor.black, textColor: UIColor.white, message: message)
    }
}
