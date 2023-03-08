//
//  DetailPaketViewController.swift
//  mytelkomsel-ui
//
//  Created by Phincon on 06/03/23.
//

import UIKit

enum detailSection: Int {
    case judulDetail
    case masaAktif
    case rincian
    case deskripsi
    
    init(_ section: Int){
        switch section{
        case 0:
            self = .judulDetail
        case 1:
            self = .masaAktif
        case 2:
            self = .rincian
        case 3:
            self = .deskripsi
        default:
            self = .judulDetail
        }
    }
}

class DetailPaketViewController: UIViewController {
    
    var dataLanggananKamu: PaketLanggananKamuStruct?
    @IBOutlet weak var detailPaketTableView: UITableView!
    @IBOutlet weak var beliSekarangButton: UIButton!{
        didSet{
            beliSekarangButton.layer.cornerRadius = 5
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = dataLanggananKamu?.jumlah
        setupPaketTableView()
        self.beliSekarangButton.addTarget(self, action: #selector(navigateToNotif), for: .touchUpInside)
    }
    
    func setupPaketTableView(){
        detailPaketTableView.delegate = self
        detailPaketTableView.dataSource = self
        detailPaketTableView.register(UINib(nibName: "JudulDetailTableViewCell", bundle: nil), forCellReuseIdentifier: JudulDetailTableViewCell.identifier)
        detailPaketTableView.register(UINib(nibName: "MasaAktifTableViewCell", bundle: nil), forCellReuseIdentifier: MasaAktifTableViewCell.identifier)
        detailPaketTableView.register(UINib(nibName: "RincianTableViewCell", bundle: nil), forCellReuseIdentifier: RincianTableViewCell.identifier)
        detailPaketTableView.register(UINib(nibName: "DeskripsiTableViewCell", bundle: nil), forCellReuseIdentifier: DeskripsiTableViewCell.identifier)
        detailPaketTableView.separatorStyle = .none
    }
    
    @objc func navigateToNotif(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "NotifPembayaranViewController") as! NotifPembayaranViewController
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension DetailPaketViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2{
            return dataLanggananKamu?.rincian.count ?? 0
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch detailSection(indexPath.section){
        case .judulDetail:
            guard let cell = detailPaketTableView.dequeueReusableCell(withIdentifier: JudulDetailTableViewCell.identifier, for: indexPath) as? JudulDetailTableViewCell else {return UITableViewCell()}
            
            if let data = dataLanggananKamu{
            cell.setJudulDetail(parseDataLanggananKamu: data)
            }
            
            return cell
            
        case .masaAktif:
            guard let cell = detailPaketTableView.dequeueReusableCell(withIdentifier: MasaAktifTableViewCell.identifier, for: indexPath) as? MasaAktifTableViewCell else {return UITableViewCell()}
            cell.setupMasaAktif()
            
            if let data = dataLanggananKamu{
            cell.setMasaAktif(parseDataLanggananKamu: data)
            }
            
            return cell
            
        case .rincian:
            guard let cell = detailPaketTableView.dequeueReusableCell(withIdentifier: RincianTableViewCell.identifier, for: indexPath) as? RincianTableViewCell else {return UITableViewCell()}
            if let data = dataLanggananKamu{
            cell.setRincian(parseDataRincian: data.rincian[indexPath.row])
            }
            return cell
            
        case .deskripsi:
            guard let cell = detailPaketTableView.dequeueReusableCell(withIdentifier: DeskripsiTableViewCell.identifier, for: indexPath) as? DeskripsiTableViewCell else {return UITableViewCell()}
            return cell
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = UIColor.borderColor
        footerView.heightAnchor.constraint(equalToConstant: 8).isActive = true
        return footerView
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch detailSection(section){
        case .judulDetail, .masaAktif, .deskripsi:
            return nil
            
        case .rincian:
            let headerView = UITableViewHeaderFooterView()
            
            let judulRincian = UILabel()
            judulRincian.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
            judulRincian.text = "Rincian Paket"
            judulRincian.translatesAutoresizingMaskIntoConstraints = false
            
            headerView.addSubview(judulRincian)
            
            NSLayoutConstraint.activate([
                judulRincian.topAnchor.constraint(equalTo: headerView.topAnchor),
                judulRincian.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 20),
                judulRincian.rightAnchor.constraint(equalTo: headerView.rightAnchor),
                judulRincian.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -8)
            ])
            
            return headerView
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        switch detailSection(section){
        case .judulDetail, .masaAktif, .deskripsi:
            return 0
            
        case .rincian:
            return 20
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 3{
            return 300
        } else{
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        if section == 3{
            return 0
        } else {
            return UITableView.automaticDimension
        }
    }
}
