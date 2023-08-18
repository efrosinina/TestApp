//
//  ResultsResponseObject.swift
//  TestApp
//
//  Created by Елизавета Ефросинина on 17/08/2023.
//

import Foundation

struct ResultsResponseObject: Codable {
    //  let info: Info?
    let results: [Character]
}

// MARK: - Info
//struct Info: Codable {
//    let count, pages: Int?
//   let next: String?
//  let prev: NSNull?
//}
