//
//  SplashViewModel.swift
//  MovieApp
//
//  Created by Ahmet Ozkan on 20.11.2022.
//


import Foundation

protocol SplashViewModelProtocol: AnyObject{
    func remoteConfigInitialText(_ text: String?)
    func networkManagerIsStatus(_ isStatus: Bool)
}



class SplashViewModel{
    weak var delegate: SplashViewModelProtocol?
    private let networkManagerControll: NetworkManagerProtocol = NetworkManager()
    private let fetchTextRemoteConfig: SplashModelProtocol = SplashModel()
    

    func didViewLoad(){

        fetchRemoteConfigInitText()
    }
    
}

extension SplashViewModel{
    
    func fetchRemoteConfigInitText(){
        self.fetchTextRemoteConfig.fetchRemoteConfigTextData(onSuccess: {[weak self] (value) in
                self?.delegate?.remoteConfigInitialText(value)
        })
    }
   
}

extension SplashViewModel{
  /* func networkController(){
        self.networkManagerControll.monitorNetworkControll(isStatus: {[weak self] (value) in
            self?.delegate?.networkManagerIsStatus(value)
        })
  }*/
}


