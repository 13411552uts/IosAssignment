//
//  RestaurantsTableViewCell.swift
//  OnlineRestaurant
//
//  Created by M on 2022/5/18.
//

import UIKit

class RestaurantsTableViewCell: UITableViewCell {

    @IBOutlet weak var picImgV: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var starNumber: UILabel!
    @IBOutlet weak var commendNumber: UILabel!
    @IBOutlet weak var foodType: UILabel!
    @IBOutlet weak var discountMsg: UILabel!
    
    var itemModel:RestaurantsModel!{
        
        didSet{
            
            picImgV.image = UIImage(named: itemModel.pic)
            name.text = itemModel.name
            starNumber.text = itemModel.star
            commendNumber.text = "(\(itemModel.ratedNumber)+)"
            foodType.text = itemModel.foodType
            discountMsg.text = itemModel.discountMsg
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
