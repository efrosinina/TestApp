//
//  CharacterCellViewModel.swift
//  TestApp
//
//  Created by Елизавета Ефросинина on 18/08/2023.
//

import Foundation

class CharacterCellViewModel: Codable {
    //MARK: -- Properties
    let name: String?
    var image: String?
    var status: Status?
    let id: Int?
    let species: Species
    let type: String
    let gender: Gender
    let origin: Origin
    let location: Location
    let episode: [String]?
    let url: String?
    let created: String?
    var rowTitles: [String] = ["Species:", "Type:", "Gender:"]
    
    //MARK: -- Initialization
    init(character: Character) {
        name = character.name ?? ""
        image = character.image ?? ""
        status = character.status
        id = character.id
        species = character.species
        type = character.type
        gender = character.gender
        origin = character.origin
        location = character.location
        episode = character.episode
        url = character.url
        created = character.created
    }
    
    //MARK: -- Methods
    func setTitle(for row: Int) -> String {
        let title = rowTitles[row]
        return title
    }
}
