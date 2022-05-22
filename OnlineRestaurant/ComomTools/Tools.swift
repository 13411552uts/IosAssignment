//
//  Tools.swift
//  OnlineRestaurant
//
//  Created by M on 2022/5/19.
//


import UIKit
import Foundation


func JSONDictModel<T: Decodable>(_ data:[String:Any],  as type: T.Type = T.self)-> T {

    let data2: Data
    do{
        data2 = try JSONSerialization.data(withJSONObject: data, options: [])
    }catch{
           fatalError("Couldn't load \(data) ")
    }
   
    do{
         let model = try JSONDecoder().decode(type, from: data2)
           return model
    }catch{
        fatalError("Couldn't parse \(data) as \(T.self):\n\(error)")
    }

}


func JSONArryModel<T: Decodable>(_ datas: [[String:Any]],as type: T.Type = T.self)-> [T]{

    var temp: [T] = []
    for data in datas {
        
        let model:T = JSONDictModel(data)
       temp.append(model)
    }
    return temp
}
