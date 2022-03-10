//
//  CountrySearchViewController.swift
//  CountiesApp
//
//  Created by Ihor Malovanyi on 10.03.2022.
//

import UIKit

final class CountrySearchViewController: BaseViewController<CountrySearchProcess> {
    
    struct Constants {
        
        static var title = "Country Search"
        
    }
    
    private var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = Constants.title
        
        setupSearch()
        setupTable()
    }
    
    private func setupSearch() {
        navigationItem.searchController = UISearchController()
        navigationItem.searchController?.searchBar.delegate = self
    }

    private func setupTable() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.keyboardDismissMode = .onDrag
        tableView.register(CountryCell.self, forCellReuseIdentifier: "CountryCell")
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
        
        [NSLayoutConstraint.Attribute.left, .right, .top, .bottom].forEach {
            NSLayoutConstraint(item: tableView, attribute: $0, relatedBy: .equal, toItem: view, attribute: $0, multiplier: 1, constant: 0).isActive = true
        }
    }
    
}

extension CountrySearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        process.searchedCountries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)
        (cell as? CountryCell)?.setup(process.searchedCountries[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        process.selectCountry(at: indexPath.row)
    }
    
}

extension CountrySearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        process.searchCountries(by: searchText) { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
}
