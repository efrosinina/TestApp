//
//  InfoDetailsTableViewCell.swift
//  TestApp
//
//  Created by Елизавета Ефросинина on 19/08/2023.
//

import UIKit

class InfoDetailsTableViewCell: UITableViewCell {
    //MARK: -- GUI Variables
    private lazy var infoView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.149, green: 0.1647, blue: 0.2196, alpha: 1.0)
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 16)
        label.text = "Gender"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 17)
        label.text = "Female"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: -- Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -- Private Methods
    private func setupUI() {
        addSubview(infoView)
        infoView.addSubview(infoLabel)
        infoView.addSubview(valueLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            infoView.leadingAnchor.constraint(equalTo: leadingAnchor),
            infoView.topAnchor.constraint(equalTo: topAnchor),
            infoView.trailingAnchor.constraint(equalTo: trailingAnchor),
            infoView.bottomAnchor.constraint(equalTo: bottomAnchor),
            infoLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 5),
            infoLabel.centerYAnchor.constraint(equalTo: infoView.centerYAnchor),
            valueLabel.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -5),
            valueLabel.centerYAnchor.constraint(equalTo: infoView.centerYAnchor)
        ])
    }
}
