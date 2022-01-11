//
//  DownloadCryptoJSON.swift
//  MVVM_Demo
//
//  Created by Alican Kurt on 11.01.2022.
//

import Foundation

// Singleton Class
class DownloadCryptoJSON{
    static let shared = DownloadCryptoJSON()
    
    var sharedCrypto: CryptoModel?
    
    public func downloadCryptoJsonFile(with url: URL, completion: @escaping (Result<[CryptoModel], Error>) -> Void){
        
        let cryptoDownloadTask = URLSession.shared.dataTask(with: url) { data , response , error  in
            guard error == nil, let data = data else{
                completion(.failure(CryptoErrors.FailedToGetData))
                return
            }
            
            do{
                let cryptoArray = try JSONDecoder().decode([CryptoModel].self, from: data)
                completion(.success(cryptoArray))
            }catch{
                completion(.failure(CryptoErrors.FailedToParseData))
            }
        }
        cryptoDownloadTask.resume()
        
    }
}


enum CryptoErrors: Error{
    case FailedToGetData
    case FailedToParseData
}
