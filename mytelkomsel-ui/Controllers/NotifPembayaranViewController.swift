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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

