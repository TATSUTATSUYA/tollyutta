//
//  HomeViewController.swift
//  tolytta--
//
//  Created by 岡本竜弥 on 2023/06/09.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var user: [User] = []
    
    override func viewDidLoad() {
        
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let memoDataModel: User = user[indexPath.row]
        cell.textLabel?.text = memoDataModel.text
        cell.detailTextLabel?.text = "\(memoDataModel.recordDate)"
        return cell
    }
}
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let TweetDetailViewController = storyboard.instantiateViewController(identifier: "tweetDetailViewController") as! tweetDetailViewController
        let memoData = user[indexPath.row]
              tweetDetailViewController.configure(memo: memoData)
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(TweetDetailViewController, animated: true)
    }
}
