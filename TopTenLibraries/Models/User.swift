//
//  User.swift
//  TopTenLibraries
//
//  Created by Eric Internicola on 1/23/16.
//  Copyright © 2016 Eric Internicola. All rights reserved.
//

import Foundation
import SwiftyJSON

class User {
    var id: Int!
    var name: String!
    var email: String!
    var phone: String!
    var website: String!
    
    static func fromJsonData(json: JSON) -> [User] {
        var users = [User]()
            
        if let usersJson = json.array {
            for userJson in usersJson {
                let user = User()
                user.id = userJson["id"].int ?? -1
                user.name = userJson["name"].string ?? ""
                user.email = userJson["email"].string ?? ""
                user.phone = userJson["phone"].string ?? ""
                user.website = userJson["website"].string ?? ""
                
                users.append(user)
            }
        }
        return users
    }
}
