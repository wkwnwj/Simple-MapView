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
    
    var foodStoreNames = ["늘해랑","아딸","번개반점","왕짜장","토마토도시락","홍콩반점"]
    var foodStoreAddress = ["부산광역시 부산진구 양정동 418-282",
                           "부산광역시 부산진구 양정동 393-18",
                           "부산광역시 부산진구 양정1동 356-22",
                           "부산광역시 부산진구 양정1동 350-1",
                           "부산광역시 부산진구 양정1동 산19-8",
                           "부산광역시 부산진구 양정동 353-38"]
    var i = 0
    //pin의 배열 생성 및 초기화
    var annos = [MKPointAnnotation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for item in foodStoreAddress{
            let geoCoder = CLGeocoder()
            geoCoder.geocodeAddressString(item){
                (placemarks:[CLPlacemark]?, error: Error?) -> Void in
                if let myError = error{
                    print(myError)
                    return
                }
                let myPlacemark = placemarks![0]
//                print(myPlacemark.location?.coordinate)
   
                //한개씩 뽑아서 지도에 핀꼽기
                if let loc = myPlacemark.location{
                    let anno = MKPointAnnotation()
                    anno.coordinate = loc.coordinate
                    anno.title = self.foodStoreNames[self.i]
                    anno.subtitle = self.foodStoreAddress[self.i]
                    self.i = self.i + 1
                    
                    //pin을 pin 배열에 추가
                    self.annos.append(anno)
                    self.myMapView.addAnnotations(self.annos)
                    
                    //pin을 앱에 꽉 채워서 보여주기
                    self.myMapView.showAnnotations(self.annos,animated: true)
                }else{
                    print()
                }
            }
        }
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
//        let addr = "부산광역시 부산진구 양정동 418-282"
//        let geoCoder = CLGeocoder()
//
//        geoCoder.geocodeAddressString(addr) {
//            (placemarks: [CLPlacemark]?, error: Error?) -> Void in
//            if let error = error {
//                print(error)
//                return
//            }
//            if let placemarks = placemarks {
//                let placemark = placemarks[0]
//
//
//                let loc = placemark.location?.coordinate
//                let span = MKCoordinateSpan(latitudeDelta: 0.09, longitudeDelta: 0.05)
//
//                //                let region = MKCoordinateRegionMake(loc!, span)
//                //                let region = MKCoordinateRegionMakeWithDistance(loc!, 0.05, 0.05)
//                let region = MKCoordinateRegion(center: loc!, span: span)
//                self.myMapView.setRegion(region, animated: true)
//
//                // annoation
//                let annotation = MKPointAnnotation()
//                annotation.coordinate = loc!
//                annotation.title = addr
//                annotation.subtitle = "번개반점"
//                self.myMapView.addAnnotation(annotation)
//
//            }
//        }
    }
}

