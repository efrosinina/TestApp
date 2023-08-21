//
//  EpisodesTableViewCell.swift
//  TestApp
//
//  Created by Елизавета Ефросинина on 19/08/2023.
//

import UIKit

class EpisodesTableViewCell: UITableViewCell {
    //MARK: -- GUI Variables
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .left
        label.text = "Planet"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var greenLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.2784, green: 0.7765, blue: 0.0431, alpha: 1.0)
        label.font = .boldSystemFont(ofSize: 15)
        label.text = "Episode: 1, Season: 1"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.5765, green: 0.5961, blue: 0.6118, alpha: 1.0)
        label.font = .boldSystemFont(ofSize: 15)
        label.text = "December 2, 2013"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: -- Life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    //MARK: -- Private Mehtods
    private func setupUI() {
        
        contentView.backgroundColor = UIColor(red: 0.149, green: 0.1647, blue: 0.2196, alpha: 1.0)
        addSubview(titleLabel)
        addSubview(greenLabel)
        addSubview(dateLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            greenLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            greenLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            dateLabel.topAnchor.constraint(equalTo: greenLabel.topAnchor)
        ])
        
    }
}
