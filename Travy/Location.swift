//
//  Location.swift
//  Travy
//
//  Created by ELVIS WANJOHI on 12/08/2021.
//

import Foundation
import UIKit


struct Location {

    var image: UIImage
    var title: String
    
    init(title: String) {
        self.title = title
        image = UIImage(named: title)!
    }
}
