//
//  SplashViewController.swift
//  MovieApp
//
//  Created by Ahmet Ozkan on 20.11.2022.
//

import UIKit
import Lottie

import Reachability


let reactibility =  try! Reachability()

class SplashViewController: UIViewController {
    
    @IBOutlet weak var movieTopView: AnimationView!
    @IBOutlet weak var loadingView: AnimationView!
    @IBOutlet weak var networkControllerView: AnimationView!
    @IBOutlet weak var remoteConfigTextLabel: UILabel!
  
    
    lazy var splashViewModel: SplashViewModel = SplashViewModel()
   
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        splashViewModel.delegate = self
        splashViewModel.didViewLoad()
        remoteConfigTextClickGoToHomeView()
        
        
        
        networkController()
        
      
    }
    override func viewWillAppear(_ animated: Bool) {
        networkController()
    }
  
    
    func networkController(){
        reactibility.whenReachable = { reactibility in
            print("Wifi")
                self.networkConnected()
 
        }
        reactibility.whenUnreachable = { _ in
            print("Unreachable Disconnect")
            self.alertFunc()
            self.networkDisconnected()
          
        }
        do{
            try? reactibility.startNotifier()
        }
    }
    
    func alertFunc(){
        let alert = UIAlertController(title: "No Internet", message: " WIFI/Cell connection required!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", tableName: "Default Action", comment: "Comment"), style: .default, handler: { _ in
            NSLog("OK")
        }))
        self.present(alert, animated: true,completion: nil)
        
    }
  

    @objc func networkDisconnected(){
        DispatchQueue.main.async {
            print("Disconnected")
            self.remoteConfigTextLabel.isHidden = true

            self.networkControllerView.loopMode = .loop
            self.networkControllerView.play()
            self.networkControllerView.isHidden = false
        }
    }
    @objc func networkConnected(){
        DispatchQueue.main.async {
            print("Connected")
            self.remoteConfigTextLabel.isHidden = false
            self.networkControllerView.isHidden = true
        }
    }
    
   
    @objc
    func goToHomeView(sender:UITapGestureRecognizer) {
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
extension SplashViewController{
    func setupUI(){
        loadingAnimationConfigure()
        movieTopViewAnimation()
    }
}
extension SplashViewController{
    func movieTopViewAnimation(){
        movieTopView.loopMode = .loop
        movieTopView.play()
    }
    func loadingAnimationConfigure(){
         loadingView.loopMode = .loop
         loadingView.play()
         loadingView.isHidden = true
    }
    func networkConnectConfigure(_ isStatus: Bool){
        if isStatus{
            DispatchQueue.main.async {
                self.remoteConfigTextLabel.isHidden = false
                self.networkControllerView.isHidden = true
            }
            
        }else{
            DispatchQueue.main.async {
                self.remoteConfigTextLabel.isHidden = true

                self.networkControllerView.loopMode = .loop
                self.networkControllerView.play()
                self.networkControllerView.isHidden = false
            }
        }
    }
}

extension SplashViewController: SplashViewModelProtocol{
    func networkManagerIsStatus(_ isStatus: Bool) {
           //networkConnectConfigure(isStatus)
    }
    
    func remoteConfigInitialText(_ text: String?) {
        DispatchQueue.main.async {
            self.remoteConfigTextLabel.text = text ?? "Remote Config Default Text"
        }
}
}
extension SplashViewController{
    func remoteConfigTextClickGoToHomeView(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(goToHomeView))
        remoteConfigTextLabel.isUserInteractionEnabled = true
        remoteConfigTextLabel.addGestureRecognizer(tap)
    }
}
