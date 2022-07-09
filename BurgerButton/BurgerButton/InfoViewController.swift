//
//  InfoViewController.swift
//  BurgerButton
//
//  Created by Victor Kimpel on 7.07.22.
//

import UIKit

protocol InfoViewControllerDelegate: AnyObject {
    
    func didTapButtonMenu()
}

class InfoViewController: UIViewController {
    
    weak var delegate: InfoViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPink
        title = "Info"
    }
    
    @objc func barButtonTapped() {
        delegate?.didTapButtonMenu()
        
        let blurEffect = UIBlurEffect(style: .systemChromeMaterialDark)
        let mutniyEffectView = UIVisualEffectView(effect: blurEffect)
        
        mutniyEffectView.frame = view.bounds
        view.addSubview(mutniyEffectView)
    }
}
