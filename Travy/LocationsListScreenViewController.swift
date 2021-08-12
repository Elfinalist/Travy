//
//  LocationsListScreenViewController.swift
//  Travy
//
//  Created by ELVIS WANJOHI on 12/08/2021.
//

import UIKit

class LocationsListScreenViewController: UIViewController {

    @IBOutlet var tableView: UITableView!

        var locations: [Location] = []
        
        

        override func viewDidLoad() {
            super.viewDidLoad()
            
            locations = createArray()
                
        }
        
        func createArray() -> [Location] {
            
            var tempLocations: [Location] = []
            
            let location1 = Location(image: UIImage(named: "Dubai")!, title: "Dubai")
            let location2 = Location(image: UIImage(named: "Ireland")!, title: "Ireland")
            let location3 = Location(image: UIImage(named: "Durban")!, title: "Durban")
            let location4 = Location(image: UIImage(named: "Mombasa")!, title: "Mombasa")
            let location5 = Location(image: UIImage(named: "Monaco")!, title: "Monaco")
            let location6 = Location(image: UIImage(named: "Serengeti")!, title: "Serengeti")
            
            tempLocations.append(location1)
            tempLocations.append(location2)
            tempLocations.append(location3)
            tempLocations.append(location4)
            tempLocations.append(location5)
            tempLocations.append(location6)
             
            return tempLocations
        }
       
    }

    extension LocationsListScreenViewController: UITableViewDataSource, UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return locations.count
        }
         
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let location = locations[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell") as! LocationCell
            
            cell.setLocation(location: location)
            
            return cell
        
        
    }

}
