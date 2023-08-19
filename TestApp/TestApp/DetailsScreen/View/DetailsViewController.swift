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
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.separatorStyle = .none
        tableView.register(InfoDetailsTableViewCell.self, forCellReuseIdentifier: "InfoDetailsTableViewCell")
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
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "InfoDetailsTableViewCell", for: indexPath) as? InfoDetailsTableViewCell else { return UITableViewCell() }
        cell.layer.masksToBounds = true
        return cell
    }
}

extension DetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TitleForHeaderInSections") as? TitleForHeaderInSections else { fatalError("Failed to create header cell") }
        let title = viewModel.sections[section]
        header.configure(with: title)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}
