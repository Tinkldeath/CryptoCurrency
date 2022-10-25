//
//  CryptoListTableViewController.swift
//  CryptoCurrency
//
//  Created by Dima on 19.10.22.
//

import UIKit

protocol CryptoListView: AnyObject {
    func setPresenter(_ presenter: CryptoListPresenterProtocol)
    func refreshList()
    func displayError(_ error: Error)
    func displayLoad()
    func displayEndLoad()
}

class CryptoListTableViewController: UITableViewController {
    
    private lazy var detailsVC = generateDetailPage()
    private var presenter: CryptoListPresenterProtocol!
    private var configurator = CryptoListConfigurator()
    private var spinner: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        configurator.configure(self)
        presenter.load()
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
    
    @IBAction func refreshClicked(_ sender: UIBarButtonItem) {
        self.presenter.load()
    }
    
}

// MARK: - View configuration methods
extension CryptoListTableViewController: CryptoListView {
    func setPresenter(_ presenter: CryptoListPresenterProtocol) {
        self.presenter = presenter
    }
    
    func refreshList() {
        self.tableView.reloadData()
    }
    
    func displayError(_ error: Error) {
        let ac = UIAlertController(title: "An error occured", message: String(describing: error), preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        print(String(describing: error))
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
    
    private func setupView(){
        self.spinner = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        self.spinner.style = .medium
        self.tableView.register(UINib(nibName: "CoinTableViewCell", bundle: nil), forCellReuseIdentifier: "CoinTableViewCell")
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
