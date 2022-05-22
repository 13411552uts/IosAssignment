//
//  RestaurantsDetailAboutCell.swift
//  OnlineRestaurant
//
//  Created by M on 2022/5/19.
//

import UIKit
import MapKit

class RestaurantsDetailAboutCell: UITableViewCell,MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func showAnnotationInmap(model:RestaurantDetailModel){
        
        //  mapSetting()
        let coordinate =    CLLocationCoordinate2D.init(latitude: Double(model.latitude)! , longitude: Double(model.longitude)!)
        
        self.mapView.setRegion(MKCoordinateRegion.init(center: coordinate, span: MKCoordinateSpan.init(latitudeDelta: 0.01, longitudeDelta: 0.01)), animated: true)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = CLLocationCoordinate2D.init(latitude: Double(model.latitude)! , longitude: Double(model.longitude)!)
        
        annotation.title = model.name
        self.mapView.addAnnotation(annotation)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
        
        if  annotation  is  MKUserLocation  {return  nil}
        
        let  reuserId =  "pin"
        var  pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuserId)
        as?  MKPinAnnotationView
        if  pinView ==  nil  {
            pinView =  MKPinAnnotationView (annotation: annotation, reuseIdentifier: reuserId)
            pinView?.canShowCallout =  true
            pinView?.animatesDrop =  true
            pinView?.pinTintColor =  UIColor .red
            pinView?.rightCalloutAccessoryView =  UIButton (type: .detailDisclosure)
        } else {
            pinView?.annotation = annotation
        }
        
        return  pinView
    }
    
    
}
