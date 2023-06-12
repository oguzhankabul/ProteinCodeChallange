//
//  DashboardRoute.swift
//  ProteinCodeChallange
//
//  Created by Oğuzhan Kabul on 12.06.2023.
//

import Foundation

protocol DashboardRoute {
    
    func pushDashboard()
}

extension DashboardRoute where Self: RouterProtocol {
    
    func pushDashboard() {
        let router = DashboardRouter()
        let viewModel = DashboardViewModel(router: router)
        let viewController = DashboardViewController(viewModel: viewModel)
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        open(viewController, transition: transition)
    }
}
