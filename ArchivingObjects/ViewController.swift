//
//  ViewController.swift
//  ArchivingObjects
//
//  Created by Ben Smith on 14/12/2017.
//  Copyright © 2017 Ben Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let user = User.init()
        user.email = "g@g.com"
        user.storeUsernameAndIDToDefaults(key: "user1")
        
        let retrievedUser = User.retrieveFromUserDefaults(key: "user1")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

