//
//  ImageLoader.swift
//  CCGan
//
//  Created by Michael McEuin on 1/13/21.
//

import Combine
import Foundation

class ImageLoader: ObservableObject {
    var dataPublisher = PassthroughSubject<Data, Never>()
    var data = Data() {
        didSet {
            dataPublisher.send(data)
        }
     }

    init(urlString:String) {

        // Is it cached?
        let cachedData = imageDict.object(forKey: urlString as AnyObject)
        
        // If cached, just grab it
        if cachedData != nil {
            DispatchQueue.main.async {
               self.data = cachedData as! Data
                }
        }
        else {  // Else go grab it from URL
            guard let url = URL(string: urlString) else { return }
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                // Save to cache
                imageDict.setObject(data as AnyObject, forKey: urlString as AnyObject)
                // Set Object
                self.data = data
                }            
            }
            task.resume()
        }
  }
}
