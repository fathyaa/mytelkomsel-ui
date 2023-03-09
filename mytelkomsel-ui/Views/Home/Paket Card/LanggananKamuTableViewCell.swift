//
//  PaketCardColTableViewCell.swift
//  mytelkomsel-ui
//
//  Created by Phincon on 06/03/23.
//

import UIKit

class LanggananKamuTableViewCell: UITableViewCell {

    static let identifier = "LanggananKamuTableViewCell"
    var paketLanggananKamu: [PaketStruct] = []
    weak var delegate: CollectionViewInsideTableViewDelegate?
    
    var langgananKamuCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.layer.masksToBounds = false
        return collectionView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupLanggananKamuCollectionView(paket: [PaketStruct]){
        self.paketLanggananKamu = paket.filter{ $0.isLanggananKamu}
        langgananKamuCollectionView.delegate = self
        langgananKamuCollectionView.dataSource = self
        langgananKamuCollectionView.register(UINib(nibName: "PaketCardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: PaketCardCollectionViewCell.identifier)
        
        contentView.addSubview(langgananKamuCollectionView)
        
        langgananKamuCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            langgananKamuCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            langgananKamuCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            langgananKamuCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            langgananKamuCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            langgananKamuCollectionView.heightAnchor.constraint(equalToConstant: 120)
        ])
        
    }
}

extension LanggananKamuTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return paketLanggananKamu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = langgananKamuCollectionView.dequeueReusableCell(withReuseIdentifier: PaketCardCollectionViewCell.identifier, for: indexPath) as? PaketCardCollectionViewCell else {return UICollectionViewCell()}
        cell.setupMasaAktif()
        cell.setDataPaket(parseDataPaket: paketLanggananKamu[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width / 1.3, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.paketCellTaped(data: paketLanggananKamu[indexPath.row])
    }
}
