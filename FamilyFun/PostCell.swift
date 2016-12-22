//
//  PostCell.swift
//  KidsPlaces
//
//  Created by Steve Mecking on 2016-12-21.
//  Copyright © 2016 Steve Mecking. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
