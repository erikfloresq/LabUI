//
//  MainView.swift
//  LabUI
//
//  Created by Erik Flores on 9/28/19.
//  Copyright © 2019 Erik Fores. All rights reserved.
//

import UIKit

class MainView: UIView {

    @IBOutlet weak var demoTableView: DemoTableView!

    static func loadNib() -> MainView? {
        let mainNib = UINib(nibName: "MainView", bundle: nil).instantiate(withOwner: self, options: nil).first
        guard let mainView = mainNib as? MainView else {
            return nil
        }
        return mainView
    }

}
