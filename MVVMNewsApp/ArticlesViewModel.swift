//
//  ArticlesViewModel.swift
//  MVVMNewsApp
//
//  Created by DA MAC M1 117 on 2023/06/02.
//

import Foundation

struct ArticlesViewModel {
    let articles: [Article]
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
}
