//
//  UserDelegate.swift
//  TutoUser
//
//  Created by Benjamin Dumont on 14/03/2016.
//  Copyright © 2016 bdumont. All rights reserved.
//

import Foundation

protocol UserDelegate : class {
    func updateUser(user: User)
    func createUser(user: User)
}
