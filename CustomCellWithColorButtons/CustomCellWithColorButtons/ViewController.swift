//
//  ViewController.swift
//  CustomCellWithColorButtons
//
//  Created by Victor Kimpel on 31.07.22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    
    let data = ["First", "Second", "Third", "Fourth", "Fifth", "Sixth", "Seventh"]
    private var backgrounColor: [UIColor] = [.red, .orange, .yellow, .green, .cyan, .blue, .purple] {
        didSet {
            table.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(MyTableViewCell.nib(), forCellReuseIdentifier: MyTableViewCell.identifier)
        table.dataSource = self
    }
    
    private func changeColor() {
        let newBackgrounColor: [UIColor] = [.red, .orange, .yellow, .green, .cyan, .blue, .purple]
        backgrounColor.append(contentsOf: newBackgrounColor)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return data.count
        return backgrounColor.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier,
                                                 for: indexPath) as! MyTableViewCell
        cell.configure(with: data[indexPath.row])
        cell.delegate = self
        cell.button.tag = indexPath.row
        cell.backgroundColor = backgrounColor[indexPath.row]
        cell.button.addTarget(self, action: #selector(changeCellColor(_:)), for: .touchUpInside)
        return cell
    }
    
    @objc func changeCellColor(_ push: UIButton) {
        view.backgroundColor = backgrounColor[push.tag]
    }

}

extension ViewController: MyTableViewCellDelegate {
   
    func didTapButton(with title: String) {
        print("\(title)")
    }
}

