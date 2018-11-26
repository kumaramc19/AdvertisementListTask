//
//  AdvertisementDetailViewController.swift
//  AdvertisementListTask
//
//  Created by rakesh on 25/11/18.
//  Copyright © 2018 rakesh. All rights reserved.
//

import UIKit

class AdvertisementDetailViewController: UIViewController {
    
    @IBOutlet var advertisementView: AdvertisementDetailView!
    
    var detailViewContent = ServicesModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        advertisementView.setController(controller: self)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func PopToPreviousViewController() {
        self.navigationController?.popViewController(animated: true)
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
