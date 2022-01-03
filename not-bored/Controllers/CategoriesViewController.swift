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
        setupShuffleButton()
        setupCategproes()
    }
    
    func setupShuffleButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "shuffle"), style: .plain, target: self, action: #selector(tapShuffle))
        
    }
    
    func setupCategproes() {
        self.tableCategories.dataSource = self
        self.tableCategories.delegate = self
    }
        
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @objc func tapShuffle() {
        print("Test")
        let vc = SuggestionViewController(nibName: "SuggestionViewController", bundle: nil)
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
}
