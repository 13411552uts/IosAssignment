//
//  AddFoodViewController.swift
//  OnlineRestaurant
//
//  Created by M on 2022/5/19.
//

import UIKit

class AddFoodViewController: UIViewController {

    var popularFoodModel:PopularFoodModel!
    
    @IBOutlet weak var detailMsgLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var picImgV: UIImageView!
    
    var foodNumber = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        picImgV.image = UIImage(named: popularFoodModel.pic)
        name.text = popularFoodModel.name
        priceLabel.text = "$\(popularFoodModel.price)"
        detailMsgLabel.text = popularFoodModel.foodInfo
    }
    
    @IBAction func addToCartButtonClick(_ sender: UIButton) {
        self.dismiss(animated: true)
        
        let carModel = CartModel()
        carModel.foodInfo = popularFoodModel.foodInfo
        carModel.price = popularFoodModel.price
        carModel.name = popularFoodModel.name
        carModel.pic = popularFoodModel.pic
        carModel.foodId = popularFoodModel.foodId
        carModel.foodNum = "\(foodNumber)"
        carModel.totalPrice = "\(foodNumber * (Int(popularFoodModel.price) ?? 0))"
       
        var locationData =  NSKeyedUnarchiver.unarchiveObject(withFile: cartPath) as? [CartModel]
        
        if locationData != nil{
            
                /// Haven Same Data
                if locationData!.contains(carModel){
                    
                    for model in locationData!{
                        
                        if model.foodId == popularFoodModel.foodId{
                            
                            model.foodNum += carModel.foodNum
                            model.totalPrice += carModel.totalPrice
                        }
                    }
                }else{
                    
                    locationData!.append(carModel)
                }
              
                NSKeyedArchiver.archiveRootObject(locationData!, toFile: cartPath)
            
        }else{
            
            var array = [CartModel]()
            array.append(carModel)
            
            NSKeyedArchiver.archiveRootObject(array, toFile: cartPath)
        }
    }
    
   
    @IBAction func subtractionButtonClick(_ sender: UIButton) {
        
        foodNumber -= 1
        if (foodNumber <= 1){
            foodNumber = 1
        }
        
        self.totalPriceLabel.text = "\(foodNumber)"
    }
    
    @IBAction func additionButtonClick(_ sender: UIButton) {
        
        foodNumber += 1
        
        self.totalPriceLabel.text = "\(foodNumber)"
    }
}
