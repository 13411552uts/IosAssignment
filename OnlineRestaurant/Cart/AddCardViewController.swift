//
//  AddCardViewController.swift
//  OnlineRestaurant
//
//  Created by M on 2022/5/19.
//

import UIKit

class AddCardViewController: UIViewController {

    @IBOutlet weak var nameTextFiled: UITextField!
    @IBOutlet weak var cvvTextFiled: UITextField!
    @IBOutlet weak var monthTextFiled: UITextField!
    @IBOutlet weak var cardNumberTextFiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

    @IBAction func doneButtonClick(_ sender: UIButton) {
        
        if cardNumberTextFiled.text!.count < 3{
            
            showAlertWith(msg: "CardName can not empty")
            return
        }
        if monthTextFiled.text!.count < 3{
            
            showAlertWith(msg: "MM/YY can not empty")
            return
        }
        if cvvTextFiled.text!.count < 2{
            
            showAlertWith(msg: "CVV can not empty")
            return
        }
        if nameTextFiled.text!.count < 2{
            
            showAlertWith(msg: "Card holder can not empty")
            return
        }
        
        let dict = ["carNumber":cardNumberTextFiled.text!,"mmyy":monthTextFiled.text!,"CVV":cvvTextFiled.text!,"cardHolder":nameTextFiled.text!]
        NSKeyedArchiver.archiveRootObject(dict, toFile: creditPath)
        
        NotificationCenter.default.post(name: NSNotification.Name("CreditCardNumber"), object: nil, userInfo: dict)
        
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    func showAlertWith(msg:String){
        
        let alet = UIAlertController(title: msg, message: nil, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "YES", style: .cancel)
        alet.addAction(cancelAction)
        present(alet, animated: true)
    }
}
