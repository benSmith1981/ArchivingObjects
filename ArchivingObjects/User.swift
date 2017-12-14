//
//  Objects.swift
//  TheDiveAdvisor
//
//  Created by Ivo Nederlof on 13-09-17.
//  Copyright © 2017 ben smith. All rights reserved.
//

import Foundation

class User: NSObject , NSCoding {
    var email: String?
    var password: String?
    var name: String?
    var dob: String?
    
    override init() {

    }
    
    required init(coder decoder: NSCoder) {
        self.email = decoder.decodeObject(forKey: "email") as? String ?? ""
        self.dob = decoder.decodeObject(forKey: "dob") as? String ?? ""
        self.password = decoder.decodeObject(forKey: "password") as? String ?? ""
        self.name = decoder.decodeObject(forKey: "name") as? String ?? ""

    }
    
    func encode(with coder: NSCoder) {
        coder.encode(email, forKey: "email")
        coder.encode(password, forKey: "password")
        coder.encode(name, forKey: "name")
        coder.encode(dob, forKey: "dob")
    }
    
    static func retrieveFromUserDefaults(key: String) -> User? {
        // retrieving a value for a key
        if let data = UserDefaults.standard.data(forKey: key),
            let userModel = NSKeyedUnarchiver.unarchiveObject(with: data) as? User {
            return userModel
        } else {
            return nil
        }
    }
    
    func storeUsernameAndIDToDefaults(key: String) {
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: self)
        UserDefaults.standard.set(encodedData, forKey: key)
    }
}
