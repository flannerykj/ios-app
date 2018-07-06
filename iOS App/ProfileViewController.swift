//
//  ProfileViewController.swift
//  iOS App
//
//  Created by Flannery Jefferson on 2018-07-06.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var user = User(username: "flannerykj", email: "flannj@gmail.com")
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        usernameLabel.text = user.username
        emailLabel.text = user.email
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
