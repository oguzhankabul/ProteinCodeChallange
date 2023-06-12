//
//  UserManager.swift
//  ProteinCodeChallange
//
//  Created by Oğuzhan Kabul on 12.06.2023.
//

import Foundation
import RealmSwift

class UserManager {
    
    func fetchUsers(completion: @escaping (Error?) -> Void) {
        let urlString = Constants.baseUserUrl
        let url = URL(string: urlString)!
        
        let isConnected = NetworkMonitor.shared.isConnected
        
        if isConnected {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let response = try decoder.decode(UserAPIResponse.self, from: data)
                        
                        // Convert the User models to UserObject models
                        let usersToSave = response.results.map { $0.toRealmObject() }
                        
                        DispatchQueue.main.async {
                            // Create a new Realm instance
                            let realm = try! Realm()
                            
                            // Clear old users before saving new users
                            try! realm.write {
                                let oldUsers = realm.objects(UserObject.self)
                                realm.delete(oldUsers)
        
                                // Save the new UserObject models to the Realm database
                                realm.add(usersToSave, update: .modified)
                            }
                            
                            completion(nil)
                        }
                    } catch let error {
                        completion(error)
                    }
                } else if let error = error {
                    completion(error)
                }
            }.resume()
        } else {
            DispatchQueue.main.async {
                // Create a new Realm instance
                let realm = try! Realm()
                
                // No internet connection and check if there is data in the cache
                let users = realm.objects(UserObject.self)
                
                if users.isEmpty {
                    completion(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No internet connection and no cached data"]))
                } else {
                    // There is cached data, so no need to do anything.
                    completion(nil)
                }
            }
        }
    }
}
