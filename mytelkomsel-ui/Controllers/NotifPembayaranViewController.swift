//
//  NotifPembayaranViewController.swift
//  mytelkomsel-ui
//
//  Created by Phincon on 07/03/23.
//

import UIKit

class NotifPembayaranViewController: UIViewController {

    @IBOutlet weak var pinkCircleView: UIView!{
        didSet{
            pinkCircleView.layer.cornerRadius = 100
            pinkCircleView.backgroundColor = UIColor(rgb: 0xF9D4DB)
        }
    }
    @IBOutlet weak var redCircleView: UIView!{
        didSet{
            redCircleView.layer.cornerRadius = 57
            redCircleView.backgroundColor = UIColor(rgb: 0xEC2029)
        }
    }
    @IBOutlet weak var checkImage: UIImageView!{
        didSet{
            checkImage.image = UIImage(named: "check")
        }
    }
    @IBOutlet weak var detailPaketView: UIView!{
        didSet{
            detailPaketView.layer.cornerRadius = 10
            detailPaketView.layer.borderColor = UIColor.borderColor.cgColor
            detailPaketView.layer.borderWidth = 1
        }
    }
    @IBOutlet weak var namaDanJumlahPaketLabel: UILabel!
    @IBOutlet weak var rincianPaketLabel: UILabel!
    
    var dataPaket: PaketStruct?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = dataPaket{
        setDataNotif(parseDataNotif: data)
        }
    }
    
    func setDataNotif(parseDataNotif: PaketStruct){
        namaDanJumlahPaketLabel.text = parseDataNotif.nama + " " + parseDataNotif.jumlah
        
        var rincianPaket: String = ""
        var counter = 0
        if let paket = dataPaket{
            for data in paket.rincian{
                rincianPaket.append("\(data.jenis) \(data.jumlah)")
                counter += 1
                
                if counter == paket.rincian.count {
                    break
                } else {
                    rincianPaket.append(" + ")
                    continue
                }
            }
            
        rincianPaketLabel.text = rincianPaket
            
        }
    }
}

