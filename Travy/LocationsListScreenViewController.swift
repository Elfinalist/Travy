//
//  LocationsListScreenViewController.swift
//  Travy
//
//  Created by ELVIS WANJOHI on 26/08/2021.
//

import UIKit
import os.log

class LocationsListScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet var myTableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
    var locations: [Location]!
    var searching = false
        
    var locationArray = [Location]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        title = "Destinations"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        searchBar.delegate = self
        
        locationArray = ["Dubai","Ireland","Durban","Mombasa","Monaco","Sydney","Guangzhou","Amazon","Honolulu","Borabora","Athens"]
            .map(Location.init(title:))
        locations = locationArray

     }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return locations.count
        } else {
            return locationArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let location = locations[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell") as! LocationCell
        
        cell.setLocation(location: location)
        
        if searching
        {
            cell.locationTitleLabel?.text = locations[indexPath.row].title
            cell.locationImageView?.image = locations[indexPath.row].image
        }else{
            cell.locationTitleLabel?.text = locationArray[indexPath.row].title
            cell.locationImageView?.image = locationArray[indexPath.row].image
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       if editingStyle == .delete {
           // Delete the row from the data source
           locations.remove(at: indexPath.row)
           tableView.deleteRows(at: [indexPath], with: .fade)
       } else if editingStyle == .insert {

       }
   }

    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        locations = locationArray.filter({$0.title.prefix(searchText.count) == searchText})
        searching = true
//        tableView.reloadData()
        
    }

}
