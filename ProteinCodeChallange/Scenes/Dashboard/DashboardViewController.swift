//
//  DashboardViewController.swift
//  ProteinCodeChallange
//
//  Created by Oğuzhan Kabul on 12.06.2023.
//

import UIKit

class DashboardViewController: BaseViewController<DashboardViewModel> {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupViews() {
        super.setupViews()
        [].forEach({ view.addSubview( $0 )})
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        NSLayoutConstraint.activate([

        ])
    }
}
