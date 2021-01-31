//
//  Character.swift
//  CCGan
//
//  Created by Michael McEuin on 1/12/21.
//

import Foundation

struct Character : Identifiable {
    
    var id = UUID()
    var characterName : String = ""
    var imageName : String = ""
    var occupation : [String] = [String]()
    var status : String = ""
    var nickName : String = ""
    var seasonAppearance : [Int] = [Int]()
 
    
}

// Used for testing Initial UI
var sampleData = [
    Character(characterName: "Dude", imageName: "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg", occupation: ["High School    Collector"], status: "presumed dead", nickName: "Heisenberg", seasonAppearance: [1,2, 3, 4,6]),
    Character(characterName: "Dude 2", imageName: "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg", occupation: ["High School Teacher", "Meth King Pin"], status: "presumed dead", nickName: "Heisenberg", seasonAppearance: [1,2, 3, 4,5]),
    Character(characterName: "Dude 3", imageName: "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg", occupation: ["High School Teacher", "Meth King Pin"], status: "presumed dead", nickName: "Heisenberg", seasonAppearance: [1,2, 3, 4,5])
]
