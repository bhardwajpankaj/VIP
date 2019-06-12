//
//  UserDefaults.swift
//  David
//
//  Created by macpro on 18/02/19.
//  Copyright © 2019 MacTest. All rights reserved.
//

import Foundation


class Defaults {
    
    class func setValue(key:String, value:String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    class func value(key:String) -> String? {
        return UserDefaults.standard.string(forKey: key)
    }
    
    class func clearUserData(){
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
}
