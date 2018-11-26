//
//  AdvertiseMentViewController.swift
//  AdvertisementListTask
//
//  Created by rakesh on 23/11/18.
//  Copyright © 2018 rakesh. All rights reserved.
//

import UIKit

class AdvertiseMentViewController: UIViewController {

    @IBOutlet var advertisementView: AdvertisementView!
    //MARK: - Instance variables
    let advertisementviewModel = AdvertisementViewModel()
    
    @IBOutlet weak var Advertisement_TableView: UITableView!    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        advertisementView.setcontroller(controller: self)
        advertisementviewModel.setviewModelcontroller(controller: self)
        advertisementviewModel.GetAdvertisementlistProcess()
    }
    
    //MARK:- Instance Methods
    func reloadServicesList() -> Void {
        Advertisement_TableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func ShowAdvertisementDetailView(serviceModel:ServicesModel) {
        let productscreenVc: AdvertisementDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "AdvertisementDetailViewController") as! AdvertisementDetailViewController
         productscreenVc.detailViewContent = serviceModel
        self.navigationController?.pushViewController(productscreenVc, animated: true)

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
