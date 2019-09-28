//
//  FPContentView.swift
//  LabUI
//
//  Created by Erik Flores on 9/28/19.
//  Copyright © 2019 Erik Fores. All rights reserved.
//

import UIKit

class FPContentView: UIView {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var demoTableView: DemoTableView!

    static func loadNib() -> FPContentView? {
        let fpContentNib = UINib(nibName: "FPContentView", bundle: nil).instantiate(withOwner: self, options: nil).first
        guard let fpContentView = fpContentNib as? FPContentView else {
            return nil
        }
        return fpContentView
    }

}
