//
//  MainCoordinator.swift
//  MTGApp
//
//  Created by Dawid Ogonowski on 05/12/2023.
//

import SwiftUI


protocol MainCoordinatorProtocol: AnyObject {
    func start()
    func pushCardDetailsViewController(card: Card)
}

final class MainCoordinator: MainCoordinatorProtocol {
    var navigationController: UINavigationController?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }


    func start() {
        let mainViewController = MainListHostingViewController(coordinator: self)
        navigationController?.pushViewController(mainViewController, animated: false)
    }

    func pushCardDetailsViewController(card: Card) {
        let nextViewController = CardDetailsViewController(detailsView: CardDetailsView(viewModel: CardDetailsViewModel(card: card)))
//        nextViewController.view.backgroundColor = .red
        navigationController?.pushViewController(nextViewController, animated: true)
    }

}


