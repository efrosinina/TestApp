//
//  TitleForHeaderInSections.swift
//  TestApp
//
//  Created by Елизавета Ефросинина on 18/08/2023.
//

import UIKit

class TitleForHeaderInSections: UITableViewHeaderFooterView {
    //MARK: -- GUI Variables
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: -- Methods
    func configure(with title: String) {
        label.text = title
        setupUI()
    }
    
    //MARK: -- Private Methods
    private func setupUI() {
        let customView = UIView()
        customView.backgroundColor = UIColor(red: 0.0157, green: 0.0471, blue: 0.1176, alpha: 1.0)
        self.backgroundView = customView
        
        addSubview(label)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 25),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
