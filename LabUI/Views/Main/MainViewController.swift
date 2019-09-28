//
//  MainViewController.swift
//  LabUI
//
//  Created by Erik Flores on 9/28/19.
//  Copyright © 2019 Erik Fores. All rights reserved.
//

import UIKit
import FloatingPanel

class MainViewController: UIViewController {

    let mainView: MainView = MainView.loadNib()!
    lazy var floatingPanel: FloatingPanelController = {
        let floatingPanel = FloatingPanelController()
        let fpContentViewController = FPContentViewController()
        floatingPanel.set(contentViewController: fpContentViewController)
        floatingPanel.track(scrollView: fpContentViewController.fpContentView.demoTableView)
        floatingPanel.surfaceView.cornerRadius = 9
        floatingPanel.delegate = self
        return floatingPanel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        customAddPanel()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func loadView() {
        view = mainView
    }

    func setup() {
        title = "Demo"
        mainView.demoTableView.dataSource = self
        let modalButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showModal))
        navigationItem.rightBarButtonItem = modalButton
    }

    func customAddPanel() {
         view.addSubview(floatingPanel.view)
         floatingPanel.view.frame = view.bounds
         addChild(floatingPanel)
         floatingPanel.show(animated: true) {
             self.didMove(toParent: self)
         }
     }

}

extension MainViewController: FloatingPanelControllerDelegate {
    func floatingPanel(_ vc: FloatingPanelController, layoutFor newCollection: UITraitCollection) -> FloatingPanelLayout? {
        return CustomFloatingPanelLayout()
    }
}

@objc
extension MainViewController {
    func showModal() {
        let modalNavigation = UINavigationController(rootViewController: ModalViewController())
        present(modalNavigation, animated: true, completion: nil)
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

