//
//  ModelManager.swift
//  OnlineRestaurant
//
//  Created by M on 2022/5/19.
//

import Foundation


struct RestaurantsModel:Hashable, Codable{
    
    var name:String
    var ratedNumber:String
    var pic:String
    var RestaurantId:String
    var foodType:String
    var discountMsg:String
    var deliveryTime:String
    var star:String
    var restaurantDetail:RestaurantDetailModel
}

struct RestaurantDetailModel:Hashable, Codable{
    
    var openTime:String
    var address:String
    var latitude:String
    var longitude:String
    var pic:String
    var name:String
    var popularFoodList:[PopularFoodModel]
    var ratingsList:[RatingsListModel]
}

struct PopularFoodModel:Hashable, Codable{
    
    var foodInfo:String
    var price:String
    var name:String
    var pic:String
    var foodId:String
}

struct RatingsListModel:Hashable, Codable{
    
    var name:String
    var content:String
    var creatTime:String
    var star:String
}

class CartModel:NSObject,NSCoding,Codable{
    
    var foodInfo:String
    var price:String
    var name:String
    var pic:String
    var foodId:String
    
    ///DIY
    var foodNum:String
    var totalPrice:String
    
    func encode(with coder: NSCoder) {
        coder.encode(foodInfo, forKey: "foodInfo")
        coder.encode(price, forKey: "price")
        coder.encode(name, forKey: "name")
        coder.encode(pic, forKey: "pic")
        coder.encode(foodId, forKey: "foodId")
        coder.encode(foodNum, forKey: "foodNum")
        coder.encode(totalPrice, forKey: "totalPrice")
    }
    
    required init?(coder: NSCoder) {
        foodInfo = coder.decodeObject(forKey: "foodInfo") as! String
        price = coder.decodeObject(forKey: "price") as! String
        name = coder.decodeObject(forKey: "name") as! String
        pic = coder.decodeObject(forKey: "pic") as! String
        foodId = coder.decodeObject(forKey: "foodId") as! String
        foodNum = coder.decodeObject(forKey: "foodNum") as! String
        totalPrice = coder.decodeObject(forKey: "totalPrice") as! String
    }
    
    override init() {
        foodInfo = ""
        price = ""
        name = ""
        pic = ""
        foodId = ""
        foodNum = "1"
        totalPrice = "0"
    }
    
}

