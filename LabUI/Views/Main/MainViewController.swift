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

    let mainView: MainView = MainView.loadFromNib()!
    lazy var floatingPanel: FloatingPanelController = {
        let floatingPanel = FloatingPanelController()
        let fpContentViewController = FPContentViewController()
        floatingPanel.set(contentViewController: fpContentViewController)
        floatingPanel.track(scrollView: fpContentViewController.fpContentView.demoTableView)
        floatingPanel.surfaceView.cornerRadius = 9
        let dissmisTap = UITapGestureRecognizer(target: self, action: #selector(dissmissTap))
        floatingPanel.backdropView.gestureRecognizers = [dissmisTap]
        floatingPanel.delegate = self
        return floatingPanel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            //self.customAddPanel()
            self.customAddPanelNavigation()
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    override func loadView() {
        view = mainView
    }

    func setup() {
        title = "Fotos"
        mainView.demoTableView.dataSource = self
        mainView.demoTableView.delegate = self
        let modalButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showModal))
        navigationItem.rightBarButtonItem = modalButton
        mainView.demoTableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 70))
    }

    func customAddPanel() {
         view.addSubview(floatingPanel.view)
         floatingPanel.view.frame = view.bounds
         addChild(floatingPanel)
         floatingPanel.show(animated: true) {
             self.didMove(toParent: self)
         }
     }

    func customAddPanelNavigation() {
        guard let navigation = self.navigationController else {
            return
        }
        navigation.view.addSubview(floatingPanel.view)
        floatingPanel.view.frame = navigation.view.bounds
        navigation.addChild(floatingPanel)
        floatingPanel.show(animated: true) {
            self.didMove(toParent: navigation)
        }
    }

    func customRemovePanelNavigation() {
        floatingPanel.hide(animated: true) {
            self.floatingPanel.willMove(toParent: nil)
            self.floatingPanel.view.removeFromSuperview()
            self.floatingPanel.removeFromParent()
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

    func dissmissTap() {
        floatingPanel.move(to: .tip, animated: true)
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardTableViewCell", for: indexPath)
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        customRemovePanelNavigation()
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            self.navigationController?.show(DetailViewController(), sender: nil)
        }
    }
}

