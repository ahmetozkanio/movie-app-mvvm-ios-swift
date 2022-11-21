//
//  SplashViewController.swift
//  MovieApp
//
//  Created by Ahmet Ozkan on 20.11.2022.
//

import UIKit

class SplashViewController: UIViewController {
    
    @IBOutlet weak var remoteConfigTextLabel: UILabel!
    
    lazy var splashViewModel: SplashViewModel = SplashViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splashViewModel.delegate = self
        splashViewModel.didViewLoad()
        remoteConfigTextClickGoToHomeView()
    }


    @objc
    func goToHomeView(sender:UITapGestureRecognizer) {
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

extension SplashViewController: SplashViewModelProtocol{
    func networkManagerIsStatus(_ isStatus: Bool) {
        if isStatus{
            DispatchQueue.main.async {
                self.view.backgroundColor = .blue
                self.remoteConfigTextLabel.isHidden = false
            }
        }else{
            DispatchQueue.main.async {
                self.view.backgroundColor = .red
                self.remoteConfigTextLabel.isHidden = true
            }
        }
      
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
