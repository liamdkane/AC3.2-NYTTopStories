//
//  TopStoriesTableViewController.swift
//  NYTimesTopStoriesV2
//
//  Created by C4Q on 11/20/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class TopStoriesTableViewController: UITableViewController {

    let cellIdentifier = "TopStoryCell"
    let nyTimesEndpoint = "https://api.nytimes.com/svc/topstories/v2/home.json?api-key=31ae7c06e3314e21b83c2b3846fe3f26"
    
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTableView()

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TopStoryTableViewCell
        cell.article = articles[indexPath.row]

        return cell
    }
 

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let validURL = URL(string: self.articles[indexPath.row].url) {
            UIApplication.shared.open(validURL, options: [:], completionHandler: nil)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Methods
    
    func loadTableView () {
        APIManager.manager.apiCall(endPoint: nyTimesEndpoint) {(data: Data?) in
            guard let validData = data else {return}
            self.articles = Article.makeArticles(data: validData) ?? []
            DispatchQueue.main.async {
                self.tableView.reloadData()
                print(self.articles.count)
            }
        }
    }

}
