//
//  ViewController.swift
//  CryptoCurrency
//
//  Created by Dima on 14.10.22.
//

import UIKit

class ViewController: UIViewController, CryptoViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func displayCrypto() {
        
    }
    
    func displayDetails(for crypto: CryptoCoinProtocol) {
        
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell"){
            return cell
        }
        return UITableViewCell(style: .default, reuseIdentifier: "Cell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
