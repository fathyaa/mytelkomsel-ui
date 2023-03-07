//
//  DeskripsiTableViewCell.swift
//  mytelkomsel-ui
//
//  Created by Phincon on 07/03/23.
//

import UIKit

class DeskripsiTableViewCell: UITableViewCell {

    static let identifier = "DeskripsiTableViewCell"
    @IBOutlet weak var judulDeskripsiLabel: UILabel!
    @IBOutlet weak var deskripsiLabel: UILabel!{
        didSet{
            deskripsiLabel.text = """
            Paket Internet OMG! berlaku untuk 30 hari, dengan rincian kuota:
            
            - Kuota Internet dengan akses di semua jaringan (2G/3G/4G).
            - Kuota Nelpon ke Sesama Telkomsel
            - Kuota 2 GB OMG! untuk akses Youtube, Facebook, Instagram MAXstream, Viu, iFlix, Klik Film, Bein Sport, dan Nickelodeon Play berlaku 30 hari.
            - Termasuk berlangganan 30 hari.
            """
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
