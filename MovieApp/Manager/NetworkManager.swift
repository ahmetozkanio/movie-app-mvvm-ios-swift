//
//  NetworkManager.swift
//  MovieApp
//
//  Created by Ahmet Ozkan on 20.11.2022.
//
import Foundation
import Network

protocol NetworkManagerProtocol: AnyObject{
    func monitorNetworkControll(isStatus: @escaping (Bool) -> ())
}

class NetworkManager: NetworkManagerProtocol{
    

    func monitorNetworkControll(isStatus: @escaping (Bool) -> ()){
        let monitor = NWPathMonitor()
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied{
                print("Network Connected")
                isStatus(true)
            }else{
                print("Network Disconnected")
                isStatus(false)
            }
        }
        let queue = DispatchQueue(label: "Network")
        monitor.start(queue: queue)
    }
    
}

