//
//  TableViewCell.swift
//  Core Data
//
//  Created by Adwait Barkale on 18/08/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblMobile: UILabel!
    
    
    var student: Student!{
        didSet{
            lblName.text = "Name = \(student.name ?? "N/A")"
            lblAddress.text = "Address = \(student.address ?? "N/A")"
            lblCity.text = "City = \(student.city ?? "N/A")"
            lblMobile.text = "Mobile = \(student.mobile ?? "N/A")"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
