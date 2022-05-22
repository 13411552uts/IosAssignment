//
//  HomeViewController.swift
//  OnlineRestaurant
//
//  Created by M on 2022/5/18.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.topItem?.title = ""
    }
    
  
    func numberOfSections(in tableView: UITableView) -> Int {
        
        3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderViewCell", for: indexPath)
            
            return cell
        }else if indexPath.section == 1{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CuisinesTableViewCell", for: indexPath)
            
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "DailyDealsTableViewCell", for: indexPath)
        as! DailyDealsTableViewCell
        cell.vc = self
        
        return cell
        
        
    }

    
}
