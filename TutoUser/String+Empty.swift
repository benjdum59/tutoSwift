//
//  String+Empty.swift
//  TutoUser
//
//  Created by Benjamin Dumont on 14/03/2016.
//  Copyright © 2016 bdumont. All rights reserved.
//

import Foundation

extension String {
     /// Check if current string is not only composed by spaces
    public var isEmpty : Bool{
        get {
            return self.trim().characters.count == 0
        }
    }
     /**
     Trim function for strings.
     
     - returns: String without spaces characters at beginning en end.
     */
    public func trim() -> String
    {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    }
}
