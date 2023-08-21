//
// MainCollectionViewCell.swift
//  TestApp
//
//  Created by Елизавета Ефросинина on 16/08/2023.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    //MARK: -- GUI Variables
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.contentMode = .scaleToFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 17)
        label.text = "Rick Sanchez"
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: -- Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 10
    }
    
    //MARK: -- Methods
    func setup(character: CharacterCellViewModel) {
        nameLabel.text = character.name
        
        guard let stringImage = character.image else { return }
        imageView.loadImage(stringUrl: stringImage)
    }
    
    //MARK: -- Private Methods
    private func setupUI() {
        contentView.backgroundColor = UIColor(red: 0.149, green: 0.1647, blue: 0.2196, alpha: 1.0)
        addSubview(imageView)
        addSubview(nameLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 178),
            imageView.heightAnchor.constraint(equalToConstant: 178),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
