//
//  DemoTableView.swift
//  LabUI
//
//  Created by Erik Flores on 9/28/19.
//  Copyright © 2019 Erik Fores. All rights reserved.
//

import UIKit

class DemoTableView: UITableView {

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    func setup() {
        registerCells()
    }

    func registerCells() {
        let basicCell = UINib(nibName: "BasicTableViewCell", bundle: nil)
        register(basicCell, forCellReuseIdentifier: "BasicTableViewCell")
        let cardCell = UINib(nibName: "CardTableViewCell", bundle: nil)
        register(cardCell, forCellReuseIdentifier: "CardTableViewCell")
        let collectionCell = UINib(nibName: "CollectionTableViewCell", bundle: nil)
        register(collectionCell, forCellReuseIdentifier: "CollectionTableViewCell")
    }



}
