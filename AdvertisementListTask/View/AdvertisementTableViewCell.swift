//
//  AdvertisementTableViewCell.swift
//  AdvertisementListTask
//
//  Created by rakesh on 23/11/18.
//  Copyright © 2018 rakesh. All rights reserved.
//

import UIKit

class AdvertisementTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLb: UILabel!
    
    @IBOutlet weak var abstractLb: UILabel!
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var dateLb: UILabel!
    @IBOutlet weak var thumbImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
