//
//  ViewController.swift
//  mytelkomsel-ui
//
//  Created by Phincon on 06/03/23.
//

import UIKit

protocol CollectionViewInsideTableViewDelegate: AnyObject {
    func paketCellTaped(data:PaketStruct?)
}

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

    let modelPaket = PaketProvider.paket()
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
        homeTableView.register(LanggananKamuTableViewCell.self, forCellReuseIdentifier: LanggananKamuTableViewCell.identifier)
        homeTableView.register(BelajarDiRumahAjaTableViewCell.self, forCellReuseIdentifier: BelajarDiRumahAjaTableViewCell.identifier)
        homeTableView.register(UINib(nibName: "VoucherColTableViewCell", bundle: nil), forCellReuseIdentifier: VoucherColTableViewCell.identifier)
        homeTableView.register(PopularTableViewCell.self, forCellReuseIdentifier: PopularTableViewCell.identifier)
        homeTableView.separatorStyle = .none
    }

}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource, CollectionViewInsideTableViewDelegate{
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
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: LanggananKamuTableViewCell.identifier, for: indexPath) as? LanggananKamuTableViewCell else {return UITableViewCell()}
            cell.setupLanggananKamuCollectionView(paket: modelPaket)
            cell.delegate = self
            return cell
            
        case .judulPopular:
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: JudulSectionTableViewCell.identifier, for: indexPath) as? JudulSectionTableViewCell else {return UITableViewCell()}
            cell.judulSectionLabel.text = "Popular"
            return cell
            
        case .paketPopularCard:
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: PopularTableViewCell.identifier, for: indexPath) as? PopularTableViewCell else {return UITableViewCell()}
            cell.setupPopularCollectionView(paket: modelPaket)
            cell.delegate = self
            return cell
            
        case .judulVoucher:
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: JudulSectionTableViewCell.identifier, for: indexPath) as? JudulSectionTableViewCell else {return UITableViewCell()}
            cell.judulSectionLabel.text = "Cari Voucher, Yuk!"
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
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: BelajarDiRumahAjaTableViewCell.identifier, for: indexPath) as? BelajarDiRumahAjaTableViewCell else {return UITableViewCell()}
            cell.setupBelajarCollectionView(paket: modelPaket)
            cell.delegate = self
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 9
    }
    
    func paketCellTaped(data: PaketStruct?) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "DetailPaketViewController") as! DetailPaketViewController
        viewController.dataPaket = data
        navigationController?.pushViewController(viewController, animated: true)
    }
}
