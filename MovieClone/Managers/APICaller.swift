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

enum APIError: Error {
    case failedToGetData
}

class APIcaller {
    static let shared = APIcaller()
    
    // Trending movies
    func gettrendingMoview(completion: @escaping (Result<[Movie], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else { return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                //                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                //                print(results)
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(results.results))
                //                print(results.results[0].original_title)
            } catch {
                //                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    
    // Trending TVs
//    func getTrendingTVs(completion: @escaping (Result<[String], Error>) -> Void){
//        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else { return}
//
//        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data, _, error in
//
//            guard let data = data, error == nil else {
//                return
//            }
//
//            do {
//
//                let results = try JSONDecoder().decode(TrendingTvResponse.self, from: data)
//                completion(.success(results.results))
//
//            } catch {
//
//                completion(.failure(error))
//            }
//        }
//        task.resume()
//    }
    
    // func upcoming movies
    func getUpcomingMovies(completion: @escaping (Result<[Movie], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)&language=en-US&page=1") else { return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                //                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                //                print(results)
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(results.results))
                //                print(results.results[0].original_title)
            } catch {
                //                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    //func popular movies
    func getPopularMovies(completion: @escaping (Result<[Movie], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)&language=en-US&page=1") else { return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                //                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                //                print(results)
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(results.results))
                //                print(results.results[0].original_title)
            } catch {
                //                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
}
