//
//  DetailsViewModel.swift
//  TestApp
//
//  Created by Елизавета Ефросинина on 18/08/2023.
//

import Foundation

protocol DetailsViewModelProtocol {
    var sections: [String] { get }
}

final class DetailsViewModel: DetailsViewModelProtocol {
    //MARK: -- Properties
    let sections = ["Info", "Origin", "Episodes"]
    
    //MARK: -- Initialization
    init() {
        loadData()
    }
    
    func loadData() {
        
    }
}

