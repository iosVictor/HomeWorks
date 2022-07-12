//
//  HomeViewController.swift
//  BurgerButton
//
//  Created by Victor Kimpel on 7.07.22.
//

import UIKit

protocol HomeViewControllerDelegate: AnyObject {
    
    func didTapButtonMenu()
}

class HomeViewController: UIViewController {
    
    weak var delegate: HomeViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let firstButton = UIButton(frame: CGRect(x: 96, y: 250, width: 160, height: 64))
        firstButton.setTitle("Authorization", for: .normal)
        firstButton.backgroundColor = .gray
        firstButton.addTarget(self, action: #selector(pressFirstButton), for: .touchUpInside)
        self.view.addSubview(firstButton)
        
        let secondButton = UIButton(frame: CGRect(x: 96, y: 330, width: 160, height: 64))
        secondButton.setTitle("second button", for: .normal)
        secondButton.backgroundColor = .gray
        secondButton.addTarget(self, action: #selector(pressSecondButton), for: .touchUpInside)
        self.view.addSubview(secondButton)
        
        let thirdButton = UIButton(frame: CGRect(x: 96, y: 410, width: 160, height: 64))
        thirdButton.setTitle("third button", for: .normal)
        thirdButton.backgroundColor = .gray
        thirdButton.addTarget(self, action: #selector(pressThirdButton), for: .touchUpInside)
        self.view.addSubview(thirdButton)
        
        view.backgroundColor = .blue
        title = "Home"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"),
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(barButtonTapped))
    }
    
    @objc func pressFirstButton() {
        
        let alert = UIAlertController(title: "Log in", message: "Enter your nickname and password", preferredStyle: .alert)
        let alertActionOne = UIAlertAction(title: "OK", style: .default) { (action) in
            let logIn = alert.textFields?.first
            print(logIn?.text ?? "Your logIn not found")
            let password = alert.textFields?.last
            print(password?.text ?? "Your password not found")
        }
        alert.addAction(alertActionOne)
        
        alert.addTextField(configurationHandler: { (logInTF) in
            logInTF.placeholder = "Enter your nickname"
        })
        alert.addTextField(configurationHandler: { (passwordTF) in
            passwordTF.placeholder = "Enter your password"
            passwordTF.isSecureTextEntry = true
        })
        present(alert, animated: true, completion: nil)
    }
    
    @objc func pressSecondButton() {
        OkButton(title: "This is my second alert", message: "123", actionTitles: ["OK"], actions: [ { firstAction in
        }, { secondAction in
        }])
    }
    
    @objc func pressThirdButton() {
        OkButton(title: "This is my third alert", message: "456", actionTitles: ["OK", "Cancel"], actions: [ { firstAction in
        }, { secondAction in
        }])
    }
    
    @objc func barButtonTapped() {
        delegate?.didTapButtonMenu()
        
        let blurEffect = UIBlurEffect(style: .systemChromeMaterialDark)
        let mutniyEffectView = UIVisualEffectView(effect: blurEffect)
        
        mutniyEffectView.frame = view.bounds
        view.addSubview(mutniyEffectView)
    }
}

extension UIViewController {
    func OkButton(title: String, message: String, actionTitles: [String], actions: [((UIAlertAction) -> Void)?]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, title) in actionTitles.enumerated() {
            let action = UIAlertAction(title: title, style: .default, handler: actions[index])
            alert.addAction(action)
        }
        present(alert, animated: true, completion: nil)
    }
}
