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
    let viewModel = MainViewModel()

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

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        visibleStack()
    }

    func visibleCell() {
        let tableViewCells = mainView.demoTableView.visibleCells
        print("tableViewCells viewed \(tableViewCells.count)")
        for tableViewCell in tableViewCells {
            if let tableViewCell = tableViewCell as? CollectionTableViewCell {
                let itemsCell = tableViewCell.demoCollectionView.visibleCells
                print("itemsCell viewed \(itemsCell.count)")
            }
        }
    }

    func visibleStack() {
        let tableViewCells = mainView.demoTableView.visibleCells
        for tableViewCell in tableViewCells {
            if let tableViewCellDemo = tableViewCell as? CollectionTableViewCell {
                guard let collectionView = tableViewCellDemo.demoCollectionView else {return}
                let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
                print("visibleRect \(visibleRect)")
                let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
                print("visiblePoint \(visiblePoint)")
            }
        }
    }

}

extension MainViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numbersItems.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionTableViewCell", for: indexPath)
        guard let cellItem = cell as? CollectionTableViewCell else {
            return UITableViewCell()
        }
        cellItem.setup(numberItems: viewModel.numbersItems[indexPath.section])
        return cell
    }
}

extension MainViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: DemoHeaderTableView = DemoHeaderTableView.loadFromNib()!
        headerView.demoTitle.text = "Section \(section + 1)"
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(viewModel.numbersItems[indexPath.section] * 260)
    }
}
