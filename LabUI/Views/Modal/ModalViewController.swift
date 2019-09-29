//
//  ModalViewController.swift
//  LabUI
//
//  Created by Erik Flores on 9/28/19.
//  Copyright © 2019 Erik Fores. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    let modalView: ModalView = ModalView.loadFromNib()!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        view = modalView
    }

}
