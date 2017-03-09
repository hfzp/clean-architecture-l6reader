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


class DisplayArticleMock : DisplayArticle {
    
    func display() -> Observable<[Article]> {
        let articles = [Article(title:"mine"), Article(title:"yours"), Article(title:"the truth")]
        return Observable.just(articles)
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
   
    private let data = Observable<[String]>.just(["first element", "second element", "third element"])
    
    
    private var articleListingVM = ArticleListingViewModel(displayArticle: DisplayArticleMock())
    
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

