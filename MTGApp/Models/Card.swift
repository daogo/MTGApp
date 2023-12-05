//
//  Card.swift
//  MTGApp
//
//  Created by Dawid Ogonowski on 01/12/2023.
//

import Foundation

struct MagicCard: Codable {
    let cards: [Card]

    enum CodingKeys: String, CodingKey {
        case cards = "cards"
    }
}

struct Card: Codable, Hashable {
    let name: String?
    let names: [String]?
    let manaCost: String?
    let cmc: Int?
    let colors: [String]?
    let colorIdentity: [String]?
    let type: String?
    let supertypes: [String]?
    let types: [String]?
    let subtypes: [String]?
    let rarity: String?
    let set: String?
    let text: String?
    let artist: String?
    let number: String?
    let power: String?
    let toughness: String?
    let layout: String?
    let multiverseid: String?
    let imageUrl: String?
    let rulings: [Ruling]?
    let foreignNames: [ForeignName]?
    let printings: [String]?
    let originalText: String?
    let originalType: String?
    let id: String?

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }

    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.name == rhs.name && lhs.id == rhs.id
    }
}

struct Ruling: Codable {
    let date: String?
    let text: String?
}

struct ForeignName: Codable {
    let name: String?
    let language: String?
    let multiverseid: Int?
}


struct MockCard {
    let card =  Card(name: "Ancestor's Chosen",
                     names: nil,
                     manaCost: "{5}{W}{W}",
                     cmc: 7,
                     colors: ["W"],
                     colorIdentity: nil,
                     type: "Creature",
                     supertypes: nil,
                     types: ["Creature"],
                     subtypes: ["Human", "Cleric"],
                     rarity: "Uncommon",
                     set: "Tenth Edition",
                     text: "First strike (This creature deals combat damage before creatures without first strike.)\nWhen Ancestor's Chosen enters the battlefield, you gain 1 life for each card in your graveyard.",
                     artist: "Pete Venters",
                     number: "1",
                     power: "4",
                     toughness: "4",
                     layout: "normal",
                     multiverseid: "130550",
//                     imageUrl: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=130550&type=card",
                     imageUrl: "https://hws.dev/paul.jpg",
                     rulings: nil,
                     foreignNames: nil,
                     printings: nil,
                     originalText: nil,
                     originalType: nil,
                     id: "12345678")


}
