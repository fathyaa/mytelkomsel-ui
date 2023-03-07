//
//  VoucherColTableViewCell.swift
//  mytelkomsel-ui
//
//  Created by Phincon on 06/03/23.
//

import UIKit

class VoucherColTableViewCell: UITableViewCell {

    static let identifier = "VoucherColTableViewCell"
    @IBOutlet weak var voucherCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupVoucherCollectionView()
    }
    
    func setupVoucherCollectionView(){
        voucherCollectionView.delegate = self
        voucherCollectionView.dataSource = self
        voucherCollectionView.register(UINib(nibName: "VoucherCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: VoucherCollectionViewCell.identifier)
        voucherCollectionView.showsHorizontalScrollIndicator = false
    }
}

extension VoucherColTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = voucherCollectionView.dequeueReusableCell(withReuseIdentifier: VoucherCollectionViewCell.identifier, for: indexPath) as? VoucherCollectionViewCell else {return UICollectionViewCell()}
        cell.clipsToBounds = false
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width / 1.7, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}
