//
//  ListTableViewCell.swift
//  Detetive
//
//  Created by Rebeca Pacheco on 03/12/20.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var hour: UILabel!
    @IBOutlet weak var local: UILabel!
    @IBOutlet weak var suspect: UIImageView!
    @IBOutlet weak var weapon: UIImageView!
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
