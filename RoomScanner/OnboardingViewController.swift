//
//  ViewController.swift
//  RoomScanner
//
//  Created by Shemetov Elisey on 20.11.2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    @IBOutlet var existingScanView: UIView!
    
    @IBAction func startScan(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.isFirstLaunch = false
        
        let viewController = UIStoryboard(name: "RoomScanner", bundle: nil).instantiateViewController(withIdentifier: "RoomCaptureViewNavigationController")
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
}

