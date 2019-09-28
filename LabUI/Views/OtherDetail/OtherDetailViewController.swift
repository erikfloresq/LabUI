//
//  OtherDetailViewController.swift
//  LabUI
//
//  Created by Erik Flores on 9/28/19.
//  Copyright © 2019 Erik Fores. All rights reserved.
//

import UIKit

class OtherDetailViewController: UIViewController {

    let otherDetailView: OtherDetailView = OtherDetailView.loadNib()!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    override func loadView() {
        view = otherDetailView
    }

}


