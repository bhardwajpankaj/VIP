//
//  LoginRouter.swift
//  DavidHawk
//
//  Created by Pankaj Bhardwaj on 10/06/19.
//  Copyright © 2019 Pankaj Bhardwaj. All rights reserved.
//

import Foundation

import UIKit

@objc protocol LoginRoutingLogic
{
    func changeRootController()
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol LoginDataPassing
{
    var dataStore: LoginDataStore? { get }
}

class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing
{
    func changeRootController() {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "tabBarcontroller") as! UITabBarController
        UIApplication.shared.keyWindow?.rootViewController = viewController
    }
    
    weak var viewController: LoginController?
    var dataStore: LoginDataStore?
    
    // MARK: Routing

    //    func routeToSomewhere(segue: UIStoryboardSegue?)
    //    {
    //        if let segue = segue {
    //            let destinationVC = segue.destination as! SomewhereViewController
    //            var destinationDS = destinationVC.router!.dataStore!
    //            passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //        } else {
    //            let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //            let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
    //            var destinationDS = destinationVC.router!.dataStore!
    //            passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //            navigateToSomewhere(source: viewController!, destination: destinationVC)
    //        }
    //    }
    
    //    MARK: Navigation
    
    //    func navigateToSomewhere(source: TestViewController, destination: SomewhereViewController)
    //    {
    //        source.show(destination, sender: nil)
    //    }
    //
    //    MARK: Passing data
    //
    //    func passDataToSomewhere(source: TestDataStore, destination: inout SomewhereDataStore)
    //    {
    //        destination.name = source.name
    //    }
}
