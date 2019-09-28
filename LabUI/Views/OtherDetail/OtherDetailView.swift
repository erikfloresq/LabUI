//
//  OtherDetailView.swift
//  LabUI
//
//  Created by Erik Flores on 9/28/19.
//  Copyright © 2019 Erik Fores. All rights reserved.
//

import UIKit

class OtherDetailView: UIView {

    static func loadNib() -> OtherDetailView? {
        let otherDetailNib = UINib(nibName: "OtherDetailView", bundle: nil).instantiate(withOwner: self, options: nil).first
        guard let otherDetailView = otherDetailNib as? OtherDetailView else {
            return nil
        }
        return otherDetailView
    }

}
