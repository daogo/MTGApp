//
//  ViewController.swift
//  MTGApp
//
//  Created by Dawid Ogonowski on 01/12/2023.
//

import UIKit
import SwiftUI


class MainListHostingViewController: UIViewController {
    let hostingController = UIHostingController(rootView: MainListView())

    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(hostingController)
        view.addSubview(hostingController.view)
        setupConstraints()
    }

    private func setupConstraints() {
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
            ])
    }

}



