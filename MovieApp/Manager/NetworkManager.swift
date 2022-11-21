//
//  NetworkManager.swift
//  MovieApp
//
//  Created by Ahmet Ozkan on 20.11.2022.
//
import Foundation

//import Reachability



import Network

protocol NetworkManagerProtocol: AnyObject{
    func monitorNetworkControll(isStatus: @escaping (Bool) -> ())
}

class NetworkManager: NetworkManagerProtocol{
        
    init(){
        
       
       /* monitor.pathUpdateHandler = { path in
            if path.status == .satisfied{
                print("Network satisfied")
            
                    NotificationCenter.default.post(name: NSNotification.Name("NetworkConnected"), object: nil)
                  
                
                //isStatus(true)
            }else if path.status == .unsatisfied{
                print("Network unsatisfied")
                DispatchQueue.main.async {
                NotificationCenter.default.post(name: NSNotification.Name("NetworkDisconnected"), object: nil)
                }
              
                //isStatus(false)
            }
        }
        let queue = DispatchQueue(label: "Network")
        monitor.start(queue: queue)*/
    }

        
    func monitorNetworkControll(isStatus: @escaping (Bool) -> ()){
      
     
    }
    
}


/*

let mon: NWPathMonitor = NWPathMonitor()
let queue = DispatchQueue(label: "Monitor")
       mon.pathUpdateHandler = {
           p in
           if p.status == .satisfied {
               DispatchQueue.main.async {
                  print("satisfied")
               }
           } else if p.status == .requiresConnection {
               DispatchQueue.main.async {
                   print("requiresConnection")
               }
           } else if p.status == .unsatisfied {
               DispatchQueue.main.async {
                   print("unsatisfied")
               }
           } else {
               DispatchQueue.main.async {
                   print("Unkown")
               }
           }
       }
       mon.start(queue: queue)
*/
