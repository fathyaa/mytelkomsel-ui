//
//  PaketColTableViewCell.swift
//  mytelkomsel-ui
//
//  Created by Phincon on 06/03/23.
//

import UIKit

class PaketColTableViewCell: UITableViewCell {

    static let identifier = "PaketColTableViewCell"
    @IBOutlet weak var paketCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupPaketCollectionView()
    }
    
    func setupPaketCollectionView(){
        paketCollectionView.delegate = self
        paketCollectionView.dataSource = self
        paketCollectionView.register(UINib(nibName: "PaketCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: PaketCollectionViewCell.identifier)
        paketCollectionView.showsHorizontalScrollIndicator = false
    }
    
}

extension PaketColTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = paketCollectionView.dequeueReusableCell(withReuseIdentifier: PaketCollectionViewCell.identifier, for: indexPath) as? PaketCollectionViewCell else {return UICollectionViewCell()}
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width / 1.3, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}
