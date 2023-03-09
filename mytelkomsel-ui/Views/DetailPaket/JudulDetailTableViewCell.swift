//
//  JudulDetailTableViewCell.swift
//  mytelkomsel-ui
//
//  Created by Phincon on 07/03/23.
//

import UIKit

class JudulDetailTableViewCell: UITableViewCell {
    
    static let identifier = "JudulDetailTableViewCell"
    @IBOutlet weak var hargaAwalLabel: UILabel!{
            didSet{
                let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "Rp99.000")
                    attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
                hargaAwalLabel.attributedText = attributeString
            }
    }
    @IBOutlet weak var hargaDiskonLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setJudulDetail(parseDataPaket: PaketStruct){
        
        if parseDataPaket.hargaDiskon == "" {
            hargaDiskonLabel.text = "FREE"
        } else {
            hargaDiskonLabel.text = parseDataPaket.hargaDiskon
        }

        hargaAwalLabel.text = parseDataPaket.hargaAwal
    }
}
