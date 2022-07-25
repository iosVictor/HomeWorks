//
//  ViewController.swift
//  WebBro
//
//  Created by Victor Kimpel on 25.07.22.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func search(_ sender: Any) {
        if let text = textField.text {
            if let search = URL(string: text) {
                let field = URLRequest(url: search)
                webView.load(field)
            }
        }
    }
    
    @IBAction func forwardButton(_ sender: Any) {
        webView.goForward()
    }
    @IBAction func backwardButton(_ sender: Any) {
        webView.goBack()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

