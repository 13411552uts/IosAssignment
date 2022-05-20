//
//  RestaurantsDetailRatingsCell.swift
//  OnlineRestaurant
//
//  Created by M on 2022/5/19.
//

import UIKit

class RestaurantsDetailRatingsCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var commendLabel: UILabel!
    
 
    var itemModel:RatingsListModel!{
        
        didSet{
            
            nameLabel.text = itemModel.name
            dateLabel.text = itemModel.creatTime
            commendLabel.text = itemModel.content
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
