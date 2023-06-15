//
//  DisneyCharacter.swift
//  BYOA.4.3
//
//  Created by Briana Bayne on 6/14/23.
//

import Foundation

class DisneyCharacter {

    let name: String
    let imageURL: String
    

    init(name: String, imageURL: String) {
        self.name = name
        self.imageURL = imageURL
    }


//    let count: Int
//    let totalPages: Int
//    let previousPage: String?
//    let nextPage: String?
//
//
//    init(count: Int, totalPages: Int, previousPage: String?, nextPage: String?) {
//        self.count = count
//        self.totalPages = totalPages
//        self.previousPage = previousPage
//        self.nextPage = nextPage
//    }
    
} // end of class

extension DisneyCharacter {
    
    
    convenience init?(characterDictionary: [String:Any]) {
        guard let name = characterDictionary["name"] as? String,
              let imageURL = characterDictionary["imageURL"] as? String
        else { return nil }
        self.init(name: name, imageURL: imageURL)
    }
//    convenience init?(topLevelDictonary: [String: Any]) {
//
//        guard let count = topLevelDictonary["count"] as? Int,
//              let totalPages = topLevelDictonary["totalPages"] as? Int,
//              let previousPage = topLevelDictonary["previousPage"] as? String,
//              let nextPage = topLevelDictonary["nextPage"] as? String else { return nil}
//
//        self.init(count: count, totalPages: totalPages, previousPage: previousPage, nextPage: nextPage)
//
//    }
    
    
}


