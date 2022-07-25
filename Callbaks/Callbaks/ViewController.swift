//
//  ViewController.swift
//  Callbaks
//
//  Created by Victor Kimpel on 25.07.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if case let controller as SecondViewController = segue.destination, segue.identifier == "segue" {
            controller.completion = { [unowned self] text in
                self.label.text = text
            }
        }
    }

}

