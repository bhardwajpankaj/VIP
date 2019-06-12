//
//  ColorConstants.swift
//  David
//
//  Created by macpro on 11/01/19.
//  Copyright © 2019 MacTest. All rights reserved.
//

import Foundation
import UIKit

struct AppColor {
    
    private struct Alphas {
        static let Opaque = CGFloat(1)
        static let SemiOpaque = CGFloat(0.8)
        static let SemiTransparent = CGFloat(0.5)
        static let Transparent = CGFloat(0.3)
    }
    
    static let appPrimaryColor =  UIColor.white.withAlphaComponent(Alphas.SemiOpaque)
    static let appSecondaryColor =  UIColor.blue.withAlphaComponent(Alphas.Opaque)
    static let borderColors = UIColor(red: 214.0/255.0, green: 220.0/255.0, blue: 233.0/255.0, alpha: 1)
    static let appLightGrayColor = UIColor(red: 230.0/255.0, green: 234.0/255.0, blue: 242.0/255.0, alpha: 1)
    static let errorColor = UIColor(red: 224.0/255.0, green: 32.0/255.0, blue: 60.0/255.0, alpha: 1)
    static let labelTextColor = UIColor(red: 122.0/255.0, green: 135.0/255.0, blue: 172.0/255.0, alpha: 1)
    static let labelTextBlueColor = UIColor(red: 28.0/255.0, green: 133.0/255.0, blue: 255.0/255.0, alpha: 1)
    static let appGreenColor = UIColor(red: 6.0/255.0, green: 194.0/255.0, blue: 111.0/255.0, alpha: 1)

    struct cell {
        static let shadow = UIColor(red: 15/255, green: 54/255, blue: 136/255, alpha: 1.0)
        static let lineBorder = UIColor(red: 232/255, green: 236/255, blue: 246/255, alpha: 1.0)
    }
    struct button {
        static let ctaEnabled = UIColor(red: 0.1303, green: 0.9915, blue: 0.0233, alpha: Alphas.Opaque)
        static let ctaDisabled = UIColor(red: 222/255.0, green: 222/255.0, blue: 222/255.0, alpha: 1.0)
        static let ctaShadow = UIColor(red: 149/255.0, green: 149/255.0, blue: 149/255.0, alpha: 1.0)
        static let titleColor = UIColor(red: 77/255, green: 91/255, blue: 131/255, alpha: 1.0)
        static let borderColor = UIColor(red: 214/255, green: 220/255, blue: 233/255, alpha: 1.0)
        static let ctaGradientStartColor = UIColor(red: 2/255, green: 5/255, blue: 17/255, alpha: 1.0)
        static let ctaGradientEndColor =  UIColor(red: 8/255, green: 27/255, blue: 80/255, alpha: 1.0)
    }
    struct TextColors {
        static let Error = AppColor.appSecondaryColor
        static let Success = UIColor(red: 0.1303, green: 0.9915, blue: 0.0233, alpha: Alphas.Opaque)
        static let buttonDisable = UIColor(red: 122.0/255.0, green: 135.0/255.0, blue: 172.0/255.0, alpha: 1)
    }
    
    struct TabBarColors{
        static let Selected = UIColor.white
        static let NotSelected = UIColor.black
    }
    
    struct OverlayColor {
        static let SemiTransparentBlack = UIColor.black.withAlphaComponent(Alphas.Transparent)
        static let SemiOpaque = UIColor.black.withAlphaComponent(Alphas.SemiOpaque)
        static let demoOverlay = UIColor.black.withAlphaComponent(0.6)
    }
}
