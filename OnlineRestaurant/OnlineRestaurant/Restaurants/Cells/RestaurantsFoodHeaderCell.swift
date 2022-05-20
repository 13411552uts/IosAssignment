//
//  RestaurantsFoodHeaderCell.swift
//  OnlineRestaurant
//
//  Created by M on 2022/5/19.
//

import UIKit

class RestaurantsFoodHeaderCell: UITableViewCell {

    @IBOutlet weak var picImgV: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var starNumber: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var ratingsNumber: UILabel!
    @IBOutlet weak var DeliveryTime: UILabel!
    
    
    var itemModel:RestaurantsModel!{
        
        didSet{
            picImgV.image = UIImage(named: itemModel.pic)
            name.text = itemModel.name
            ratingsNumber.text = "\(itemModel.ratedNumber)+ Ratings"
            DeliveryTime.text = "Deliver \(itemModel.deliveryTime) min"
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
