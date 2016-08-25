//
//  User.swift
//  TutoUser
//
//  Created by Benjamin Dumont on 14/03/2016.
//  Copyright © 2016 bdumont. All rights reserved.
//

import Foundation


struct User {
    let id : Int
    let firstname : String
    let lastname : String
    let address : String?
    
    /**
     Initialization of a User
     
     - parameter id:        Int, mandatory, unique
     - parameter firstname: String, mandatory
     - parameter lastname:  String, mandatory
     - parameter address:   String, optional
     
     - returns: 
     */
    init(id: Int, firstname: String , lastname: String, address : String?) {
        self.id = id
        self.lastname = lastname
        self.firstname = firstname
        self.address = address
    }
}
