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
        view.backgroundColor = .cyan
        title = "Home"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"),
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(barButtonTapped))
    }
    
    @objc func barButtonTapped() {
        delegate?.didTapButtonMenu()
        
        let blurEffect = UIBlurEffect(style: .systemChromeMaterialDark)
        let mutniyEffectView = UIVisualEffectView(effect: blurEffect)
        
        mutniyEffectView.frame = view.bounds
        view.addSubview(mutniyEffectView)
    }
}
