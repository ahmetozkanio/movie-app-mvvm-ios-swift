//
//  SplashViewModel.swift
//  MovieApp
//
//  Created by Ahmet Ozkan on 20.11.2022.
//

import FirebaseRemoteConfig

protocol SplashViewModelProtocol: AnyObject{
    func remoteConfigInitialText(_ text: String?)
}

class SplashViewModel{
    weak var delegate: SplashViewModelProtocol?
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
