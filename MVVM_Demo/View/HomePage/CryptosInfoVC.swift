//
//  ViewController.swift
//  MVVM_Demo
//
//  Created by Alican Kurt on 11.01.2022.
//

import UIKit

class CryptosInfoVC: UIViewController {
    
    private var cryptoInfoViewModel = CryptosInfoViewModel()
    @IBOutlet weak var cryptoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cryptoTableView.delegate = self
        cryptoTableView.dataSource = self
        
        getCryptosInfo()
    }
    
    private func getCryptosInfo(){
        cryptoInfoViewModel.getCryptos {[weak self] success in
            if success{
                DispatchQueue.main.async {
                    self?.cryptoTableView.reloadData()
                }
            }
        }
    }
}

extension CryptosInfoVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoInfoViewModel.cryptoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cryptoCell", for: indexPath)
        let crpyto = cryptoInfoViewModel.cryptoArray[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = crpyto.currency
        content.secondaryText = crpyto.price        
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cryptoInfoViewModel.segueToDetailVC(crypto: cryptoInfoViewModel.cryptoArray[indexPath.row], VC: self)
    }
    
}

