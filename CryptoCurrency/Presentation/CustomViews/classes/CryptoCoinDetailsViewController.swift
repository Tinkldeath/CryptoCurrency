//
//  CoinDetailsViewController.swift
//  CryptoCurrency
//
//  Created by Dima on 26.10.22.
//

import UIKit

protocol CryptoCoinDetailsViewProtocol: AnyObject {
    func displayCoin()
}

class CryptoCoinDetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension CryptoCoinDetailsViewController: CryptoCoinDetailsViewProtocol {
    
    func displayCoin() {
        
    }
    
}
