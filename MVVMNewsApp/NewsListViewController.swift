//
//  ViewController.swift
//  MVVMNewsApp
//
//  Created by DA MAC M1 117 on 2023/06/02.
//

import UIKit

class NewsListViewController: UIViewController {
    private var articlesVM: ArticlesViewModel!
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    func setup() {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=18929a4d97d347128bf237e9d29fc571") else {
            return
        }
        Webservice().getArticles(url: url) { articles in
            
            if let articles = articles {
                self.articlesVM = ArticlesViewModel(articles: articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
          
        }
    }

}
//MARK: - Tableview Methods

extension NewsListViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        
        //if theres no sections pass nil
        return articlesVM == nil ? 0 : self.articlesVM.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articlesVM.numberOfRowsInSection(section)
       
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsListTableViewCell", for: indexPath) as? NewsListTableViewCell
        else { return UITableViewCell() }
        
        let articlesVM = self.articlesVM.articleAtIndex(indexPath.row)
        
        cell.titleTextLabel.text = articlesVM.title
        cell.descriptionTextLabel.text = articlesVM.description
        return cell
    }
    //navigation controller by storyboards
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        guard let storyboard = storyboard?.instantiateViewController(identifier: "NewsDetailsViewController") as? NewsDetailsViewController else { return }
//
//        //let articlesVM = self.articlesVM.articleAtIndex(indexPath.row)
//        //storyboard.descriptionLbl = articlesVM.description
//        //storyboard.titleLbl = articlesVM.title
//        present(storyboard, animated: true)
//
//       // navigationController?.pushViewController(storyboard, animated: true)
//    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let storyboard = storyboard?.instantiateViewController(identifier: "NewsDetailsViewController") as?
        NewsDetailsViewController else { return }
        
        let articlesVM = self.articlesVM.articleAtIndex(indexPath.row)
        storyboard.descriptionLbl = articlesVM.description
        storyboard.titleLbl = articlesVM.title
     
        
        navigationController?.pushViewController(storyboard, animated: true)
        
    }
}
