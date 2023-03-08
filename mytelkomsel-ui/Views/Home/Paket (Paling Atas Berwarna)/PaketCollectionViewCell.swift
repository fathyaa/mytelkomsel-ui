//
//  PaketTableViewCell.swift
//  mytelkomsel-ui
//
//  Created by Phincon on 06/03/23.
//

import UIKit

class PaketCollectionViewCell: UICollectionViewCell {

    static let identifier = "PaketCollectionViewCell"
    @IBOutlet weak var paketView: UIView!{
        didSet{
            paketView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var paketImage: UIImageView!
    @IBOutlet weak var paketNameLabel: UILabel!
    @IBOutlet weak var paketDescLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
