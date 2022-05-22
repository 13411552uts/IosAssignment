//
//  DailyDealsTableViewCell.swift
//  OnlineRestaurant
//
//  Created by M on 2022/5/18.
//

import UIKit

class DailyDealsTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    var vc:HomeViewController!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var dailyArray = ["freedelivery2","buy1get12","60off","20off"]
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.register(UINib(nibName: "DailyDealsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DailyDealsCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dailyArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DailyDealsCollectionViewCell", for: indexPath) as!  DailyDealsCollectionViewCell
        cell.imageV.image = UIImage(named: dailyArray[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 130, height: 170)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let rvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RestaurantsViewController")
        vc.navigationController?.pushViewController(rvc, animated: true)
    }

    
    
}
