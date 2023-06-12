//
//  DashboardViewController.swift
//  ProteinCodeChallange
//
//  Created by Oğuzhan Kabul on 12.06.2023.
//

import UIKit

class DashboardViewController: BaseViewController<DashboardViewModel> {
    
    private let userTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UserCell.self, forCellReuseIdentifier: "UserCell")
        tableView.isHidden = true
        return tableView
    }()

    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        activityIndicator.startAnimating()
        bindViewModel()
        viewModel.fetchUsers()
    }
    
    override func setupViews() {
        super.setupViews()
        [userTableView,
         activityIndicator].forEach({ view.addSubview( $0 )})
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        NSLayoutConstraint.activate([
            userTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            userTableView.topAnchor.constraint(equalTo: view.topAnchor),
            userTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func bindViewModel() {
        viewModel.dataUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.activityIndicator.stopAnimating()
                self?.userTableView.isHidden = false
                self?.userTableView.reloadData()
            }
        }

        viewModel.onError = { [weak self] error in
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self?.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func setupTableView() {
        userTableView.delegate = self
        userTableView.dataSource = self
        userTableView.isHidden = true
    }
}

extension DashboardViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.pushUserDetail(indexPath: indexPath)
    }
}

extension DashboardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        if let user = viewModel.user(for: indexPath.row) {
            cell.configure(with: user)
        }
        return cell
    }
    
    
}
