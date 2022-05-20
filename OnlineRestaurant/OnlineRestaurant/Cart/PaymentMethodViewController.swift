//
//  PaymentMethodViewController.swift
//  OnlineRestaurant
//
//  Created by M on 2022/5/19.
//

import UIKit

class PaymentMethodViewController: UIViewController {

    var returnPaymentMethod:((_ paymentInfo:String)->(Void))?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cashTapClick(_ sender: UITapGestureRecognizer) {

        returnPaymentMethod!("Cash")
        self.navigationController?.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is AddCardViewController{
            
//            var locationData =  NSKeyedUnarchiver.unarchiveObject(withFile: creditPath) as? [String:String]
//
//            if locationData != nil{
//
//                returnPaymentMethod!(locationData!["carNumber"]!)
//                self.navigationController?.popViewController(animated: true)
//            }else{
//
//
//            }

        }
    }

}
