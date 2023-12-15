//
//  MainListViewModel.swift
//  MTGApp
//
//  Created by Dawid Ogonowski on 04/12/2023.
//

import Foundation
import Combine

enum MainListState {
    case loading
    case loadingSuccess
    case failure
}

class MainListViewModel: ObservableObject {
    @Published var state: MainListState = .loading
    var cards: [Card]?
    let rowTapped = PassthroughSubject<Card, Never>()
    private var cancellables: Set<AnyCancellable> = []

//    let coordinator: MainCoordinator

//    init(coordinator: MainCoordinator) {
//        self.coordinator = coordinator
//    }


    func handleRowTap(_ card: Card) {
        rowTapped.send(card)
    }

    
    func fetchCards() {
        asyncFetchCards()
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    print("Finished")
                    self?.state = .loadingSuccess
                case .failure(let error):
                    print("Error: \(error)")
                    self?.state = .failure
                }
            } receiveValue: { [weak self] cards in
                self?.cards = cards
            }
            .store(in: &cancellables)

    }

    private func asyncFetchCards() -> AnyPublisher<[Card]?, Error> {
        return Future<[Card]?, Error> { promise in
            Task {
                do {
                    let cards: MagicCard = try await APIClient.fetchData(endpoint: .cards)
                    promise(.success(cards.cards))
                } catch {
                    promise(.failure(error))
                }
            }
        }.receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
