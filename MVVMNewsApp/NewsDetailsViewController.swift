//
//  NewsDetailsViewController.swift
//  MVVMNewsApp
//
//  Created by DA MAC M1 117 on 2023/06/02.
//

import UIKit

class NewsDetailsViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //these can change
    var titleLbl = ""
    var descriptionLbl = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        textLabel.text = titleLbl
        descriptionLabel.text = descriptionLbl
        
    }
    

}
