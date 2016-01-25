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
    
    typealias JsonCallback = ((result: JSON?, error: NSString? ) -> (Void))
    
    func loadUsers(callback: JsonCallback? ) {
        Alamofire.request(.GET, userUrl).validate().responseJSON { response in
            // Debugging Output
            print(response.request)  // original URL request
            print(response.response) // URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    if let callback = callback {
                        callback(result: JSON(value), error: nil)
                    }
                } else {
                    print("Failed to get result value from response")
                    if let callback = callback {
                        callback(result: nil, error: "Failed to load JSON")
                    }
                }
            case .Failure(let error):
                print(error)
                if let callback = callback {
                    callback(result: nil, error: error.localizedDescription)
                }
            }
        }
    }
    
}
