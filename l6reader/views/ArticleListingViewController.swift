//
//  ViewController.swift
//  l6reader
//
//  Created by woi on 3/7/17.
//  Copyright © 2017 woi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import SegueManager

class ArticleListingViewController: SegueManagerViewController {

    @IBOutlet weak var tableView: UITableView!
   
    var articleListingVM:ArticleListingViewModel!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		tableView.rx.modelSelected(Article.self)
			.subscribe(onNext: { [weak self] article in
				self?.performSegue(withIdentifier: "showArticle",
				handler: {
					(articleDisplay:ArticleDisplayViewController) in
					articleDisplay.article = article
				})
			})
			.disposed(by:disposeBag)
		
        articleListingVM.articles.asDriver()
            .drive(tableView.rx.items(cellIdentifier: "articleItemCell")) {
                _, article, cell in
                cell.textLabel?.text = article.title
            }
			.disposed(by: disposeBag)
        
        articleListingVM.didLoad()
    }
}

