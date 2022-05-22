//
//  RestaurantFoodListCell.swift
//  OnlineRestaurant
//
//  Created by M on 2022/5/19.
//

import UIKit

class RestaurantFoodListCell: UITableViewCell {

    @IBOutlet weak var picImgV: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    
    var itemModel:PopularFoodModel!{
        
        didSet{
            picImgV.image = UIImage(named: itemModel.pic)
            name.text = itemModel.name
            price.text = "$\(itemModel.price)"
          
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        price.layer.cornerRadius = 10
        price.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
