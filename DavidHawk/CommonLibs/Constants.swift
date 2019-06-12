//
//  Constants.swift
//  David
//
//  Created by macpro on 11/01/19.
//  Copyright © 2019 MacTest. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    
    struct Account{
        static let isUserLoggedIn = "isUserLoggedIn"
        static let username = "username"
        static let accessToken = "accessToken"
        static let userId = "userId"
    }
    static let fileSizeLimit = 5000000
    static let isOnBoardingCompleted = "isOnBoardingCompleted"
    static let SCREEN_HEIGHT = UIScreen.main.bounds.height
    static let SCREEN_WIDTH  = UIScreen.main.bounds.width
    static let appStoreUrl = "itms-apps://itunes.apple.com/app/id482877505"
    struct Url{
        static let skillSuggesterURL = "/suggestions/domains/{domainId}/skills?input="
    }
}
extension Notification.Name {
    public static let googleSuccessKey = Notification.Name(rawValue: "googleSuccessKey")
}
