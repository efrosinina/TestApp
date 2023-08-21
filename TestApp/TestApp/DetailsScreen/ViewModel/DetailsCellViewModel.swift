//
//  DetailsCellViewModel.swift
//  TestApp
//
//  Created by Елизавета Ефросинина on 19/08/2023.
//

import Foundation

class DetailsCellViewModel {
    //MARK: -- Properties
    let id: Int?
    let name: String?
    let status: Status?
    let species: Species
    let type: String
    let gender: Gender
    let origin: Origin
    let location: Location
    var image: String?
    let episode: [String]?
    let url: String?
    let created: String?
    let rowTitles: [String] = ["Species:", "Type:", "Gender:"]
    
    //MARK: -- Initialization
    init(character: Character) {
        id = character.id ?? 0
        name = character.name ?? ""
        status = character.status
        species = character.species
        type = character.type 
        gender = character.gender
        origin = character.origin
        location = character.location
        image = character.image ?? ""
        episode = character.episode
        url = character.url ?? ""
        created = character.created ?? ""
    }
    
    //MARK: -- Methods
    func setTitle(for row: Int) -> String {
        let title = rowTitles[row]
        return title
    }
}
