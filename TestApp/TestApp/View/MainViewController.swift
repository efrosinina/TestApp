//
//  MainViewController.swift
//  TestApp
//
//  Created by Елизавета Ефросинина on 16/08/2023.
//

import UIKit

class MainViewController: UITableViewController {
    //MARK: -- GUI Variables
    
    //MARK: -- Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    //MARK: -- Private Methods
    private func setupUI() {
        view.backgroundColor = UIColor(red: 0.0157, green: 0.0471, blue: 0.1176, alpha: 1.0)
        title = "Characters"
        setupNavigationBar()
        setupConstraints()
    }
    
    private func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        navigationController?.navigationBar.prefersLargeTitles = true
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.standardAppearance = appearance
    }
}

//MARK: -- UITableViewDataSource

//MARK: -- UITableViewDelegate

