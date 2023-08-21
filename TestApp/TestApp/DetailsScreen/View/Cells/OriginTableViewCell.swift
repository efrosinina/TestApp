//
//  OriginTableViewCell.swift
//  TestApp
//
//  Created by Елизавета Ефросинина on 19/08/2023.
//

import UIKit

class OriginTableViewCell: UITableViewCell {
    //MARK: -- GUI Variables
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.149, green: 0.1647, blue: 0.2196, alpha: 1.0)
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imageContent: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Planet")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .left
        label.text = "Earth"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var greenLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.2784, green: 0.7765, blue: 0.0431, alpha: 1.0)
        label.font = .boldSystemFont(ofSize: 15)
        label.text = "Planet"
        label.textAlignment = .left
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
    
    //MARK: -- Private Methods
    private func setupUI() {
        
        contentView.backgroundColor = UIColor(red: 0.149, green: 0.1647, blue: 0.2196, alpha: 1.0)
        addSubview(containerView)
        containerView.addSubview(imageContent)
        containerView.addSubview(titleLabel)
        containerView.addSubview(greenLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageContent.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 3),
            imageContent.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 3),
            imageContent.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 3),
            imageContent.widthAnchor.constraint(equalToConstant: 64),
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: imageContent.trailingAnchor, constant: 30),
            greenLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            greenLabel.leadingAnchor.constraint(equalTo: imageContent.trailingAnchor, constant: 30)
        ])
    }
}
