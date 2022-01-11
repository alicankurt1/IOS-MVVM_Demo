//
//  DetailVC.swift
//  MVVM_Demo
//
//  Created by Alican Kurt on 11.01.2022.
//

import UIKit

class DetailVC: UIViewController {
    
    private var detailViewModel = DetailViewModel()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        assignLabels()
    }
    
    private func assignLabels(){
        detailViewModel.getCrypto {[weak self] result  in
            switch result{
            case .success(let crypto):
                self?.nameLabel.text = crypto.currency
                self?.priceLabel.text = crypto.price
            case .failure(let error):
                print(error)
            }
        }
    }
    



}
