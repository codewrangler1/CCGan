//
//  CharacterDetail.swift
//  CCGan
//
//  Created by Michael McEuin on 1/12/21.
//

import SwiftUI


struct CharacterDetail: View {
    var character : Character
    
    
    var body: some View {

      
        
        VStack(alignment: .leading, spacing : 5) {
            ImageView(withURL: character.imageName)

            HStack {
                Text("Character Name: ")
                    .bold()
                Text(character.characterName)
            }
            Text("Occupation: ")
                .bold()
        
            ForEach(0 ..< character.occupation.count) { value in
                Text(character.occupation[value] )
            }
            
            HStack {
                Text("Status: ")
                    .bold()
                Text(character.status)
            }
            HStack {
                Text("Nickname: ")
                    .bold()
                Text(character.nickName)
            }
            Text("Season Appearance: ")
                .bold()
            ForEach(0 ..< character.seasonAppearance.count) { value in
                Text(String(character.seasonAppearance[value]))
            }
            Spacer()
        }
        
    }
    
}

struct CharacterDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // Use sample data for Preview
            CharacterDetail(character: sampleData[0])
        }
    }
}
