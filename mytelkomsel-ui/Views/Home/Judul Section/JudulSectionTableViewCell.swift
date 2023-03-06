//
//  JudulSectionTableViewCell.swift
//  mytelkomsel-ui
//
//  Created by Phincon on 06/03/23.
//

import UIKit

class JudulSectionTableViewCell: UITableViewCell {

    static let identifier = "JudulSectionTableViewCell"
    @IBOutlet weak var judulSectionView: UIView!
    @IBOutlet weak var judulSectionLabel: UILabel!

    var lihatSemuaButton: UILabel = {
        let lsb = UILabel()
        lsb.text = "Lihat semua"
        lsb.textColor = UIColor.red
        lsb.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        lsb.translatesAutoresizingMaskIntoConstraints = false
        return lsb
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupLihatSemuaButton(){
        judulSectionView.addSubview(lihatSemuaButton)
        NSLayoutConstraint.activate([
            lihatSemuaButton.topAnchor.constraint(equalTo: judulSectionView.topAnchor, constant: 24),
            lihatSemuaButton.bottomAnchor.constraint(equalTo: judulSectionView.bottomAnchor, constant: -20),
            lihatSemuaButton.leftAnchor.constraint(equalTo: judulSectionLabel.rightAnchor, constant: 110),
            lihatSemuaButton.rightAnchor.constraint(equalTo: judulSectionView.rightAnchor, constant: -15)
        ])
    }
}
