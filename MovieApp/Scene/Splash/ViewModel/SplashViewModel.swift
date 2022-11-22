//
//  SplashViewModel.swift
//  MovieApp
//
//  Created by Ahmet Ozkan on 20.11.2022.
//


import Foundation

// MARK: - SplashViewModelProtocol

protocol SplashViewModelProtocol: AnyObject{
    func remoteConfigInitialText(_ text: String?)
    func networkManagerIsStatus(_ isStatus: Bool)
}


// MARK: - SplashViewModel

class SplashViewModel{
    
    weak var delegate: SplashViewModelProtocol?
    private let networkManagerControll: NetworkManagerProtocol = NetworkManager()
    private let fetchTextRemoteConfig: SplashModelProtocol = SplashModel()
    
    func didViewLoad(){
        networkController()
        fetchRemoteConfigInitText()
    }
    
}

// MARK: - SplashViewModel Remote Config

extension SplashViewModel{
    
    func fetchRemoteConfigInitText(){
        self.fetchTextRemoteConfig.fetchRemoteConfigTextData(onSuccess: {[weak self] (value) in
            self?.delegate?.remoteConfigInitialText(value)
        })
    }
    
}

// MARK: - SplashViewModel Network Controller

extension SplashViewModel{
    func networkController(){
        self.networkManagerControll.monitorNetworkControll(isStatus: {[weak self] (value) in
            self?.delegate?.networkManagerIsStatus(value)
        })
    }
}


