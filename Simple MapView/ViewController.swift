//
//  ViewController.swift
//  Simple MapViewer 01
//
//  Created by D7703_16 on 2018. 6. 7..
//  Copyright © 2018년 201412402. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myMapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        // 35.167809, 129.070544
        // 번개반점 : 부산광역시 부산진구 양정동 418-282
        //        let location = CLLocationCoordinate2D(latitude: 35.167809, longitude: 129.070544)
        //        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        //        let region = MKCoordinateRegion(center: location, span: span)
        //        myMapView.setRegion(region, animated: true)
        //        /////
        //
        //        let annotation = MKPointAnnotation()
        //        annotation.coordinate = location
        //        annotation.title = "반개반점"
        //        annotation.subtitle = "TEL: 051-860-1234"
        //        myMapView.addAnnotation(annotation)
        
        /////
        let addr = "부산광역시 부산진구 양정동 418-282"
        let geoCoder = CLGeocoder()
        
        geoCoder.geocodeAddressString(addr) {
            (placemarks: [CLPlacemark]?, error: Error?) -> Void in
            if let error = error {
                print(error)
                return
            }
            if let placemarks = placemarks {
                let placemark = placemarks[0]
                
                
                let loc = placemark.location?.coordinate
                let span = MKCoordinateSpan(latitudeDelta: 0.09, longitudeDelta: 0.05)
                
                //                let region = MKCoordinateRegionMake(loc!, span)
                //                let region = MKCoordinateRegionMakeWithDistance(loc!, 0.05, 0.05)
                let region = MKCoordinateRegion(center: loc!, span: span)
                self.myMapView.setRegion(region, animated: true)
                
                // annoation
                let annotation = MKPointAnnotation()
                annotation.coordinate = loc!
                annotation.title = addr
                annotation.subtitle = "번개반점"
                self.myMapView.addAnnotation(annotation)
                
            }
        }
    }
}
