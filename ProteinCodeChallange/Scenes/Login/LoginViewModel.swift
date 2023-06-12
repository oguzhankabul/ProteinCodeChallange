//
//  LoginViewModel.swift
//  ProteinCodeChallange
//
//  Created by Oğuzhan Kabul on 12.06.2023.
//

import Foundation

class LoginViewModel: BaseViewModel<LoginRouter> {
    
    let validUsernames = ["9nd54", "v542w", "17pcy0", "gbf48", "zdah4"]
    
    func performLogin(with username: String) -> Bool {
        return validUsernames.contains(username)
    }
    
    func pushDashboard() {
        router.pushDashboard()
    }
}
