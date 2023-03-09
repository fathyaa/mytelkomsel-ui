//
//  PopularTableViewCell.swift
//  mytelkomsel-ui
//
//  Created by Phincon on 08/03/23.
//

import UIKit

class PopularTableViewCell: UITableViewCell {

    static let identifier = "PopularTableViewCell"
    var paketPopular: [PaketStruct] = []
    
    var popularCollectionView: UICollectionView = {
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
    
    func setupPopularCollectionView(paket: [PaketStruct]){
        self.paketPopular = paket.filter{ $0.isPopular}
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        popularCollectionView.register(UINib(nibName: "PaketCardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: PaketCardCollectionViewCell.identifier)
        
        contentView.addSubview(popularCollectionView)
        
        popularCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            popularCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            popularCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            popularCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            popularCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            popularCollectionView.heightAnchor.constraint(equalToConstant: 120)
        ])
        
    }
}

extension PopularTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return paketPopular.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: PaketCardCollectionViewCell.identifier, for: indexPath) as? PaketCardCollectionViewCell else {return UICollectionViewCell()}
        cell.setupMasaAktif()
        cell.setDataPaket(parseDataPaket: paketPopular[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width / 1.3, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.paketCellTaped(data: paketPopular[indexPath.row])
    }
    
}
