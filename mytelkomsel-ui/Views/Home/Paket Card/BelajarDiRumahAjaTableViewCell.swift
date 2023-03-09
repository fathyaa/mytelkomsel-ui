//
//  BelajarDiRumahAjaTableViewCell.swift
//  mytelkomsel-ui
//
//  Created by Phincon on 08/03/23.
//

import UIKit

class BelajarDiRumahAjaTableViewCell: UITableViewCell {
    
    static let identifier = "BelajarDiRumahAjaTableViewCell"
    var paketBelajar: [PaketStruct] = []
    
    var belajarCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.layer.masksToBounds = false
        return collectionView
    }()
    
    weak var delegate: CollectionViewInsideTableViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupBelajarCollectionView(paket: [PaketStruct]){
        self.paketBelajar = paket.filter{ $0.isBelajar}
        belajarCollectionView.delegate = self
        belajarCollectionView.dataSource = self
        belajarCollectionView.register(UINib(nibName: "PaketCardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: PaketCardCollectionViewCell.identifier)
        
        contentView.addSubview(belajarCollectionView)
        
        belajarCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            belajarCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            belajarCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            belajarCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            belajarCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            belajarCollectionView.heightAnchor.constraint(equalToConstant: 120)
        ])
        
    }
}

extension BelajarDiRumahAjaTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return paketBelajar.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = belajarCollectionView.dequeueReusableCell(withReuseIdentifier: PaketCardCollectionViewCell.identifier, for: indexPath) as? PaketCardCollectionViewCell else {return UICollectionViewCell()}
        cell.setupMasaAktif()
        cell.setDataPaket(parseDataPaket: paketBelajar[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width / 1.3, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.paketCellTaped(data: paketBelajar[indexPath.row])
    }
}
