//
//  DetailViewModel.swift
//  MVVM_Demo
//
//  Created by Alican Kurt on 11.01.2022.
//

import Foundation


class DetailViewModel{

    func getCrypto(completion: @escaping (Result<CryptoModel,Error>) -> Void){
        guard let crypto = DownloadCryptoJSON.shared.sharedCrypto else{
            completion(.failure(DetailCryptoError.FailedToGetCryptoInDetailViewModel))
            return
        }
        completion(.success(crypto))
    }

}

enum DetailCryptoError: Error{
    case FailedToGetCryptoInDetailViewModel
}
