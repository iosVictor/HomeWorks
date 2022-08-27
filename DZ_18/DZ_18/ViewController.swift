//
//  ViewController.swift
//  DZ_18
//
//  Created by Victor Kimpel on 20.07.22.
//

import UIKit
import SwiftyKeychainKit
import SPIndicator

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var imgArr = [UIImage(named: "homer0"),
                  UIImage(named: "homer1"),
                  UIImage(named: "homer2"),
                  UIImage(named: "homer3"),
                  UIImage(named: "homer4"),
                  UIImage(named: "homer5"),
                  UIImage(named: "homer6"),
                  UIImage(named: "homer7"),
                  UIImage(named: "homer8"),
                  UIImage(named: "homer9"),
                  UIImage(named: "homer10"),
                  UIImage(named: "homer11"),
                  UIImage(named: "homer12")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DataCollectionViewCell", for: indexPath) as? DataCollectionViewCell
        cell?.img.image = imgArr[indexPath.row]
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section:Int) -> Int {
        return imgArr.count
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size
        
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


class ViewControllerTwo: UIViewController {
    
    // MARK: - KeychainService
    let keychain = Keychain(service: "com.arc.keychain")
    
    // MARK: - Keychain KEY
    let accessTokenKey = KeychainKey<String>(key: "accessToken")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
    }
    
    func handleError(with message: String) {
        let indicatorView = SPIndicatorView(title: "Error", message: "Access denied", preset: .error)
        indicatorView.present(duration: 3.0, haptic: .error)
    }
    
    @IBAction func didTapPressButton(_ sender: Any) {
        if let token = try? keychain.get(accessTokenKey) {
            if token != "naborsimvolov" {
                handleError(with: "Invalid Data")
                return
            }
            let vc = ViewController()
            navigationController?.pushViewController(vc, animated: true)
        } else {
            handleError(with: "Access denied")
        }
    }
    
    @IBAction func didTapSecret(_ sender: Any) {
        do {
            try keychain.set("naborsimvolov", for: accessTokenKey)
        } catch {
            print(error.localizedDescription)
        }
    }
}
