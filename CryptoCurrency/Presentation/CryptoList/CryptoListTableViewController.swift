//
//  CryptoListTableViewController.swift
//  CryptoCurrency
//
//  Created by Dima on 19.10.22.
//

import UIKit

protocol CryptoListViewProtocol: AnyObject {
    func setListInteractor(_ interactor: CryptoListInteractorProtocol)
    func setPresenter(_ presenter: CryptoListPresenterProtocol)
    func refreshList()
    func displayError(_ error: Error)
    func displayLoad()
    func displayEndLoad()
}

class CryptoListTableViewController: UITableViewController {
    
    private var presenter: CryptoListPresenterProtocol!
    private var interactor: CryptoListInteractorProtocol!
    private var configurator = CryptoListConfigurator()
    private var spinner: UIActivityIndicatorView!
    private lazy var detailsVC = generateDetailPage()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.configurator.configure(self, self.detailsVC)
        self.interactor.fetchCoinsList()
    }
        
    private func setupView(){
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.spinner = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        self.spinner.style = .medium
        self.tableView.register(UINib(nibName: "CoinTableViewCell", bundle: nil), forCellReuseIdentifier: "CoinTableViewCell")
    }
    
    @IBAction func sortPriceClicked(_ sender: UIBarButtonItem) {
        let ac = UIAlertController(title: "Select sort option", message: nil, preferredStyle: .actionSheet)
        for option in self.presenter.sortingOptions() {
            ac.addAction(self.generateSortingAction(option))
        }
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }
    
}

// MARK: - Lazy loading pagination
extension CryptoListTableViewController {
    
    private func generateDetailPage() -> CryptoCoinDetailsViewController {
        let vc = CryptoCoinDetailsViewController()
        return vc
    }
    
}

// MARK: - View protocol implementation
extension CryptoListTableViewController: CryptoListViewProtocol {
    
    func setPresenter(_ presenter: CryptoListPresenterProtocol) {
        self.presenter = presenter
    }
    
    func setListInteractor(_ interactor: CryptoListInteractorProtocol) {
        self.interactor = interactor
    }
    
    func refreshList() {
        self.tableView.reloadData()
    }
    
    func displayError(_ error: Error) {
        let ac = UIAlertController(title: "An error occured", message: String(describing: error), preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    func displayLoad() {
        self.spinner.center = CGPoint(x: self.view.center.x, y: self.view.center.y-50)
        self.view.addSubview(self.spinner)
        self.spinner.startAnimating()
    }
    
    func displayEndLoad() {
        self.spinner.removeFromSuperview()
    }
    
}

// MARK: - Table view data source & delegate implementation
extension CryptoListTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.coinsCount()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CoinTableViewCell") as? CoinTableViewCell else { return UITableViewCell() }
        self.presenter.configure(cell, indexPath.row)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.presentCoinDetails(indexPath.row)
        self.navigationController?.pushViewController(self.detailsVC, animated: true)
    }
    
}

//MARK: - Sorting options actions generator
extension CryptoListTableViewController {
    
    func generateSortingAction(_ option: String) -> UIAlertAction {
        let action = UIAlertAction(title: option, style: .default){ _ in
            self.sortBy(option)
        }
        return action
    }
    
    private func sortBy(_ action: String) {
        self.presenter.presentSortedBy(action)
    }
    
}
