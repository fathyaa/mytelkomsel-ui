//
//  VoucherCollectionViewCell.swift
//  mytelkomsel-ui
//
//  Created by Phincon on 06/03/23.
//

import UIKit

class VoucherCollectionViewCell: UICollectionViewCell {

    static let identifier = "JudulSectionTableViewCell"
    @IBOutlet weak var voucherView: UIView!{
        didSet{
            voucherView.layer.borderColor = UIColor.borderColor.cgColor
            voucherView.layer.borderWidth = 2
            voucherView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var voucherImage: UIImageView!{
        didSet{
            voucherImage.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var voucherLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
