//
//  FPContentViewController.swift
//  LabUI
//
//  Created by Erik Flores on 9/28/19.
//  Copyright © 2019 Erik Fores. All rights reserved.
//

import UIKit

class FPContentViewController: UIViewController {

    let fpContentView: FPContentView = FPContentView.loadFromNib()!

    override func viewDidLoad() {
        super.viewDidLoad()
        fpContentView.demoTableView.dataSource = self
        fpContentView.demoTableView.delegate = self
        fpContentView.demoTableView.separatorStyle = .none
    }

    override func loadView() {
        view = fpContentView
    }

}

extension FPContentViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardTableViewCell", for: indexPath)
        return cell
    }
}

extension FPContentViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}
