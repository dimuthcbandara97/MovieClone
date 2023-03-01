//
//  APICaller.swift
//  MovieClone
//
//  Created by Dimuth Bandara on 2023-03-01.
//

import Foundation

struct Constants {
    
//    static let ALL_API_URL = "https://api.themoviedb.org/3/trending/all/day?api_key=faa8695dc581ea2088374b01596042e2"
    
    static let API_KEY = "faa8695dc581ea2088374b01596042e2"
    static let baseURL = "https://api.themoviedb.org"
}

class APIcaller {
    static let shared = APIcaller()
    
    func gettrendingMoview(completion: @escaping (String) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.API_KEY)") else { return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                print(results)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
