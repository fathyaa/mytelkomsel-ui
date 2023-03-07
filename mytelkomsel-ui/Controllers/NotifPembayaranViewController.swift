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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
