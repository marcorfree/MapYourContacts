//
//  ViewController.swift
//  MapYourContacts
//
//  Created by Marco Rago on 24/11/15.
//  Copyright © 2015 marcorfree. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mapView1: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        InitMap()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func InitMap() {
        let latitude: CLLocationDegrees = 40.7
        let longitude: CLLocationDegrees = -73.9
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        //Level of zoom
        let latDelta: CLLocationDegrees = 0.01
        let lonDelta: CLLocationDegrees = 0.01
        let span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let region: MKCoordinateRegion =  MKCoordinateRegionMake(location, span)
        mapView1.setRegion(region, animated: true)
        
        
        //Custom annotation
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Init"
        annotation.subtitle = "Whatever you want"
        mapView1.addAnnotation(annotation)
        
        //Add a GestureRecognizer for LongPress
        let gr1 = UILongPressGestureRecognizer(target: self, action: "action:" )    //":" for usign a func with parameters
        gr1.minimumPressDuration = 2    //2 seconds
        mapView1.addGestureRecognizer(gr1)
    }
    
    
    //Define Custom action for the GestureRecognizer
    func action (gestureRecognizer : UIGestureRecognizer) {
        let touchPoint = gestureRecognizer.locationInView(mapView1)
        let touchPointLocation : CLLocationCoordinate2D = mapView1.convertPoint(touchPoint, toCoordinateFromView: mapView1)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = touchPointLocation
        /*annotation.title = "Init"
        annotation.subtitle = "Whatever you want"*/
        mapView1.addAnnotation(annotation)

        
    }


}

