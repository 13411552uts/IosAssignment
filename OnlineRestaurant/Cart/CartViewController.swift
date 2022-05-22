//
//  CartViewController.swift
//  OnlineRestaurant
//
//  Created by M on 2022/5/19.
//

import UIKit


class CartViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,ShoppingCartDelegete {
    
    var totalPrice:Decimal = 0//
    var datasource = [CartModel]()
    
    @IBOutlet weak var submitButton: UIButton!
    // @IBOutlet weak var maskView: UIView!
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var paymentLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name("CreditCardNumber"), object: nil, queue: .main) { notication in
            
            let dict = notication.userInfo
            self.paymentLabel.text = "CreditNumber:\(dict!["carNumber"] ?? "N/A")"
        }
        tableView.tableFooterView = UIView()
        getData()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: Notification.Name(rawValue: "CreditCardNumber"), object: nil)
    }
    
    func getData(){
        
        datasource.removeAll()
        self.totalPrice = 0
        
        var locationData =  NSKeyedUnarchiver.unarchiveObject(withFile: cartPath) as? [CartModel]
        
        datasource = locationData ?? []
        
        for ord in datasource{
            
            self.totalPrice += Decimal(string: ord.price)! * Decimal(string: ord.foodNum)!
        }
        self.totalPriceLabel.text = "totalPrice：$\(totalPrice)"
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell") as! CartTableViewCell
        let model = datasource[indexPath.row]
        cell.showData(model: model)
        cell.delegate = self
        
        return cell
    }
    func cartCell(cell: CartTableViewCell, addChangeNumberOfShop change: ShopNmberChange,num:Int) {
        
        switch change {
            
        case .ShopNmberChangeAdd://
            
            totalPrice += Decimal(string:cell.model.price)! * Decimal(1)
            updateDB(model: cell.model, num: num,  shopTypeChange: .ShopNmberChangeAdd)
            
        case .ShopNmberChangeMin://
            
            totalPrice -= Decimal(string:cell.model.price)! * Decimal(1)
            updateDB(model: cell.model, num: num,  shopTypeChange: .ShopNmberChangeMin)
        }
    }
    
    func updateDB(model:CartModel,num:Int,shopTypeChange:ShopNmberChange){
        //
        self.totalPriceLabel.text = "totalPrice：$\(totalPrice)"
        
        if num == 0{
            for (index,item ) in datasource.enumerated(){
                if item == model{
                    
                    datasource.remove(at: index)
                }
            }
        }else{
            datasource.forEach { cart in
                if model == cart{
                    
                    cart.foodNum = "\(num)"
                }
            }
        }
        
        NSKeyedArchiver.archiveRootObject(datasource, toFile: cartPath)
        self.tableView.reloadData()
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //MARK:------chek out----
    @IBAction func payButtonClick(_ sender: UIButton) {
        if datasource.count > 0{
            
            datasource.removeAll()
            NSKeyedArchiver.archiveRootObject([], toFile: cartPath)
            
        }else{
            showAlertWith(msg: "Cart is Empty")
        }
        
    }
    @IBAction func goShopping(_ sender: UIButton) {
        self.tabBarController?.selectedIndex = 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == "OrderCompleteVC"{
            
            if addressLabel.text!.count  < 1{
                showAlertWith(msg: "Address can not empty")
                return false
            }
            if paymentLabel.text!.count  < 1{
                showAlertWith(msg: "PaymentMethod can not empty")
                return false
            }
            return true
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is AddAddressViewController{
            
            let vc = segue.destination as! AddAddressViewController
            vc.returnAddress = { (address) in
                
                self.addressLabel.text = address
            }
        }else if segue.destination is PaymentMethodViewController {
            
            let vc = segue.destination as! PaymentMethodViewController
            vc.returnPaymentMethod = { (payment) in
                
                self.paymentLabel.text = payment
            }
        }else if segue.destination is OrderCompleteViewController{
            
        }
    }
    
    func showAlertWith(msg:String){
        
        let alet = UIAlertController(title: msg, message: nil, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "YES", style: .cancel)
        alet.addAction(cancelAction)
        present(alet, animated: true)
    }
    
}
