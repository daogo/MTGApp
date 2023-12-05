//
//  DesctopView.swift
//  MTGApp
//
//  Created by Dawid Ogonowski on 01/12/2023.
//

import SwiftUI




struct MainListView: View {
    @State private var searchText = ""
    @State private var items = ["Wynik 1", "Wynik 2", "Wynik 3", "Inny Wynik 4"]

    @StateObject private var viewModel = MainListViewModel()


    var filteredItems: [String] {
        //        if searchText.isEmpty {
        //            return items
        //        } else {
        //            return items.filter { $0.lowercased().contains(searchText.lowercased()) }
        //        }

        return []
    }

    var body: some View {
        NavigationView {
            VStack {
                TextField("Wyszukaj", text: $searchText)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                switch viewModel.state {
                case .loading:
                    Text("Loading...")
                case .loadingSuccess:
                    if let cards = viewModel.cards?.filter({ card in
                        return card.imageUrl != nil
                    }).prefix(300) {
                        List {
                            ForEach(cards, id: \.self) { card in
                                MTGCardRow(card: card)
                            }
                        }
                        .listStyle(InsetListStyle())
                    } else {
                        //                            empty
                    }
                case .failure:
                    Text("Error...")
                }
            }
            .onAppear {
                    viewModel.fetchCards()
            }
            .navigationTitle("Wyszukiwarka")
        }
    }
}


//struct DesctopView_Previews: PreviewProvider {
//    static var previews: some View {
//        DesctopView()
//    }
//}
