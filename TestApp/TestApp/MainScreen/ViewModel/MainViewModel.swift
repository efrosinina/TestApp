//
//  .swift
//  TestApp
//
//  Created by Елизавета Ефросинина on 17/08/2023.
//

import Foundation

protocol MainViewModelProtocol {
    var reloadData: (() -> Void)? { get set }
    var numberOfCells: Int { get }
    var showError: ((String) -> Void)? { get set }
    var reloadCell: ((Int) -> Void)? { get set }
    
    func getCharacter(for row: Int) -> CharacterCellViewModel
}

final class MainViewModel: MainViewModelProtocol {
    //MARK: -- Closures
    var reloadCell: ((Int) -> Void)?
    var showError: ((String) -> Void)?
    var reloadData: (() -> Void)?
    
    //MARK: -- Properties
    private var characters: [CharacterCellViewModel] = [] {
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
    func getCharacter(for row: Int) -> CharacterCellViewModel {
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
    
    private func convertToCellViewModel(_ characters: [Character]) -> [CharacterCellViewModel] {
        return characters.map { CharacterCellViewModel(character: $0) }
    }
}
