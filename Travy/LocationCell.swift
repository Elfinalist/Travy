//
//  LocationCell.swift
//  Travy
//
//  Created by ELVIS WANJOHI on 12/08/2021.
//

import UIKit

class LocationCell: UITableViewCell {

    @IBOutlet var locationImageView: UIImageView!
    @IBOutlet var locationTitleLabel: UILabel!
    
    func setLocation( location: Location) {
        locationImageView.image = location.image
        locationTitleLabel.text = location.title
    }
    
}
