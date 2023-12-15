//
//  CardDetailsViewModel.swift
//  MTGApp
//
//  Created by Dawid Ogonowski on 14/12/2023.
//

import Foundation
import Combine

class CardDetailsViewModel: ObservableObject {


    let card: Card
//    let rowTapped = PassthroughSubject<Card, Never>()
    private var cancellables: Set<AnyCancellable> = []

    init(card: Card) {
        self.card = card
    }

}
