//
//  DemoCollectionView.swift
//  LabUI
//
//  Created by Erik Flores on 10/24/19.
//  Copyright © 2019 Erik Fores. All rights reserved.
//

import UIKit

class DemoCollectionView: UICollectionView {

    override func draw(_ rect: CGRect) {
        // Drawing code
    }

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    func setup() {
        registerItem()
    }

    func registerItem() {
        let nib = UINib(nibName: "ItemCollectionViewCell", bundle: nil)
        register(nib, forCellWithReuseIdentifier: "ItemCollectionViewCell")
    }

}
