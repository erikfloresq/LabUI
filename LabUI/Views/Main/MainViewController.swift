//
//  MainViewController.swift
//  LabUI
//
//  Created by Erik Flores on 9/28/19.
//  Copyright © 2019 Erik Fores. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    let mainView: MainView = MainView.loadFormNib()!

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
        mainView.demoTableView.delegate = self
    }

}

extension MainViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionTableViewCell", for: indexPath)
        return cell
    }
}

extension MainViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: DemoHeaderTableView = DemoHeaderTableView.loadFormNib()!
        headerView.demoTitle.text = "Title"
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

