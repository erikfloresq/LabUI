//
//  ModalView.swift
//  LabUI
//
//  Created by Erik Flores on 9/28/19.
//  Copyright © 2019 Erik Fores. All rights reserved.
//

import UIKit

class ModalView: UIView {

    static func loadNib() -> ModalView? {
        let modalNib = UINib(nibName: "ModalView", bundle: nil).instantiate(withOwner: self, options: nil).first
        guard let modalView = modalNib as? ModalView else {
            return nil
        }
        return modalView
    }

}
