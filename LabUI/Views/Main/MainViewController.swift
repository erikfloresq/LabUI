//
//  MainViewController.swift
//  LabUI
//
//  Created by Erik Flores on 9/28/19.
//  Copyright © 2019 Erik Fores. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    let mainView: MainView = MainView.loadFromNib()!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func loadView() {
        view = mainView
    }

    func setup() {
        title = "Demo"
        mainView.demoTableView.dataSource = self
    }

}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicTableViewCell", for: indexPath)
        return cell
    }
}
