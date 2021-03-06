//
//  ArticleListingViewModel.swift
//  l6reader
//
//  Created by Hafiz Pariabi on 3/8/17.
//  Copyright © 2017 Hafiz Pariabi. All rights reserved.
//

import Foundation
import RxSwift

class ArticleListingViewModel {
    
    var articles = Variable<[Article]>([])
    
    private var displayArticle: DisplayArticle
    private let disposeBag = DisposeBag()
    
    init(displayArticle: DisplayArticle) {
        self.displayArticle = displayArticle
    }
    
    func didLoad() {
        displayArticle.display().subscribe(onNext: {
            [weak self] articles in
            self?.articles.value = articles
        }).addDisposableTo(disposeBag)
    }
}
