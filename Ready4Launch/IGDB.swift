//
//  IGDB.swift
//  Ready4Launch
//
//  Created by Brandon Sanchez on 3/28/17.
//  Copyright © 2017 Eric Suarez. All rights reserved.
//

import Foundation
import UIKit

// MARK: - IGDB Networking -> IGDB.Swift

class IGDB {
    
}

// MARK: - Protocol for Trending call
protocol Gettable {
    associatedtype games
    
    func get(completion: @escaping (Result<games>) -> Void)
}

// MARK: - Result enum for error handling in network calls
enum Result<T> {
    case success(T)
    case failure(Error)
}

struct GameService: Gettable {
    
    func get(completion: @escaping (Result<[GameViewModel]>) -> Void) {
        
        // Network Call
        
        let url = URL(string: "https://igdbcom-internet-game-database-v1.p.mashape.com/games/?fields=*&filter[release_dates.platform][eq]=49&filter[aggregated_rating][gte]=90&filter[category][eq]=0")
        let req = NSMutableURLRequest(url: url!)
        req.setValue("eQFAu1b80Wmsh7vUdcXPwp4fd9ihp17b5x1jsnmcWru6Lgp3cY", forHTTPHeaderField: "X-Mashape-Key")
        
        URLSession.shared.dataTask(with: req as URLRequest) { data, response, error in
            
            var games = [GameViewModel]()
            
            guard error == nil else {
                print(error!)
                return
            }
            guard let data = data else {
                print("Data is empty")
                return
            }
            
            let json = try! JSONSerialization.jsonObject(with: data, options: [])
            //print(json)
            let results = json as! [NSDictionary]
            
            for result in results {
                if result["cover"] != nil && result["videos"] != nil && result["screenshots"] != nil && result["release_dates"] != nil && result["genres"] != nil {
                    
                    let game = Game(game: result)
                    games.append(GameViewModel(game: game!))
                    
                }
            }
            
            completion(Result.success(games))
            
        }.resume()
        
    }
    
    
}


// MARK: - Method to make network call in View Controllers, checks for a GameViewModel retun type
extension IGDB {
    
    func getGames<Service: Gettable>(fromService service: Service, completion: @escaping ([GameViewModel]) -> Void) where Service.games == [GameViewModel] {
        
        service.get() { result in
            switch result {
            case .success(let games):
                completion(games)
            case .failure(let error):
                fatalError("error unable to init RepoModel(json:)")
            }
        }
    }
}
