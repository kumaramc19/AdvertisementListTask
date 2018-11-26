//
//  Utility.swift
//  AdvertisementListTask
//
//  Created by rakesh on 24/11/18.
//  Copyright © 2018 rakesh. All rights reserved.
//

import Foundation
import UIKit

import MBProgressHUD


func updateMainQueue (_ updates : @escaping() -> Void) {
    DispatchQueue.main.async {
        updates()
    }
}
    //
    //MARK:- MBProgress
    //
    func showProgress () -> Void{         //Show progress
        let mbProgress = MBProgressHUD.showAdded(to: (Constants.appDelegate.window?.rootViewController?.view)!, animated: true)
        mbProgress.mode = MBProgressHUDMode.indeterminate
        mbProgress.label.text = "Please wait..."
        mbProgress.bezelView.color = UIColor.white
    }
    func hideProgress () -> Void{         //Hide progress
        MBProgressHUD.hide(for: (Constants.appDelegate.window?.rootViewController?.view)!, animated: true)
    }
    
    //
    //MARK: - Alert view
    //
    func customCommonAlertView (titleString:String, messageString:String) -> Void {
        
        let alert = UIAlertController (title: titleString, message: messageString, preferredStyle:.alert)
        alert.addAction(UIAlertAction (title: "OK", style: .default, handler: nil))
        alert.view.tintColor = #colorLiteral(red: 0, green: 0.7490196078, blue: 1, alpha: 1)
        Constants.appDelegate.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    //Check network connection
    func checkNetwork () -> Bool{
        do {
            let reachability: Reachability =  Reachability()!
            let networkStatus =  String (describing: reachability.currentReachabilityStatus)
            if (networkStatus == "No Connection"){
                customCommonAlertView(titleString: Constants.ValidationMsgs.noNetwork, messageString: Constants.ValidationMsgs.connectionFailed)
                return false
            }
            return true
        }
}

