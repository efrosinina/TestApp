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
        tableView.register(InfoTableViewCell.self, forCellReuseIdentifier: "InfoTableViewCell")
        tableView.register(OriginTableViewCell.self, forCellReuseIdentifier: "OriginTableViewCell")
        tableView.register(EpisodesTableViewCell.self, forCellReuseIdentifier: "EpisodesTableViewCell")
        tableView.register(TitleForHeaderInSections.self, forHeaderFooterViewReuseIdentifier: "TitleForHeaderInSections")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = defaultColor
        return tableView
    }()
    
    //MARK: -- Properties
    private var viewModel: DetailsViewModelProtocol
    private var character: Character?
    private let defaultColor: UIColor = UIColor(red: 0.0157, green: 0.0471, blue: 0.1176, alpha: 1.0)
    private var header: DetailsTableViewHeader?
    
    //MARK: -- Initializations
    init(viewModel: DetailsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.setupViewModel()
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
        view.backgroundColor = defaultColor
        tableView.frame = view.bounds
        navigationController?.setupNavigationController()
        navigationItem.largeTitleDisplayMode = .never
        setupHeader()
    }
    
    private func setupHeader() {
        header = DetailsTableViewHeader(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 250))
        tableView.tableHeaderView = header
    }
    
    private func setupViewModel() {
        viewModel.reloadData = { [weak self] in
            self?.tableView.reloadData()
        }
        
        viewModel.reloadCell = { [weak self] row in
            self?.tableView.reloadRows(at: [IndexPath(row: row,
                                                      section: 0)], with: .automatic)
        }
        
        viewModel.showError = { error in
            print(error)
        }
    }
}

extension DetailsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 1
        case 2:
            return 5
        default:
            break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath) as? InfoTableViewCell else { return UITableViewCell() }
            let character = viewModel.getInfo(for: indexPath.row)
            cell.layer.masksToBounds = true
            cell.set(character: character, for: indexPath.row)
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "OriginTableViewCell", for: indexPath) as? OriginTableViewCell else { return UITableViewCell() }
            cell.layer.masksToBounds = true
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodesTableViewCell", for: indexPath) as? EpisodesTableViewCell else { return UITableViewCell() }
            cell.layer.masksToBounds = true
            return cell
        default:
            break
        }
        return UITableViewCell()
    }
}

extension DetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 70
        case 1:
            return 100
        case 2:
            return 106
        default:
            break
        }
        return CGFloat()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let smallHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TitleForHeaderInSections") as? TitleForHeaderInSections else { fatalError("Failed to create header cell") }
        let title = viewModel.sections[section]
        smallHeader.configure(with: title)
        return smallHeader
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}
