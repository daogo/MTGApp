//
//  CardDetailsView.swift
//  MTGApp
//
//  Created by Dawid Ogonowski on 14/12/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct CardDetailsView: View {

    @StateObject var viewModel: CardDetailsViewModel


    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)

        VStack {
            WebImage(url: URL(string: viewModel.card.imageUrl ?? "")) { image in
                image
                    .resizable()
                    .transition(.fade(duration: 0.5))
                    .scaledToFit()
                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
//                    .frame(width: 60, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 3))
                    .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color.clear, lineWidth: 0))
            } placeholder: {
                ZStack {
                    Image("card-back")
                        .resizable()
//                        .frame(width: 60, height: 80)
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 3))
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white)) // Optional: Customize the color
                }
            }
        }
    }
}

//struct CardDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardDetailsView(viewModel: CardDetailsViewModel(card: <#T##Card#>))
//    }
//}
