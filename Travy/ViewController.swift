 //
//  LocationsListScreenViewController.swift
//  Travy
//
import UIKit
import GoogleMaps
import FloatingPanel
 
class ViewController:UIViewController, FloatingPanelControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Start of Floating Panel
        let fpc = FloatingPanelController()
        fpc.delegate = self
        
        guard let LocationVC = storyboard?.instantiateViewController(identifier: "fpc_content") as? LocationsListScreenViewController else {
            return
        }
        
        fpc.set(contentViewController: LocationVC)
        fpc.addPanel(toParent: self)
        // End floating Panel
        
        // Start Map
        GMSServices.provideAPIKey("AIzaSyB6v9m4ENGlUtZsyPUM7Dh4DMN1-QjQRjU")
        
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect(x: 0, y: 64, width: self.view.frame.size.width, height: self.view.frame.size.height), camera: camera)
        view.addSubview(mapView)
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        // End Map
        
        self.view.bringSubviewToFront(fpc.view)
    }
 }
