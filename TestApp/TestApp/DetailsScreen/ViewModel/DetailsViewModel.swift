//
//  DetailsViewModel.swift
//  TestApp
//
//  Created by Елизавета Ефросинина on 18/08/2023.
//

import Foundation

protocol DetailsViewModelProtocol {
    var reloadData: (() -> Void)? { get set }
    var showError: ((String) -> Void)? { get set }
    var reloadCell: ((Int) -> Void)? { get set }
    
    func getInfo(for row: Int) -> DetailsCellViewModel
    var sections: [String] { get }
}

final class DetailsViewModel: DetailsViewModelProtocol {
    //MARK: -- Closures
    var reloadCell: ((Int) -> Void)?
    var showError: ((String) -> Void)?
    var reloadData: (() -> Void)?
    
    //MARK: -- Properties
    var sections: [String] = ["Info", "Origin", "Episodes"]
    
    private var characters: [DetailsCellViewModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.reloadData?()
            }
        }
    }
    
    var numberOfCells: Int {
        return characters.count
    }
    
    //MARK: -- Initialization
    init() {
        loadData()
    }
    
    //MARK: -- Methods
    func getInfo(for row: Int) -> DetailsCellViewModel {
        let character = characters[row]
        return character
    }
    
    //MARK: -- Private Methods
    private func loadData() {
        APIManager.getCharacters() { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let characters):
                self.characters = self.convertToCellViewModel(characters)
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showError?(error.localizedDescription)
                }
            }
        }
    }
    
    private func convertToCellViewModel(_ characters: [Character]) -> [DetailsCellViewModel] {
        return characters.map { DetailsCellViewModel(character: $0) }
    }
}
