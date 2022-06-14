//
//  ViewController.swift
//  HomeWorks
//
//  Created by Victor Kimpel on 14.06.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myStackView: UIStackView!
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        myStackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(stackDidTap)))
        myView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewDidTap)))
    }
    
    @objc func stackDidTap() {
        myStackView.frame.origin = .init(x: .random(in: 0...view.frame.maxX - myStackView.frame.width), y: .random(in: 0...view.frame.maxY - myStackView.frame.height))
    }
    
    @objc func viewDidTap() {
        myView.frame = .init(x: myView.frame.origin.x, y: myView.frame.origin.y, width: 10, height: 10)
    }
    
    @IBAction func actionOne(_ sender: Any) {
        myStackView.isHidden = true
    }
    
    @IBAction func actionTwo(_ sender: Any) {
        myStackView.isHidden = false
    }
}

