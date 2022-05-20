//
//  AddAddressViewController.swift
//  OnlineRestaurant
//
//  Created by M on 2022/5/19.
//

import UIKit

class AddAddressViewController: UIViewController {

    
    @IBOutlet weak var addressTextFiled: UITextField!
    
    var returnAddress:((_ address:String)->(Void))?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func doneButtonClick(_ sender: UIButton) {
        
        if addressTextFiled.text!.count > 3{
            returnAddress!(addressTextFiled.text!)
            
            self.dismiss(animated: true)
        }
      
    }
   

}
