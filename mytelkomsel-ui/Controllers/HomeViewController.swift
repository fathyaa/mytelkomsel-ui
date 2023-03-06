//
//  ViewController.swift
//  mytelkomsel-ui
//
//  Created by Phincon on 06/03/23.
//

import UIKit

enum homeSection: Int{
    case paket
    case judulLanggananKamu
    case paketLanggananKamuCard
    case judulPopular
    case paketPopularCard
    case judulVoucher
    case voucher
    case judulBelajar
    case paketBelajarCard
    
    init(_ section: Int){
        switch section {
        case 0:
            self = .paket
        case 1:
            self = .judulLanggananKamu
        case 2:
            self = .paketLanggananKamuCard
        case 3:
            self = .judulPopular
        case 4:
            self = .paketPopularCard
        case 5:
            self = .judulVoucher
        case 6:
            self = .voucher
        case 7:
            self = .judulBelajar
        case 8:
            self = .paketBelajarCard
        default:
            self = .judulLanggananKamu
        }
    }
}

class HomeViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHomeTableView()
        title = "Paket Internet"
    }
    
    func setupHomeTableView(){
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.register(UINib(nibName: "PaketColTableViewCell", bundle: nil), forCellReuseIdentifier: PaketColTableViewCell.identifier)
        homeTableView.register(UINib(nibName: "JudulSectionTableViewCell", bundle: nil), forCellReuseIdentifier: JudulSectionTableViewCell.identifier)
        homeTableView.register(UINib(nibName: "PaketCardColTableViewCell", bundle: nil), forCellReuseIdentifier: PaketCardColTableViewCell.identifier)
        homeTableView.register(UINib(nibName: "VoucherColTableViewCell", bundle: nil), forCellReuseIdentifier: VoucherColTableViewCell.identifier)
        homeTableView.separatorStyle = .none
    }

}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch homeSection(indexPath.section){
        case .paket:
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: PaketColTableViewCell.identifier, for: indexPath) as? PaketColTableViewCell else {return UITableViewCell()}
            return cell
        case .judulLanggananKamu:
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: JudulSectionTableViewCell.identifier, for: indexPath) as? JudulSectionTableViewCell else {return UITableViewCell()}
            cell.judulSectionLabel.text = "Langganan Kamu"
            return cell
        case .paketLanggananKamuCard:
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: PaketCardColTableViewCell.identifier, for: indexPath) as? PaketCardColTableViewCell else {return UITableViewCell()}
            return cell
        case .judulPopular:
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: JudulSectionTableViewCell.identifier, for: indexPath) as? JudulSectionTableViewCell else {return UITableViewCell()}
            cell.judulSectionLabel.text = "Popular"
            return cell
        case .paketPopularCard:
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: PaketCardColTableViewCell.identifier, for: indexPath) as? PaketCardColTableViewCell else {return UITableViewCell()}
            return cell
        case .judulVoucher:
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: JudulSectionTableViewCell.identifier, for: indexPath) as? JudulSectionTableViewCell else {return UITableViewCell()}
            cell.judulSectionLabel.text = "Cari Tuyul, Yuk!"
            cell.setupLihatSemuaButton()
            return cell
        case .voucher:
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: VoucherColTableViewCell.identifier, for: indexPath) as? VoucherColTableViewCell else {return UITableViewCell()}
            return cell
        case .judulBelajar:
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: JudulSectionTableViewCell.identifier, for: indexPath) as? JudulSectionTableViewCell else {return UITableViewCell()}
            cell.judulSectionLabel.text = "Belajar #dirumahaja"
            return cell
        case .paketBelajarCard:
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: PaketCardColTableViewCell.identifier, for: indexPath) as? PaketCardColTableViewCell else {return UITableViewCell()}
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 9
    }
}
