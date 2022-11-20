//
//  SplashModel.swift
//  MovieApp
//
//  Created by Ahmet Ozkan on 20.11.2022.
//

import Foundation
import FirebaseRemoteConfig


// MARK: SplashModelProtocol
protocol SplashModelProtocol: AnyObject{
    func fetchRemoteConfigTextData(onSuccess: @escaping (String?) -> ())
}
// MARK: SplashModel
class SplashModel: SplashModelProtocol{
    private let remoteConfig = RemoteConfig.remoteConfig()

    func fetchRemoteConfigTextData(onSuccess: @escaping (String?) -> ()) {
        let defaults: [String: NSObject] = [
            "splashText": "default value" as NSObject
        ]
        remoteConfig.setDefaults(defaults)
        
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        
        //withExpirationDuration cache time end remove
        self.remoteConfig.fetch(withExpirationDuration: 0) { status, error in
            if status == .success, error == nil{
                
                self.remoteConfig.activate(completion: { status,error  in
                    guard error == nil else{ return }
                    
                    let value = self.remoteConfig.configValue(forKey: "splashText").stringValue
                    print("Fetched : \(String(describing: value))")
                    onSuccess(value)
                })
            }else{
                print("RemoteConfig fetchValues Error")
            }
        }
    }
    func fetchValues(){
        
        
    }
}
