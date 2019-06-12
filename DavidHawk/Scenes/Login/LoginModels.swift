//
//  LoginModels.swift
//  DavidHawk
//
//  Created by Pankaj Bhardwaj on 10/06/19.
//  Copyright © 2019 Pankaj Bhardwaj. All rights reserved.
//

import UIKit

struct LoginModel{
    struct Fetch {
        struct Request
        {
            var emailId :String?
            var password: String?
        }
        struct Response
        {
            var loginObj: LoginDetails?
            var isError: Bool
            var message: String?
        }
        struct ViewModel
        {
            var profile: Profile?
            
        }
    }
}
