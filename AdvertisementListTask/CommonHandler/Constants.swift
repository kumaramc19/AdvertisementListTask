//
//  Constants.swift
//  AdvertisementListTask
//
//  Created by rakesh on 24/11/18.
//  Copyright © 2018 rakesh. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    
    //MARK: - Class Constants
    static let appDelegate =  UIApplication.shared.delegate as! AppDelegate
    
    //MARK: Validation messages constants
    struct ValidationMsgs {
        static let titleMessage = "Message"
        static let noNetwork = "No Connection"
        static let responseError = "There has been a network error, Please try again!"
        static let connectionFailed = "Connection failed, Please try again later"
    }

    //MARK: API constants
    struct API {
        //static let BaseURL = "http://www1.sparklnow.com.farshore.net/api/v1/"
        static let BaseURL = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=1a821d74e64e4a789ae0e76b6b858ac2"
        static let Login = BaseURL
    }
    //MARK: Identifier constants
    struct Storyboard {
        struct Name {
            static let login = "Login"
            static let main = "Main"
        }
        struct identifier {
            
        }
    }
}
