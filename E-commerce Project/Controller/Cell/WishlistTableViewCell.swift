//
//  WishlistTableViewCell.swift
//  E-commerce Project
//
//  Created by Akshay on 16/08/22.
//

import UIKit

class WishlistTableViewCell: UITableViewCell {

    @IBOutlet weak var wimageView: UIImageView!
    @IBOutlet weak var widLabel: UILabel!
    @IBOutlet weak var wtitleLabel: UILabel!
    @IBOutlet weak var wdescriptionLabel: UILabel!
    @IBOutlet weak var wcategoryLabel: UILabel!
    @IBOutlet weak var wratingLabel: UILabel!
    @IBOutlet weak var wpriceLabel: UILabel!
    @IBOutlet weak var wcountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
