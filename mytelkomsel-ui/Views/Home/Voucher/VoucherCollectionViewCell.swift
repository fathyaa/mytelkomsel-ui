//
//  VoucherCollectionViewCell.swift
//  mytelkomsel-ui
//
//  Created by Phincon on 06/03/23.
//

import UIKit

class VoucherCollectionViewCell: UICollectionViewCell {

    
    static let identifier = "JudulSectionTableViewCell"
    @IBOutlet weak var voucherShadowView: UIView!
    @IBOutlet weak var voucherView: UIView!{
        didSet{
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
        setupShadowView()
    }
    
    func setupShadowView(){
        voucherShadowView.layer.cornerRadius = 10
        voucherShadowView.layer.shadowColor = UIColor.lightGray.cgColor
        voucherShadowView.layer.shadowOpacity = 0.4
        voucherShadowView.layer.shadowOffset = .zero
        voucherShadowView.layer.shadowRadius = 4
    }
    
    func setDataVoucher(parseDataVoucher: VoucherStruct){
        voucherImage.image = UIImage(named: parseDataVoucher.thumbnailImage)
        voucherLabel.text = parseDataVoucher.label
    }
}
