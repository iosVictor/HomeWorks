//
//  SecondViewController.swift
//  Callbaks
//
//  Created by Victor Kimpel on 25.07.22.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    var completion: ((String) -> ())?
    
    @IBAction func backPressed(sender: UIButton) {
        getDataAndBack()
    }
    
    private func getDataAndBack() {
        guard let text = textField.text, text != "" else {
            completion?("no data")
            navigationController?.popViewController(animated: true)
            return
        }
        completion?(text)
        navigationController?.popViewController(animated: true)
    }

}
