//
//  RestaurantsViewController.swift
//  OnlineRestaurant
//
//  Created by M on 2022/5/18.
//

import UIKit

class RestaurantsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var datasource = [RestaurantsModel]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "All restaurants"
        getData()
    }
    
    func getData(){
        
        let productArray = NSArray(contentsOfFile: Bundle.main.path(forResource: "Restaurants", ofType:"plist")!)
        datasource =  JSONArryModel(productArray as! [[String : Any]])
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return datasource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantsTableViewCell", for: indexPath) as!  RestaurantsTableViewCell
        cell.itemModel = datasource[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "RestaurantsFoodVC", sender: indexPath)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is RestaurantsFoodViewController{
            
            let vc =    segue.destination as! RestaurantsFoodViewController
            let indexPath = sender as! IndexPath
            vc.detailModel = datasource[indexPath.row]
           
        }
      
    }

}


