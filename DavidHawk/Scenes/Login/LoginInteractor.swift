//
//  LoginInteractor.swift
//  DavidHawk
//
//  Created by Pankaj Bhardwaj on 10/06/19.
//  Copyright © 2019 Pankaj Bhardwaj. All rights reserved.
//

import UIKit

protocol LoginBusinessLogic
{
    func loginRequestInitiated(request: LoginModel.Fetch.Request)
}

protocol LoginDataStore
{
    //var name: String { get set }
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore
{
    var presenter: LoginPresentationLogic?
    var worker: LoginWorker?
    
    func loginRequestInitiated(request: LoginModel.Fetch.Request) {
        
        // if request.itemId == nil || request.count == nil || request.keyword == nil {
        //            return (self.presenter?.presentFetchResults(response: LoginModel.Fetch.Response(testObj: nil,isError: true, message: "Fields may not be empty.")))!
        // }
        worker = LoginWorker()
        let params = ["emailId" : request.emailId, "password": request.password]
        worker?.fetch(params:params as [String : Any], success: { (object) in
            self.presenter?.presentFetchResults(response: object)
            
        }, fail: ({ (error) in
            self.presenter?.presentFetchResults(response: error)
            
        }))
        
    }
}
