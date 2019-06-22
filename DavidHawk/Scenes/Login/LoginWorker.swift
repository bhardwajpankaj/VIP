//
//  LoginWorker.swift
//  DavidHawk
//
//  Created by Pankaj Bhardwaj on 10/06/19.
//  Copyright © 2019 Pankaj Bhardwaj. All rights reserved.
//

import Foundation
import Alamofire

typealias responseHandler = (_ response:LoginModel.Fetch.Response) ->()

class LoginWorker{
    
    func fetch(params:[String:Any]!, success:@escaping(responseHandler), fail:@escaping(responseHandler))
    {

        Alamofire.request("http://1q3q5.mocklab.io/login", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseLoginDetails { response in
            switch response.result {
            case .success(let value):
                success(LoginModel.Fetch.Response(loginObj: value, isError: false, message: response.description))
                break
            case .failure(let error):
                fail(LoginModel.Fetch.Response(loginObj: nil, isError: true, message: error.localizedDescription))
            }
        }
        
    }
}
