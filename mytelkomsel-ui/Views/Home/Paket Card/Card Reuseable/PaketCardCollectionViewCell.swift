//
//  PaketCardCollectionViewCell.swift
//  mytelkomsel-ui
//
//  Created by Phincon on 06/03/23.
//

import UIKit

class PaketCardCollectionViewCell: UICollectionViewCell {

    static let identifier = "PaketCardCollectionViewCell"
    @IBOutlet weak var paketCardView: UIView!{
        didSet{
            paketCardView.layer.borderColor = UIColor.borderColor.cgColor
            paketCardView.layer.borderWidth = 2
            paketCardView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var jumlahKuotaLabel: UILabel!
    @IBOutlet weak var hargaAwalLabel: UILabel!{
        didSet{
            let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "Rp99.000")
                attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
            hargaAwalLabel.attributedText = attributeString
        }
    }
    @IBOutlet weak var hargaDiskonLabel: UILabel!
    @IBOutlet weak var namaKuotaLabel: UILabel!
    
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
        hi.image = UIImage(named: "hourglass")
        hi.frame = CGRect(x: 0, y: 0, width: 10, height: 13.33)
        return hi
    }()
    
    var masaAktifLabel: UILabel = {
        let mal = UILabel()
        mal.translatesAutoresizingMaskIntoConstraints = false
        mal.text = "30 HARI"
        mal.font = UIFont.systemFont(ofSize: 12)
        return mal
    }()
    
    var saveButton: UIImageView = {
        let sb = UIImageView()
        sb.translatesAutoresizingMaskIntoConstraints = false
        sb.image = UIImage(named: "save")
        sb.frame = CGRect(x: 0, y: 0, width: 14, height: 18)
        return sb
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupMasaAktif(){
        paketCardView.addSubview(masaAktifView)
        masaAktifView.addSubview(hourglassIcon)
        masaAktifView.addSubview(masaAktifLabel)
        masaAktifView.addSubview(saveButton)
        
        NSLayoutConstraint.activate([
            masaAktifView.widthAnchor.constraint(equalToConstant: 90),
            masaAktifView.heightAnchor.constraint(equalToConstant: 28),
            masaAktifView.topAnchor.constraint(equalTo: paketCardView.topAnchor, constant: 14),
            masaAktifView.leftAnchor.constraint(equalTo: jumlahKuotaLabel.rightAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            hourglassIcon.topAnchor.constraint(equalTo: masaAktifView.topAnchor, constant: 7.3),
            hourglassIcon.bottomAnchor.constraint(equalTo: masaAktifView.bottomAnchor, constant: -7.3),
            hourglassIcon.leftAnchor.constraint(equalTo: masaAktifView.leftAnchor, constant: 12)
        ])
        
        NSLayoutConstraint.activate([
            masaAktifLabel.topAnchor.constraint(equalTo: masaAktifView.topAnchor, constant: 6),
            masaAktifLabel.bottomAnchor.constraint(equalTo: masaAktifView.bottomAnchor, constant: -6),
            masaAktifLabel.leftAnchor.constraint(equalTo: hourglassIcon.rightAnchor, constant: 8),
            masaAktifLabel.rightAnchor.constraint(equalTo: masaAktifView.rightAnchor, constant: -12)
        ])
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: paketCardView.topAnchor, constant: 15),
            saveButton.rightAnchor.constraint(equalTo: paketCardView.rightAnchor, constant: -17)
        ])
    }
    
    func setDataLanggananKamu(parseLanggananKamu: PaketLanggananKamuStruct){
        
        if parseLanggananKamu.hargaAwal.isEmpty{
            hargaAwalLabel.text = "empty"
            hargaAwalLabel.textColor = UIColor.white
            
        }
        
        namaKuotaLabel.text = parseLanggananKamu.nama
        jumlahKuotaLabel.text = parseLanggananKamu.jumlah
        hargaAwalLabel.text = parseLanggananKamu.hargaAwal
        hargaDiskonLabel.text = parseLanggananKamu.hargaDiskon
        masaAktifLabel.text = parseLanggananKamu.masaAktif
    }

}
