//
//  WeatherTableViewCell.swift
//  Travy
//
//  Created by ELVIS WANJOHI on 03/09/2021.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var highTempLabel: UILabel!
    @IBOutlet var lowTempLabel: UILabel!
    @IBOutlet var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
       
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static let identifier = "WeatherTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "WeatherTableViewCell", bundle: nil)
    }
    
    
    func configure(with model: Daily) {
        
        self.lowTempLabel.textAlignment = .center
        self.highTempLabel.textAlignment = .center
        self.lowTempLabel.text = "\(Int(model.temp.eve))º"
        self.highTempLabel.text = "\(Int(model.temp.day))º"
        self.dayLabel.text = getDayForDate(_date: Date(timeIntervalSince1970: Double(model.dt)))
        self.iconImageView.image = UIImage(named: "01d")
        self.iconImageView.contentMode = .scaleAspectFit
        


    }
    
    func getDayForDate(_date: Date?) -> String {
        guard let inputDate = _date  else {
            return ""
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"  //Monday
        return formatter.string(from: inputDate)
    }

}
