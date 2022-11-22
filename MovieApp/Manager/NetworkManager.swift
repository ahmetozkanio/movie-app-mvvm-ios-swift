//
//  NetworkManager.swift
//  MovieApp
//
//  Created by Ahmet Ozkan on 20.11.2022.
//

import Foundation
import Reachability

// MARK: - Network Manager Protocol
protocol NetworkManagerProtocol: AnyObject{
    func monitorNetworkControll(isStatus: @escaping (Bool) -> ())
}
// MARK: - Network Manager
final class NetworkManager: NetworkManagerProtocol{
    
    private let reactibility =  try! Reachability()
    // MARK: - Network Manager Reachability
    func monitorNetworkControll(isStatus: @escaping (Bool) -> ()){
            reactibility.whenReachable = { reactibility in
                isStatus(true)
                print("Network Connected")
            }
            reactibility.whenUnreachable = { _ in
                isStatus(false)
                print("Network Disconnected")
            }
            do{
                try? reactibility.startNotifier()
            }
    }
    
}


