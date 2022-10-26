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
    
    private lazy var detailsVC = generateDetailPage()
    private var presenter: CryptoListPresenterProtocol!
    private var interactor: CryptoListInteractorProtocol!
    private var configurator = CryptoListConfigurator()
    private var spinner: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.configurator.configure(self, self.detailsVC)
        self.interactor.fetchCoinsList()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    required override init(style: UITableView.Style) {
        super.init(style: style)
    }
    
    private func setupView(){
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.spinner = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        self.spinner.style = .medium
        self.tableView.register(UINib(nibName: "CoinTableViewCell", bundle: nil), forCellReuseIdentifier: "CoinTableViewCell")
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

// MARK: - Lazy loading pagination
extension CryptoListTableViewController {
    
    private func generateDetailPage() -> CryptoCoinDetailsViewController? {
        return CryptoCoinDetailsViewController()
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
        guard let vc = self.detailsVC else { return }
        self.presenter.presentCoinDetails(indexPath.row)
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
