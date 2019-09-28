//
//  DetailView.swift
//  LabUI
//
//  Created by Erik Flores on 9/28/19.
//  Copyright © 2019 Erik Fores. All rights reserved.
//

import UIKit

class DetailView: UIView {

    static func loadNib() -> DetailView? {
        let detailNib = UINib(nibName: "DetailView", bundle: nil).instantiate(withOwner: self, options: nil).first
        guard let detailView = detailNib as? DetailView else {
            return nil
        }
        return detailView
    }

}
