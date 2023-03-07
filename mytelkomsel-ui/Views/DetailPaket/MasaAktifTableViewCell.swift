//
//  MasaAktifTableViewCell.swift
//  mytelkomsel-ui
//
//  Created by Phincon on 07/03/23.
//

import UIKit

class MasaAktifTableViewCell: UITableViewCell {

    static let identifier = "MasaAktifTableViewCell"
    @IBOutlet weak var masaAktifViewParent: UIView!
    @IBOutlet weak var masaAktifLabel: UILabel!
    
    var masaAktifView: UIView = {
        let mav = UIView()
        mav.translatesAutoresizingMaskIntoConstraints = false
        mav.backgroundColor = UIColor.borderColor
        mav.layer.cornerRadius = 13
        return mav
    }()
    
    var hourglassIcon: UIImageView = {
        let hi = UIImageView()
        hi.translatesAutoresizingMaskIntoConstraints = false
        hi.image = UIImage(named: "hourglass-red")
        hi.frame = CGRect(x: 0, y: 0, width: 10, height: 13.33)
        return hi
    }()
    
    var masaAktifLogoLabel: UILabel = {
        let mal = UILabel()
        mal.translatesAutoresizingMaskIntoConstraints = false
        mal.text = "30 HARI"
        mal.font = UIFont.systemFont(ofSize: 12)
        mal.textColor = UIColor.red
        return mal
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupMasaAktif(){
        masaAktifViewParent.addSubview(masaAktifView)
        masaAktifView.addSubview(hourglassIcon)
        masaAktifView.addSubview(masaAktifLogoLabel)
        
        NSLayoutConstraint.activate([
            masaAktifView.widthAnchor.constraint(equalToConstant: 90),
            masaAktifView.heightAnchor.constraint(equalToConstant: 28),
            masaAktifView.topAnchor.constraint(equalTo: masaAktifViewParent.topAnchor, constant: 12),
            masaAktifView.rightAnchor.constraint(equalTo: masaAktifViewParent.rightAnchor, constant: -20),
            masaAktifView.leftAnchor.constraint(equalTo: masaAktifLabel.rightAnchor, constant: 110),
            masaAktifView.bottomAnchor.constraint(equalTo: masaAktifViewParent.bottomAnchor, constant: -12)
        ])
        
        NSLayoutConstraint.activate([
            hourglassIcon.topAnchor.constraint(equalTo: masaAktifView.topAnchor, constant: 7.3),
            hourglassIcon.bottomAnchor.constraint(equalTo: masaAktifView.bottomAnchor, constant: -7.3),
            hourglassIcon.leftAnchor.constraint(equalTo: masaAktifView.leftAnchor, constant: 12)
        ])
        
        NSLayoutConstraint.activate([
            masaAktifLogoLabel.topAnchor.constraint(equalTo: masaAktifView.topAnchor, constant: 6),
            masaAktifLogoLabel.bottomAnchor.constraint(equalTo: masaAktifView.bottomAnchor, constant: -6),
            masaAktifLogoLabel.leftAnchor.constraint(equalTo: hourglassIcon.rightAnchor, constant: 8),
            masaAktifLogoLabel.rightAnchor.constraint(equalTo: masaAktifView.rightAnchor, constant: -12)
        ])
    }
}
