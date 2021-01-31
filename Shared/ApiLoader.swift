//
//  ApiLoader.swift
//  CCGan
//
//  Created by Michael McEuin on 1/13/21.
//
import Combine
import Foundation

class ApiLoader: ObservableObject {
    var dataPublisher = PassthroughSubject<[Character], Never>()
    
    @Published  var characters = [Character]() {
        didSet {
            dataPublisher.send(characters)
        }
     }

    init(urlString:String) {

        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data else { return }
        DispatchQueue.main.async {
            // Parse JSON
            self.characters = self.parse(data : data)
            gcharacters.addObjects(from: self.characters)
        }
    }
    task.resume()
  }
    
    func parse(data : Data) -> [Character]
    {
        var characters : [Character] = [Character]()
        
        
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: [])

            
            if let array = jsonResult as? [Any] {

                for object in array  {
                    var character : Character = Character()
                    
                    // access all objects in item
                    let dict : NSDictionary = object as! NSDictionary
                    
                    character.imageName = dict["img"] as! String
                    character.characterName = dict["name"] as! String
                    character.occupation = dict["occupation"] as! [String]
                    character.status = dict["status"] as! String
                    character.nickName = dict["nickname"] as! String
                    
                    characters.append(character)
                }
                
            }
            
        } catch {
            print(error.localizedDescription)
        }
        
        
        return characters
    }
}
