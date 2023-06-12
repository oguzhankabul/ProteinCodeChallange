//
//  DashboardViewModel.swift
//  ProteinCodeChallange
//
//  Created by Oğuzhan Kabul on 12.06.2023.
//

import Foundation
import RealmSwift

class DashboardViewModel: BaseViewModel<DashboardRouter> {
    
    private let userManager = UserManager()
    private var users: Results<UserObject>?
    
    // Callbacks
    var dataUpdated: (() -> Void)?
    var onError: ((Error) -> Void)?
    
    var numberOfRows: Int {
        return users?.count ?? 0
    }

    func fetchUsers() {
        userManager.fetchUsers { [weak self] error in
            if let error = error {
                self?.onError?(error)
            } else {
                DispatchQueue.main.async {
                    // Fetch from realm again after new users have been saved
                    self?.users = try? Realm().objects(UserObject.self)
                    self?.dataUpdated?()
                }
            }
        }
    }

    func user(for index: Int) -> UserObject? {
        guard let users = users, users.indices.contains(index) else { return nil }
        return users[index]
    }
}
