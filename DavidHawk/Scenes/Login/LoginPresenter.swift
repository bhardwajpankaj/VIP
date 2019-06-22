//
//  LoginPresenter.swift
//  DavidHawk
//
//  Created by Pankaj Bhardwaj on 10/06/19.
//  Copyright © 2019 Pankaj Bhardwaj. All rights reserved.
//

import Foundation
import UIKit

protocol LoginPresentationLogic{
    func presentFetchResults(response: LoginModel.Fetch.Response)
}

class LoginPresenter: LoginPresentationLogic
{
    weak var viewController: LoginDisplayLogic?
    func presentFetchResults(response: LoginModel.Fetch.Response) {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        let viewModel = LoginModel.Fetch.ViewModel(profile: response.loginObj?.data?.profile)
        
        if response.isError{
            viewController?.errorLoggedIn(viewModel: viewModel)
        }else{
            viewController?.successLoggedIn(viewModel: viewModel)
        }
    }
}
