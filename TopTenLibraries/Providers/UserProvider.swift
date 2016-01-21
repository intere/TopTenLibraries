//
//  UserProvider.swift
//  TopTenLibraries
//
//  Created by Eric Internicola on 1/21/16.
//  Copyright © 2016 Eric Internicola. All rights reserved.
//

import Foundation
import Alamofire

class UserProvider: NSObject {
    static let instance = UserProvider()
    
    let userUrl = "http://jsonplaceholder.typicode.com/users"
    
    typealias JsonCallback = ((result: AnyObject?, error: NSString? ) -> (Void))
    
    func loadUsers(callback: JsonCallback? ) {
        Alamofire.request(.GET, userUrl).responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
                if let callback = callback {
                    callback(result: JSON, error: nil)
                }
            } else {
                if let callback = callback {
                    callback(result: nil, error: "Failed to load JSON")
                }
            }
        }
    }
    
}
