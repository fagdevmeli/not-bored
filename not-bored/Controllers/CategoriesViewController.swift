//
//  CategoriesViewController.swift
//  not-bored
//
//  Created by Sebastian Martin Pagura on 03/01/2022.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    @IBOutlet weak var tableCategories: UITableView!
    
    let categories = ["education", "recreational", "social", "diy", "charity", "cooking", "relaxation", "music", "busywork"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupCategories()
    }
    
    func setupNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        let barItem = UIBarButtonItem(image: UIImage(systemName: "shuffle"),
                                      style: .plain,
                                      target: self, action: #selector(tapShuffle))
        barItem.tintColor = .green
        navigationItem.rightBarButtonItem = barItem
        
    }
    
    func setupCategories() {
        self.tableCategories.dataSource = self
        self.tableCategories.delegate = self
    }
    
    @objc func tapShuffle() {
        print("Test")
        let vc = SuggestionViewController(nibName: "SuggestionViewController", bundle: nil)
        vc.category = "random"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "myCell")
            cell?.accessoryType = .disclosureIndicator
        }
        cell?.textLabel?.text = categories[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = SuggestionViewController(nibName: "SuggestionViewController", bundle: nil)
        vc.category = categories[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
