//
//  DetailsViewController.swift
//  TestApp
//
//  Created by Елизавета Ефросинина on 18/08/2023.
//

import UIKit

class DetailsViewController: UIViewController {
    //MARK: -- GUI Variables
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.register(TitleForHeaderInSections.self, forHeaderFooterViewReuseIdentifier: "TitleForHeaderInSections")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor(red: 0.0157, green: 0.0471, blue: 0.1176, alpha: 1.0)
        return tableView
    }()
    
    //MARK: -- Properties
    private var viewModel: DetailsViewModelProtocol
    
    //MARK: -- Initializations
    init(viewModel: DetailsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -- Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    //MARK: -- Private Methods
    private func setupUI() {
        title = ""
        view.addSubview(tableView)
        view.backgroundColor = UIColor(red: 0.0157, green: 0.0471, blue: 0.1176, alpha: 1.0)
        tableView.frame = view.bounds
        navigationController?.setupNavigationController()
        navigationItem.largeTitleDisplayMode = .never
        setupHeader()
    }
    
    private func setupHeader() {
        let header = DetailsTableViewHeader(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 250))
        tableView.tableHeaderView = header
    }
}

extension DetailsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = "Hello world: section: 12345"
        return cell
    }
}

extension DetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 20))
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TitleForHeaderInSections") as? TitleForHeaderInSections else { fatalError("Failed to create header cell") }
        let title = viewModel.sections[section]
        header.configure(with: title)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}
