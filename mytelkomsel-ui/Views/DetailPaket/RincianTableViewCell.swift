//
//  RincianTableViewCell.swift
//  mytelkomsel-ui
//
//  Created by Phincon on 07/03/23.
//

import UIKit

class RincianTableViewCell: UITableViewCell {
    
    static let identifier = "RincianTableViewCell"
    @IBOutlet weak var jenisRincianLabel: UILabel!
    @IBOutlet weak var jumlahLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setRincian(parseDataRincian: RincianPaketStruct){
        jenisRincianLabel.text = parseDataRincian.jenis
        jumlahLabel.text = parseDataRincian.jumlah
    }
    
}
