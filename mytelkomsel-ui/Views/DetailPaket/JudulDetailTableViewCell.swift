//
//  JudulDetailTableViewCell.swift
//  mytelkomsel-ui
//
//  Created by Phincon on 07/03/23.
//

import UIKit

class JudulDetailTableViewCell: UITableViewCell {
    
    static let identifier = "JudulDetailTableViewCell"
    @IBOutlet weak var hargaAwalLabel: UILabel!
    @IBOutlet weak var hargaDIskonLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
