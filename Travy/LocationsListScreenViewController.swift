//
//  LocationsListScreenViewController.swift
//  Travy
//
//  Created by ELVIS WANJOHI on 12/08/2021.
//

import UIKit
import os.log

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
    
    
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            locations.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
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


