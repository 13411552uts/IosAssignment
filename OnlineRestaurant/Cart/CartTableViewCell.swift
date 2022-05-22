//
//  CartTableViewCell.swift
//  OnlineRestaurant
//
//  Created by M on 2022/5/19.
//

import UIKit

enum  ShopNmberChange{
    case ShopNmberChangeAdd//add
    case ShopNmberChangeMin//

}

protocol ShoppingCartDelegete:NSObjectProtocol {
    func cartCell(cell:CartTableViewCell, addChangeNumberOfShop  change:ShopNmberChange,num:Int)
}

class CartTableViewCell: UITableViewCell,UIAlertViewDelegate {
    
    var goodNum:Int = 1
    var model:CartModel!
    weak var delegate: ShoppingCartDelegete?
    @IBOutlet weak var headImage: UIImageView!
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var currentPrice: UILabel!
    @IBOutlet weak var conutLabel: UILabel!
    @IBOutlet weak var addCountView: UIView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    
    @IBAction func changeNumberClick(_ sender: GoodsButton) {
        
        if self.delegate != nil{
            goodNum = Int(model.foodNum)!
            if sender.isEqual(self.addButton){
                goodNum +=  1
                self.conutLabel.text = "\(goodNum)"
                self.delegate?.cartCell(cell: self, addChangeNumberOfShop: .ShopNmberChangeAdd, num: goodNum)
            }else{
                goodNum -= 1
                if goodNum < 0{
                    goodNum = 0
                    return
                }
                self.conutLabel.text = "\(goodNum)"
                self.delegate?.cartCell(cell: self, addChangeNumberOfShop: .ShopNmberChangeMin, num: goodNum)
            }
        }
        print("goodNum==\(goodNum)")
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
   
    }
    
    func showData(model:CartModel){
        
        self.model = model
        titleName.text = model.name
        currentPrice.text = "$" + model.price
        conutLabel.text = model.foodNum
        headImage.image = UIImage(named: model.pic)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}
class GoodsButton: UIButton {
    var goodsModel:CartModel!
}
