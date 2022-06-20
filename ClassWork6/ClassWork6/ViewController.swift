//
//  ViewController.swift
//  ClassWork6
//
//  Created by Victor Kimpel on 18.06.22.
//

import UIKit

class ViewController: UIViewController {
    
    let myView = UIView()
    let myView2 = UIView()
    let myView3 = UIView()
    let myView4 = UIView()
    let myView5 = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        myView2.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        myView3.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        myView4.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        myView5.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        myView.frame = CGRect(x: 40, y: 80, width: 140, height: 70)
        view.addSubview(myView)
        
        myView2.frame = CGRect(x: 40, y: 160, width: 140, height: 70)
        view.addSubview(myView2)
        
        myView3.frame = CGRect(x: 40, y: 240, width: 140, height: 70)
        view.addSubview(myView3)
        
        myView4.frame = CGRect(x: 200, y: 80, width: 140, height: 70)
        view.addSubview(myView4)
        
        myView5.frame = CGRect(x: 200, y: 160, width: 140, height: 70)
        view.addSubview(myView5)
    }
    
    
    @IBAction func cleanButtonTap(_ sender: Any) {
        let myViews = [myView, myView2, myView3, myView4, myView5]
        let view = myViews.randomElement()
        view?.isHidden = !view!.isHidden
        
//        myViews.randomElement()?.isHidden = true
    }
    
}

