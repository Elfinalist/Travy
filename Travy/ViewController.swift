 //
//  LocationsListScreenViewController.swift
//  Travy
//
import UIKit
import GoogleMaps
import MapKit
import FloatingPanel
 
 class ViewController:UIViewController, FloatingPanelControllerDelegate, UISearchResultsUpdating{

    
    
    let mapView = MKMapView()
    
    let searchVC = UISearchController(searchResultsController: ResultsViewController())
    
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
        title = "Maps"
        view.addSubview(mapView)
        searchVC.searchBar.backgroundColor = .secondarySystemBackground
        searchVC.searchResultsUpdater = self
        navigationItem.searchController = searchVC

        
        self.view.bringSubviewToFront(fpc.view)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mapView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.frame.size.width, height: view.frame.size.height - view.safeAreaInsets.top)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    
 }

 
 //https://maps.googleapis.com/maps/api/geocode/json?address=10+Princes+Street+Edinburgh+Scotland&key=AIzaSyB9GQHQsh3QFdLftBgms6pNm9g04fhZgEw

 //https://maps.googleapis.com/maps/api/geocode/json?latlng=-33.86,151.20&key=AIzaSyB9GQHQsh3QFdLftBgms6pNm9g04fhZgEw

 //https://console.cloud.google.com/google/maps-apis/metrics?project=keen-hangar-323210

 
 
// let lattitudeary = ["28.5355","28.7041","29.9457","30.0869"]
// let longitudeary = ["77.3910","77.1025","78.1642","78.2676"]
// for i in 0..<lattitudeary.count { var marker = GMSMarker()
//    marker.position = CLLocationCoordinate2D(latitude: Double(lattitudeary[i])!, longitude: Double(longitudeary[i])!) marker.map = mapView }
