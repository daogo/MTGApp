//
//  ViewController.swift
//  MTGApp
//
//  Created by Dawid Ogonowski on 01/12/2023.
//

import UIKit
import SwiftUI
import Combine

class MainListHostingViewController: UIViewController {
    let listViewModel = MainListViewModel()
    lazy var listView: MainListView = {
        return MainListView(viewModel: self.listViewModel)
    }()

    lazy var hostingController: UIHostingController<MainListView> = {
        return UIHostingController(rootView: listView)
    }()

    private var cancellables: Set<AnyCancellable> = []

    weak var coordinator: MainCoordinatorProtocol?

    init(coordinator: MainCoordinatorProtocol) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(hostingController)
        view.addSubview(hostingController.view)
        setupConstraints()
        setupSubscriptions()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.isHidden = true
    }

    private func setupSubscriptions() {
        listViewModel.rowTapped
            .sink { [weak self] card in
                // Tutaj możesz reagować na zdarzenia zmiennej rowTapped
                print("Został naciśnięty wiersz z kartą: \(card)")
                self?.coordinator?.pushCardDetailsViewController(card: (card))
            }
            .store(in: &cancellables) // Pamiętaj o utrzymaniu referencji do subskrypcji
    }




//    let swiftUIView = MySwiftUIView()
//    let myUIKitView = _UIHostingView(rootView: swiftUIView)
//    view.addSubview(myUIKitView)


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



