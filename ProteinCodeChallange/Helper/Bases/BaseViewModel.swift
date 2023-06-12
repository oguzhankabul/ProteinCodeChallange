//
//  BaseViewModel.swift
//  ProteinCodeChallange
//
//  Created by Oğuzhan Kabul on 12.06.2023.
//

import UIKit

protocol BaseViewModelProtocol {
    
    func viewDidLoad()
}

class BaseViewModel<R: Router>: BaseViewModelProtocol {
    
    let router: R
    
    init(router: R) {
        self.router = router
    }
    
    func viewDidLoad() {}

    deinit {
        debugPrint("deinit \(self)")
    }
}
