//
//  SplashViewController.swift
//  MovieApp
//
//  Created by Ahmet Ozkan on 20.11.2022.
//

import UIKit
import Lottie

// MARK: - SplashViewController

class SplashViewController: UIViewController {
    
    @IBOutlet weak var movieTopView: AnimationView!
    @IBOutlet weak var loadingView: AnimationView!
    @IBOutlet weak var networkDisconnectedView: AnimationView!
    @IBOutlet weak var networkConnectedView: AnimationView!
    
    @IBOutlet weak var remoteConfigTextLabel: UILabel!
    @IBOutlet weak var remoteConfigView: UIView!
    
    lazy var splashViewModel: SplashViewModel = SplashViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        splashViewModel.delegate = self
        splashViewModel.didViewLoad()
        remoteConfigTextClickGoToHomeView()
        
    }
    
}
// MARK: - SplashViewController SetupUI

extension SplashViewController{
    func setupUI(){
        loadingAnimationConfigure()
        movieTopViewAnimation()
        self.remoteConfigView.isHidden = true
        
    }
}
// MARK: - SplashViewController Animation Configure

extension SplashViewController{
    func movieTopViewAnimation(){
        movieTopView.loopMode = .loop
        movieTopView.play()
    }
    func loadingAnimationConfigure(){
        loadingView.loopMode = .loop
        loadingView.play()
        loadingView.isHidden = false
    }
    
}

// MARK: - SplashViewController Network Controller with ViewModelProtocol

extension SplashViewController: SplashViewModelProtocol{
    func networkManagerIsStatus(_ isStatus: Bool) {
        networkConnectConfigure(isStatus)
    }
    
    func networkConnectConfigure(_ isStatus: Bool){
        if isStatus{
            DispatchQueue.main.async {
                print("Connected")
                
                self.networkConnectedView.loopMode = .loop
                self.networkConnectedView.play()
                self.networkConnectedView.isHidden = false
                self.networkDisconnectedView.isHidden = true
                
            }
        }else{
            DispatchQueue.main.async {
                print("Disconnected")
                
                self.remoteConfigView.isHidden = true
                
                self.networkDisconnectedView.loopMode = .loop
                self.networkDisconnectedView.play()
                
                self.networkDisconnectedView.isHidden = false
                self.networkConnectedView.isHidden = true
            }
            
        }
    }
    
    // MARK: - SplashViewController Remote Config
    
    func remoteConfigInitialText(_ text: String?) {
        DispatchQueue.main.async {
            self.loadingView.isHidden = true
            self.remoteConfigTextLabel.text = text ?? "Remote Config Default Text"
            self.remoteConfigView.isHidden = false
        }
    }
}

// MARK: - SplashViewController Route

extension SplashViewController{
    func remoteConfigTextClickGoToHomeView(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(goToHomeView))
        remoteConfigTextLabel.isUserInteractionEnabled = true
        remoteConfigTextLabel.addGestureRecognizer(tap)
    }
    @objc func goToHomeView(sender:UITapGestureRecognizer) {
        loadingView.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            OperationQueue.main.addOperation{
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller  = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                controller.modalPresentationStyle = .overFullScreen
                controller.modalTransitionStyle = .flipHorizontal
                self.present(controller, animated: true, completion: nil)
            }
        }
    }
}
