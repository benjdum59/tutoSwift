//
//  UserTableViewCell.swift
//  TutoUser
//
//  Created by Benjamin Dumont on 14/03/2016.
//  Copyright © bdumont 2016 . All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var lastnameLabel: UILabel!
    
    @IBOutlet weak var firstnameLabel: UILabel!
    
    var user:User! {
        didSet{
            firstnameLabel.text = user.firstname
            lastnameLabel.text = user.lastname
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
