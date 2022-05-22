//
//  RestaurantsDetailCell.swift
//  OnlineRestaurant
//
//  Created by M on 2022/5/19.
//

import UIKit

class RestaurantsDetailCell: UITableViewCell {

    @IBOutlet weak var picImgV: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var ratingsNumber: UILabel!
    @IBOutlet weak var openTime: UILabel!
    
    @IBOutlet weak var ratingButton: UIButton!
    @IBOutlet weak var aboutButton: UIButton!
    
    @IBOutlet weak var ratingLineV: UIView!
    @IBOutlet weak var aboutLineV: UIView!
    
    var sliderButtonClick:((_ index:Int)->(Void))?
    
    var buttonArray:[UIButton]{
        
        return [ratingButton,aboutButton]
    }
    
    var lineVArray:[UIView]{
        
        return [ratingLineV,aboutLineV]
    }
    
    var itemModel:RestaurantsModel!{
        
        didSet{
            
            picImgV.image = UIImage(named: itemModel.pic)
            name.text = itemModel.name
            ratingsNumber.text = "\(itemModel.star) \(itemModel.ratedNumber)+ Ratings"
            
            locationLabel.text = itemModel.restaurantDetail.address
            openTime.text = itemModel.restaurantDetail.openTime
        }
    }
    
    @IBAction func titleSegmentButtonClick(_ sender: UIButton) {
        
        for button in buttonArray{
            
            if button == sender{
                
                sliderButtonClick!(sender.tag-10)
                button.setTitleColor(.black, for: .normal)
            }else{
                button.setTitleColor(.lightGray, for: .normal)
            }
        }
        
        for lineV in lineVArray{
            
            if lineV.tag == sender.tag + 10{
               
                lineV.backgroundColor = .black
            }else{
                
                lineV.backgroundColor = .lightGray
            }
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
