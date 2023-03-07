//
//  PaketCardColTableViewCell.swift
//  mytelkomsel-ui
//
//  Created by Phincon on 06/03/23.
//

import UIKit

class PaketCardColTableViewCell: UITableViewCell {

    static let identifier = "PaketCardColTableViewCell"
    
    @IBOutlet weak var paketCardCollectionView: UICollectionView!
    weak var delegate:CollectionViewInsideTableViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupPaketCardCollectionView()
        
    }
    
    func setupPaketCardCollectionView(){
        paketCardCollectionView.delegate = self
        paketCardCollectionView.dataSource = self
        paketCardCollectionView.register(UINib(nibName: "PaketCardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: PaketCardCollectionViewCell.identifier)
        paketCardCollectionView.showsHorizontalScrollIndicator = false
    }
}

extension PaketCardColTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = paketCardCollectionView.dequeueReusableCell(withReuseIdentifier: PaketCardCollectionViewCell.identifier, for: indexPath) as? PaketCardCollectionViewCell else {return UICollectionViewCell()}
        cell.setupMasaAktif()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width / 1.3, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.cellTaped(data: indexPath)
    }
}
