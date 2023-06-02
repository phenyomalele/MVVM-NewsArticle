//
//  Webservice.swift
//  MVVMNewsApp
//
//  Created by DA MAC M1 117 on 2023/06/02.
//

import Foundation

struct Webservice {
    
    //passing URL.
    func getArticles(url: URL, completion: @escaping ([Article]?) -> Void) {
        
        //create session. consuming data. return the data(200) should it be successful, response and error(400)
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            //error handling
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                print(data)
                
                //decoding data
                
                let articles = try? JSONDecoder().decode(Articles.self, from: data).articles
                
                if let articles = articles {
                    print(articles)
                    completion(articles)
                }
            }
        }.resume()
        
    }
}
