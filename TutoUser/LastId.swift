//
//  LastId.swift
//  TutoUser
//
//  Created by Benjamin Dumont on 14/03/2016.
//  Copyright © 2016 bdumont. All rights reserved.
//

import Foundation

class LastId {
    static private let defaults = NSUserDefaults.standardUserDefaults()
    static private let key = "lastId"
    
    static var lastId : Int {
        get {
            return defaults.integerForKey(key) ?? 0
        }
        set {
            defaults.setInteger(newValue, forKey: key)
        }
    }
}
