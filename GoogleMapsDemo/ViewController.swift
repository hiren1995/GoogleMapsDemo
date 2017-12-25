//
//  ViewController.swift
//  GoogleMapsDemo
//
//  Created by APPLE MAC MINI on 28/06/17.
//  Copyright © 2017 APPLE MAC MINI. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces



class ViewController: UIViewController,CLLocationManagerDelegate,GMSMapViewDelegate{
    
  
    
    var locationManager=CLLocationManager()
    lazy var mapView = GMSMapView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //definr the api key 
        
        GMSServices.provideAPIKey("AIzaSyCj97gPgDrshjuKaXNYrWZtLR3FYf1ata4")
        
        //code to egt current coordinates...
        
        //mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera2)
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        
        
        //print("hello world...")
        
        
        //here the code for showing static coordinates is gove below
        
        
        /*
         //this code is for static location of lattitude and longitude
        
        let camera1 = GMSCameraPosition.camera(withLatitude: 22.322479, longitude: 73.180944, zoom: 16.0)
        
        let mapview=GMSMapView.map(withFrame: CGRect.zero, camera: camera1)
        
        mapview.isMyLocationEnabled = true
        
        view = mapview
        
        let Marker = GMSMarker()
        
        Marker.position=CLLocationCoordinate2DMake(22.322479, 73.180944)
        Marker.title="Maharaja Sayajirao University"
        Marker.snippet="India"
        Marker.map=mapview
        Marker.icon = UIImage(named: "marker")
       
 
 
        */
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
       let mylocation = locations.last
        
        //let current = CLLocationCoordinate2DMake(mylocation!.coordinate.latitude, mylocation!.coordinate.longitude)
        
        let camera2 = GMSCameraPosition.camera(withLatitude: mylocation!.coordinate.latitude, longitude: mylocation!.coordinate.longitude, zoom: 16.0)
        
        
        
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera2)
        mapView.isMyLocationEnabled = true
        self.view = mapView
        
        
        let Marker = GMSMarker()
        
        
        Marker.position=CLLocationCoordinate2DMake(mylocation!.coordinate.latitude, mylocation!.coordinate.longitude)
        Marker.title="My Location"
        Marker.snippet="India"
        Marker.map = mapView
        Marker.icon = UIImage(named: "marker")
        
        mapView.delegate = self
        
       locationManager.stopUpdatingLocation()
        
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        
        //print("hello map")
        
        
        
        /*
        let myFirstButton = UIButton()
        myFirstButton.setTitle("*", for: .normal)
        myFirstButton.backgroundColor = UIColor.orange
        myFirstButton.setTitleColor(UIColor.blue, for: .normal)
        myFirstButton.frame = CGRectMake(15,500,300,50)
        myFirstButton.addTarget(self, action:#selector(btnpress), for: .touchUpInside)
        
        self.view.addSubview(myFirstButton)
 
        */
        
        let newView = UIView()
        let imgview = UIImageView()
        let locationName = UILabel()
        let nextbtn=UIButton()
        
        newView.frame=CGRectMake(10, 100, 300, 50)
        newView.backgroundColor=UIColor.white
        
        imgview.frame=CGRectMake(0, 0, 50, 50)
        imgview.image=UIImage(named: "marker")
        
        locationName.frame=CGRectMake(70, 0, 200, 50)
        locationName.text="Barodacoders"
        locationName.backgroundColor=UIColor(colorLiteralRed: 255.0, green: 194.0, blue: 163.0, alpha: 0.9)
        
        
        nextbtn.frame=CGRectMake(250, 10, 30, 30)
        nextbtn.layer.cornerRadius = 25
        nextbtn.setImage(UIImage(named:"next"), for: .normal)
        nextbtn.backgroundColor = UIColor.orange
        nextbtn.setTitleColor(UIColor.white, for: .normal)
        nextbtn.addTarget(self, action:#selector(btnpress), for: .touchUpInside)
        
        
        
        
        newView.addSubview(imgview)
        newView.addSubview(locationName)
        newView.addSubview(nextbtn)
        
        self.view.addSubview(newView)
        
        
        
        
 
        return true
    }
    
    func btnpress() {
    
        
        let nextpage=UIView()
        
        nextpage.frame=CGRectMake(0, 0, 360, 640)
        nextpage.backgroundColor=UIColor.blue
        
        self.view=nextpage
        
        
    }

    
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
   
    
  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

