//
//  MenuViewController.swift
//  BurgerButton
//
//  Created by Victor Kimpel on 7.07.22.
//

import UIKit

protocol MenuViewControllerDelegate: AnyObject {
    
    func didSelect(menuItem: MenuViewController.MenuOption)
}

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    weak var delegate: MenuViewControllerDelegate?
    
    enum MenuOption: String, CaseIterable {
        case home = "Home"
        case info = "Information"
        case appRating = "App Rating"
        case message = "Message"
        case setting = "Setting"
        
        var imageName: String {
            switch self {
            case .home:
                return "house"
            case .info:
                return "info"
            case .appRating:
                return "star"
            case .message:
                return "message"
            case .setting:
                return "gear"
            }
        }
    }
    
    private let tableView: UITableView = {
       let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .white
        return tableView
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.bounds.size.width, height: view.bounds.size.height)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        
        view.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuOption.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = MenuOption.allCases[indexPath.row].rawValue
        cell.textLabel?.textColor = .lightGray
        cell.backgroundColor = .white
        cell.contentView.backgroundColor = .white
        cell.imageView?.image = UIImage(systemName: MenuOption.allCases[indexPath.row].imageName)
        cell.imageView?.tintColor = .lightGray
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = MenuOption.allCases[indexPath.row]
        delegate?.didSelect(menuItem: item)
    }

}
