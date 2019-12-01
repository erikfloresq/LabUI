//
//  CollectionTableViewCell.swift
//  LabUI
//
//  Created by Erik Flores on 10/24/19.
//  Copyright © 2019 Erik Fores. All rights reserved.
//

import UIKit

class CollectionTableViewCell: UITableViewCell {

    @IBOutlet weak var demoCollectionView: DemoCollectionView!
    var numberItems: Int = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        demoCollectionView.delegate = self
        demoCollectionView.dataSource = self
    }

    func setup(numberItems: Int) {
        self.numberItems = numberItems
    }

}

extension CollectionTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.numberItems
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell", for: indexPath)
        guard let itemCell = cell as? ItemCollectionViewCell else {
            return UICollectionViewCell()
        }
        itemCell.indexLabel.text = "\(indexPath.row + 1)"
        return cell
    }
}

extension CollectionTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 250)
    }
}
