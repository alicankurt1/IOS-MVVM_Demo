//
//  CryptosInfoViewModel.swift
//  MVVM_Demo
//
//  Created by Alican Kurt on 11.01.2022.
//

import Foundation
import UIKit


class CryptosInfoViewModel{
    
    private var downloadJsonService = DownloadCryptoJSON()
    var cryptoArray: [CryptoModel] = []
    
    
    func getCryptos(completion: @escaping (Bool) -> Void){
        guard let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/IA32-CryptoComposeData/main/cryptolist.json") else{
            completion(false)
            return
        }
        downloadJsonService.downloadCryptoJsonFile(with: url) { [weak self] result  in
            switch result{
            case .success(let cryptoArr):
                self?.cryptoArray = cryptoArr
                completion(true)
            case .failure(let error):
                print("Error: \(error)")
                completion(false)
            }
        }
    }
    
    func segueToDetailVC(crypto: CryptoModel, VC: CryptosInfoVC){
        DownloadCryptoJSON.shared.sharedCrypto = crypto
        VC.performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
    
    
}
