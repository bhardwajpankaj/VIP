//
//  LoginRouter.swift
//  DavidHawk
//
//  Created by Pankaj Bhardwaj on 10/06/19.
//  Copyright © 2019 Pankaj Bhardwaj. All rights reserved.
//

import Foundation
import UIKit

@objc protocol LoginRoutingLogic{
    func changeRootController()
}

protocol LoginDataPassing{
    var dataStore: LoginDataStore? { get }
}

class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing
{
    func changeRootController() {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "NextViewController")
        UIApplication.shared.keyWindow?.rootViewController = viewController
    }
    
    weak var viewController: LoginController?
    var dataStore: LoginDataStore?
}
