//
//  UserListViewController.swift
//  TutoUser
//
//  Created by Benjamin Dumont on 14/03/2016.
//  Copyright © 2016 bdumont. All rights reserved.
//

import UIKit

class UserListViewController: UIViewController, UserDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var userTableView: UITableView!
    @IBOutlet weak var noResultView: UIView!
    private var _users : [User] = []
    private var _selectedUser : User? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        _selectedUser = nil
        reloadView()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _users.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("userCell")
        (cell as! UserTableViewCell).user = _users[indexPath.row]
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        _selectedUser = _users[indexPath.row]
        self.performSegueWithIdentifier("updateOrCreate", sender: self)
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            _users.removeAtIndex(indexPath.row)
            reloadView()
        }
    }
    
    @IBAction func addUser(sender: AnyObject) {
        self.performSegueWithIdentifier("updateOrCreate", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "updateOrCreate" {
            let destinationVC = segue.destinationViewController as! UserAddOrEditViewController
            destinationVC.delegate = self
            destinationVC.user = _selectedUser
        }
    }
    
    func updateUser(user: User) {
        if let index = _users.indexOf({$0.id == user.id}) {
            _users.removeAtIndex(index)
            _users.append(user)
            reloadView()
        }
    }
    func createUser(user: User) {
        _users.append(user)
        reloadView()
    }
    
    func reloadView() {
        noResultView.hidden = _users.count != 0
        userTableView.reloadData()
    }

}
