//
//  CardDetailsViewController.swift
//  MTGApp
//
//  Created by Dawid Ogonowski on 14/12/2023.
//

import UIKit
import Combine
import SwiftUI

class CardDetailsViewController: UIViewController {
    let detailsView: CardDetailsView

    lazy var hostingController: UIHostingController<CardDetailsView> = {
        return UIHostingController(rootView: detailsView)
    }()

    private var cancellables: Set<AnyCancellable> = []


    init(detailsView: CardDetailsView) {
        self.detailsView = detailsView
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(hostingController)
        view.addSubview(hostingController.view)
        setupConstraints()
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }

    private func setupNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
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
