//
//  RestaurantsDetailViewController.swift
//  OnlineRestaurant
//
//  Created by M on 2022/5/19.
//

import UIKit

class RestaurantsDetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var detailModel:RestaurantsModel!
    var segmentIndex = 0
    
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
        
        if section == 0{
            
            return 1
        }else{
            
            return segmentIndex == 1 ? 1 : self.detailModel.restaurantDetail.ratingsList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantsDetailCell", for: indexPath)
            as! RestaurantsDetailCell
            cell.itemModel = self.detailModel
            cell.sliderButtonClick = { (index) in
                
                self.segmentIndex = index
                self.tableView.reloadData()
            }
            
            return cell
        }else{
            
            if segmentIndex == 0{
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantsDetailRatingsCell", for: indexPath)
                as! RestaurantsDetailRatingsCell
                cell.itemModel = self.detailModel.restaurantDetail.ratingsList[indexPath.row]
                
                return cell
            }else{
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantsDetailAboutCell", for: indexPath)
                as! RestaurantsDetailAboutCell
                
                cell.showAnnotationInmap(model: detailModel.restaurantDetail)
                return cell
            }
            
        }
        
       
        
        
    }
}
