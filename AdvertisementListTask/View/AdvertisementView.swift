//
//  AdvertisementView.swift
//  AdvertisementListTask
//
//  Created by rakesh on 23/11/18.
//  Copyright © 2018 rakesh. All rights reserved.
//

import UIKit
import Kingfisher

class AdvertisementView: UIView , UITableViewDelegate, UITableViewDataSource {
    
    var viewController:AdvertiseMentViewController!
    @IBOutlet weak var MainTitle: UILabel!
    func setcontroller(controller:AdvertiseMentViewController) -> Void {
    
        viewController = controller
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewController.advertisementviewModel.getServicesListCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:AdvertisementTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "AdvertisementTableViewCell") as? AdvertisementTableViewCell
        if cell == nil {
            tableView.register(UINib(nibName: "AdvertisementTableViewCell", bundle: nil), forCellReuseIdentifier: "AdvertisementTableViewCell")
            cell = tableView.dequeueReusableCell(withIdentifier: "AdvertisementTableViewCell") as? AdvertisementTableViewCell
        }
        
        let product:ServicesModel = viewController.advertisementviewModel.getServicesListForIndex(indexItem: indexPath)!
        
        cell?.titleLb.text = product.title
        cell?.abstractLb.text = product.abstract
        cell?.dateLb.text = product.published_date
        cell?.thumbImgView?.kf.setImage(with: URL(string: ((product.mediaList[0] ).mediaMetaData[0] ).url ))
        cell?.thumbImgView?.layer.cornerRadius = 15.0
        cell?.thumbImgView?.clipsToBounds = true
        return cell!

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        viewController.ShowAdvertisementDetailView(serviceModel: viewController.advertisementviewModel.getServicesListForIndex(indexItem: indexPath)!)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
