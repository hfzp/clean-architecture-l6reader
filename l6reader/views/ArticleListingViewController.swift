//
//  ViewController.swift
//  l6reader
//
//  Created by woi on 3/7/17.
//  Copyright © 2017 woi. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

class ArticleListingViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
   
    var articleListingVM:ArticleListingViewModel!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        articleListingVM.articles.asDriver()
            .drive(tableView.rx.items(cellIdentifier: "articleItemCell")) {
                _, article, cell in
                cell.textLabel?.text = article.title
            }.disposed(by: disposeBag)
        
        articleListingVM.didLoad()
    }
}

