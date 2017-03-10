//
//  SwinjectStoryboard+Setup.swift
//  l6reader
//
//  Created by woi on 3/10/17.
//  Copyright © 2017 woi. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard
import RxSwift


class L6ServiceMock : L6Service {
    func getArticles() -> Observable<[Article]> {
        let articles = [Article(title:"mine"), Article(title:"yours"), Article(title:"the truth")]
        return Observable.just(articles)
    }
}

extension SwinjectStoryboard {
    class func setup() {
        
        defaultContainer.storyboardInitCompleted(ArticleListingViewController.self) { r, c in
            c.articleListingVM = r.resolve(ArticleListingViewModel.self)
        }
        
        defaultContainer.register(ArticleListingViewModel.self) { r in
            ArticleListingViewModel(displayArticle: r.resolve(DisplayArticle.self)!)
        }
        
        defaultContainer.register(DisplayArticle.self) { r in
            DisplayArticleImpl(l6Service: r.resolve(L6Service.self)!)
        }
        
        defaultContainer.register(L6Service.self) { _ in
            L6ServiceMock()
        }
    }
}
