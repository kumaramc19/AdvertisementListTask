//
//  AdvertisementDetailView.swift
//  AdvertisementListTask
//
//  Created by rakesh on 25/11/18.
//  Copyright © 2018 rakesh. All rights reserved.
//

import UIKit

class AdvertisementDetailView: UIView {

    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var abstractionLb: UILabel!
    @IBOutlet weak var dateLb: UILabel!
    @IBOutlet weak var AdvertisementImgview: UIImageView!
    
    var viewController:AdvertisementDetailViewController!
    
    func setController(controller:AdvertisementDetailViewController) -> Void {
        
        viewController = controller
        self.showAdvertisementDetail()
    }
    
    func showAdvertisementDetail() {
        
        // Do any additional setup after loading the view.
        let product:ServicesModel = viewController.detailViewContent
        
        titleLb.text = product.title
        abstractionLb.text = product.abstract
        dateLb.text = product.published_date
        AdvertisementImgview?.kf.setImage(with: URL(string: ((product.mediaList[0] ).mediaMetaData[0] ).url ))
    }
    
    @IBAction func popup_BackBtn(_ sender: Any) {
        viewController.PopToPreviousViewController()
    }

    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
