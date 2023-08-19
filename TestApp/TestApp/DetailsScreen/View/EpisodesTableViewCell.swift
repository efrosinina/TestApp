//
//  EpisodesTableViewCell.swift
//  TestApp
//
//  Created by Елизавета Ефросинина on 19/08/2023.
//

import UIKit

class EpisodesTableViewCell: UITableViewCell {
    //MARK: -- GUI Variables
    private lazy var containerView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    
    
    //MARK: -- Life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
