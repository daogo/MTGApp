//
//  MTGCardRow.swift
//  MTGApp
//
//  Created by Dawid Ogonowski on 01/12/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct MTGCardRow: View {
    var card: Card

    var body: some View {
        HStack {
            WebImage(url: URL(string: card.imageUrl!)) { image in
                image
                    .resizable()
                    .transition(.fade(duration: 0.5))
                    .scaledToFill()
                    .frame(width: 60, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 3))
                    .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.gray, lineWidth: 1))
            } placeholder: {
                ZStack {
                        Image("card-back")
                            .resizable()
                            .frame(width: 60, height: 80)
                            .scaledToFill()
                            .clipShape(RoundedRectangle(cornerRadius: 3))
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white)) // Optional: Customize the color
                    }
            }



//            WebImage(url: URL(string: card.imageUrl!))
//                .resizable()
//                .indicator(.activity) // Możesz użyć różnych stylów wskaźnika ładowania
//                .transition(.fade(duration: 0.5)) // Efekt przejścia przy ładowaniu
//                .scaledToFill()
//                .frame(width: 60, height: 80)
//                .clipShape(RoundedRectangle(cornerRadius: 3))
//                .overlay(
//                    RoundedRectangle(cornerRadius: 3).stroke(Color.gray, lineWidth: 1)
//                )
            

            Text(card.name ?? "")
                .padding(.leading, 4)
        }
    }
}

//struct MTGCardRow: View {
//    var card: Card
//
//    var body: some View {
//        HStack {
//            AsyncImage(url: URL(string: card.imageUrl!)) { image in
//                image.resizable().frame(width: 60, height: 80).aspectRatio(contentMode: .fill)
//            } placeholder: {
////                ProgressView().progressViewStyle(.circular)
//                Image("card-back").resizable().frame(width: 60, height: 80).aspectRatio(contentMode: .fill)
//            }
//            Text(card.name ?? "")
//            Spacer()
//        }
//    }
//}

//struct MTGCardRow_Previews: PreviewProvider {
//    static var card = MockCard().card
//
//    static var previews: some View {
//        Group {
//            MTGCardRow(card: card)
//        }
//        .previewLayout(.fixed(width: 300, height: 70))
//    }
//}
