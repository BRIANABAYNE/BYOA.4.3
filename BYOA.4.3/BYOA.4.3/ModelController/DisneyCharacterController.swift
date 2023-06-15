//
//  DisneyCharacterController.swift
//  BYOA.4.3
//
//  Created by Briana Bayne on 6/14/23.
//

import Foundation


class DisneyCharacterController {
    
    
    // Will perform a data task that will perform asyn - write a closer to tell us when it's done. / closure will be escaping
    static func fetchCharacter(completion: @escaping ([DisneyCharacter]?) -> Void) {
        
        // Creating the base URL
        guard let baseURL = URL(string: "https://api.disneyapi.dev/character") else { return }
        
        // adding the componets - no componets
        
        // adding quary items
        //let apiQueryItemOne = URLQueryItem(name:"page", value: "2")
        // let apiQueryItemTwo = URLQueryItem(name:"pagesize", value: "50")
        // urlComponents?.queryItems = [apiQueryItemOne,apiQueryItemTwo]
        // guard let finalURL = URLComponents.url else {return}
        let finalURL = baseURL
        print(finalURL)
        // do our data task
        
        URLSession.shared.dataTask(with: finalURL) { data, _, disneyError in
            
            if let disneyError {
                print("Oh no! It printed all Barbies not Disney Characters", disneyError.localizedDescription)
                completion(nil)
            }
            
            guard let disneyData = data else {
                print("There was an error checking for Data")
                completion(nil)
                return
            }
            do {
                guard let topLevelDictonary = try JSONSerialization.jsonObject(with: disneyData) as? [String:Any],
                      let disneyArray = topLevelDictonary["data"] as? [[String:Any]]
                else {completion(nil); return }
                
                var tempArray: [DisneyCharacter] = []
                for disneyDict in disneyArray {
                    guard let character = DisneyCharacter(characterDictionary: disneyDict) else {
                        completion(nil)
                        return
                    }
                        tempArray.append(character)

                }
                completion(tempArray)
            } catch {
                completion(nil); return
            }
            
        }.resume()
        
    }
    
}





