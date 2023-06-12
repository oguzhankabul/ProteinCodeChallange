//
//  UserDetailRoute.swift
//  ProteinCodeChallange
//
//  Created by Oğuzhan Kabul on 13.06.2023.
//

import Foundation

protocol UserDetailRoute {
    
    func pushUserDetail(user: UserObject)
}

extension UserDetailRoute where Self: RouterProtocol {
    
    func pushUserDetail(user: UserObject) {
        let router = UserDetailRouter()
        let viewModel = UserDetailViewModel(router: router, user: user)
        let viewController = UserDetailViewController(viewModel: viewModel)
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        open(viewController, transition: transition)
    }
}
