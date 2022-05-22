//
//  RestaurantsFoodViewController.swift
//  OnlineRestaurant
//
//  Created by M on 2022/5/19.
//

import UIKit

class RestaurantsFoodViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var detailModel:RestaurantsModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = detailModel.name
        navigationController?.navigationBar.topItem?.title = ""
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        
        2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  section == 0 ? 1 : detailModel.restaurantDetail.popularFoodList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantsFoodHeaderCell", for: indexPath)
            as! RestaurantsFoodHeaderCell
                    
            cell.itemModel = detailModel
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantFoodListCell", for: indexPath)
        as! RestaurantFoodListCell
        
        cell.itemModel = detailModel.restaurantDetail.popularFoodList[indexPath.row]
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "AddFoodVC", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // RestaurantsDetailVC
        if segue.destination is RestaurantsDetailViewController{
            let vc = segue.destination as! RestaurantsDetailViewController
            
            vc.detailModel = self.detailModel
        }
        
        if segue.destination is AddFoodViewController{
            let vc = segue.destination as! AddFoodViewController
            
            let index = sender as! NSIndexPath
            vc.popularFoodModel = detailModel.restaurantDetail.popularFoodList[index.row]
        }
        
    }

}
