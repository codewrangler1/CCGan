//
//  CCGanApp.swift
//  Shared
//
//  Created by Michael McEuin on 1/12/21.
//

import SwiftUI


var gcharacters : NSMutableArray = NSMutableArray()
let imageDict : NSCache = NSCache<AnyObject, AnyObject>()

@main
struct CCGanApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    private func loadJson(fromURLString urlString: String,
                          completion: @escaping (Result<Data, Error>) -> Void) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                }

                if let data = data {
                    completion(.success(data))
                }
            }
            urlSession.resume()
        }
    }

}
