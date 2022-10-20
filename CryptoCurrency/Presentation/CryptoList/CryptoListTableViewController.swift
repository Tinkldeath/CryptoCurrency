//
//  CryptoListTableViewController.swift
//  CryptoCurrency
//
//  Created by Dima on 19.10.22.
//

import UIKit

protocol CryptoListView: AnyObject {
    func refreshList()
}

class CryptoListTableViewController: UITableViewController {
    
    private lazy var detailsVC = generateDetailPage()
    private var presenter: CryptoListPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "CoinTableViewCell", bundle: nil), forCellReuseIdentifier: "CoinTableViewCell")
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    required override init(style: UITableView.Style) {
        super.init(style: style)
        configure()
    }
    
}

// MARK: - View configuration methods
extension CryptoListTableViewController: CryptoListView {
    
    private func configure() {
        self.presenter = CryptoListPresenter()
    }
    
    func refreshList() {
        self.tableView.reloadData()
    }
    
}

// MARK: - Lazy loading pagination
extension CryptoListTableViewController {
    
    private func generateDetailPage() -> UIViewController? {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "CryptoCoinDetailsViewController") as? CryptoCoinDetailsViewController{
            return vc
        }
        return nil
    }
    
}

// MARK: - Table view data source & delegate
extension CryptoListTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.coinsCount()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CoinTableViewCell") as? CoinTableViewCell {
            presenter.configure(cell, indexPath.row)
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = self.detailsVC {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
