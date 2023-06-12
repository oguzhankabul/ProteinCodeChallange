//
//  AppRouter.swift
//  ProteinCodeChallange
//
//  Created by Oğuzhan Kabul on 12.06.2023.
//

import UIKit

final class AppRouter {
    
    let window: UIWindow
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start() {
        let router = LoginRouter()
        let vm = LoginViewModel(router: router)
        let vc = LoginViewController(viewModel: vm)
        router.viewController = vc
        let navigationController = UINavigationController(rootViewController: vc)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

let app = AppContainer()

final class AppContainer {
    let router = AppRouter()
}
