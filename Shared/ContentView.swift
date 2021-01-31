//
//  ContentView.swift
//  Shared
//
//  Created by Michael McEuin on 1/12/21.
//

import SwiftUI

struct ContentView: View {

    // Set URL for characters API
    @ObservedObject var apiLoader : ApiLoader = ApiLoader(urlString: "https://breakingbadapi.com/api/characters")
  

    var body: some View {
        NavigationView {
            List (gcharacters as! [Character]) { lcharacter in
                
                let llcharacter = lcharacter as Character

                NavigationLink(destination : CharacterDetail(character: lcharacter)){
                    HStack {
                        ImageView(withURL: llcharacter.imageName)
                        Text(llcharacter.characterName)
                    }
                }.navigationTitle("Characters")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}

