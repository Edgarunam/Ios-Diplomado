//
//  MenuMovieCell.swift
//  NavigationApp
//
//  Created by DISMOV on 17/09/22.
//

import UIKit

class MenuMovieCell: UITableViewCell {

    @IBOutlet var menuMovieImage: UIImageView!
    @IBOutlet var menuMovieLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
   
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
