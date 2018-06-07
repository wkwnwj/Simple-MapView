//
//  ViewController.swift
//  Simple MapView
//
//  Created by D7703_22 on 2018. 6. 7..
//  Copyright © 2018년 D7703_22. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var myMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 위도, 경도 설정
        //DIT 부산광역시 부산진구 양정동 42-19
        //35.165999, 129.072543
        let loc = CLLocationCoordinate2D(latitude: 35.165999, longitude: 129.072543)
        
        //반경(zoom in, zoom out)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
       
        //region 객체
        let region = MKCoordinateRegion(center: loc, span: span)
        
        myMapView.setRegion(region, animated: true)
        
        // annotation 꼽기
        let anno = MKPointAnnotation()
        anno.coordinate = loc
        anno.title = "DIT동의과학대학교"
        anno.subtitle = "내 꿈이 자라나는 곳"
        myMapView.addAnnotation(anno)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

