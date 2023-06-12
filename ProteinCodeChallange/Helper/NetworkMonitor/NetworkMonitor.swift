//
//  NetworkMonitor.swift
//  ProteinCodeChallange
//
//  Created by Oğuzhan Kabul on 13.06.2023.
//

import Network

class NetworkMonitor {
    
    static let shared = NetworkMonitor()
    
    var isConnected: Bool {
        return monitor.currentPath.status == .satisfied
    }

    private let monitor = NWPathMonitor()

    private init() {
        monitor.pathUpdateHandler = { _ in }
        monitor.start(queue: DispatchQueue.global())
    }
}
