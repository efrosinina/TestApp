//
//  DetailsTableViewHeader.swift
//  TestApp
//
//  Created by Елизавета Ефросинина on 18/08/2023.
//

import UIKit

class DetailsTableViewHeader: UIView {
    //MARK: -- GUI Variables
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "rick")
        image.layer.cornerRadius = 16
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.2784, green: 0.7765, blue: 0.0431, alpha: 1.0)
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: -- Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(statusLabel)
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -- Private Methods
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageView.heightAnchor.constraint(equalToConstant: 148),
            imageView.widthAnchor.constraint(equalToConstant: 148),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
            statusLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
