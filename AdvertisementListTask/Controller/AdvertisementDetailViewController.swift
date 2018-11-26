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
    
    //MARK:- Instance Methods
    func PopToPreviousViewController() {
        self.navigationController?.popViewController(animated: true)
    }
}
