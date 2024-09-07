//
//  TimeOutVC.swift
//  Speedo Transfer
//
//  Created by Ahmed Nasser on 07/09/2024.
//

import UIKit

class TimeOutVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet var outerView: UIView!
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpScreen()
        self.showInactiveWarningBanner()
    }
    
    // MARK: - Actions
    @IBAction func signInBtnTapped(_ sender: UIButton) {
        
    }
    
    // MARK: - Private Methods
    private func setUpScreen() {
        self.navigationController?.isNavigationBarHidden = true
        UIColor.setupBackgroundColor(for: self.outerView)
        UIColor.setupBackgroundColor(for: self.innerView)
        TextFieldHelper.addRightIcon(to: emailTextField, imageName: "envelope.fill")
        addPasswordToggle(to: passwordTextField)
    }
    
    // MARK: - Show Inactivity Warning Banner
    private func showInactiveWarningBanner() {
        let bannerView = UIView()
        bannerView.backgroundColor = UIColor.lightGray
        bannerView.layer.cornerRadius = 10
        bannerView.clipsToBounds = true
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        
        let warningImageView = UIImageView(image: UIImage(systemName: "exclamationmark.circle.fill"))
        warningImageView.tintColor = .black
        warningImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let messageLabel = UILabel()
        messageLabel.text = "We Logged you out because you were inactive for 2 minutes - it's to help your account secure"
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let closeButton = UIButton(type: .system)
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.tintColor = .black
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.addTarget(self, action: #selector(dismissBanner(_:)), for: .touchUpInside)
        
        bannerView.addSubview(warningImageView)
        bannerView.addSubview(messageLabel)
        bannerView.addSubview(closeButton)
        self.view.addSubview(bannerView)
        
        NSLayoutConstraint.activate([
            bannerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            bannerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50), // Position at the top with a 10pt margin
            bannerView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9),
            bannerView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            warningImageView.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor, constant: 10),
            warningImageView.centerYAnchor.constraint(equalTo: bannerView.centerYAnchor),
            warningImageView.widthAnchor.constraint(equalToConstant: 30),
            warningImageView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            closeButton.trailingAnchor.constraint(equalTo: bannerView.trailingAnchor, constant: -10),
            closeButton.centerYAnchor.constraint(equalTo: bannerView.centerYAnchor),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    
        NSLayoutConstraint.activate([
            messageLabel.leadingAnchor.constraint(equalTo: warningImageView.trailingAnchor, constant: 10),
            messageLabel.trailingAnchor.constraint(equalTo: closeButton.leadingAnchor, constant: -10),
            messageLabel.centerYAnchor.constraint(equalTo: bannerView.centerYAnchor)
        ])
    }

    @objc func dismissBanner(_ sender: UIButton) {
        if let bannerView = sender.superview {
            UIView.animate(withDuration: 0.3, animations: {
                bannerView.alpha = 0
            }) { _ in
                bannerView.removeFromSuperview()
            }
        }
    }
}
