//
//  UserProvider.swift
//  TopTenLibraries
//
//  Created by Eric Internicola on 1/21/16.
//  Copyright © 2016 Eric Internicola. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class UserProvider: NSObject {
    static let instance = UserProvider()
    
    let userUrl = "http://jsonplaceholder.typicode.com/users"
    
    typealias JsonCallback = ((result: NSData?, error: NSString? ) -> (Void))
    
    func loadUsers(callback: JsonCallback? ) {
        Alamofire.request(.GET, userUrl).responseJSON { response in
            
            // Debugging Output
            print(response.request)  // original URL request
            print(response.response) // URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let data = response.data {
                if let callback = callback {
                    callback(result: data, error: nil)
                }
            } else {
                if let callback = callback {
                    callback(result: nil, error: "Failed to load JSON")
                }
            }
        }
    }
    
}
