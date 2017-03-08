//
//  ArticleListingViewModelTest.swift
//  l6reader
//
//  Created by woi on 3/8/17.
//  Copyright © 2017 woi. All rights reserved.
//

import XCTest
import RxSwift
@testable import l6reader

class DisplayArticleMock : DisplayArticle {
     func display() -> Observable<[Article]> {
        return Observable.just([Article()]);
    }
}

class ArticleListingViewModelTest: XCTestCase {
    
    func testLoadArticlesOnDidLoad() {
        let articleListingVM = ArticleListingViewModel(displayArticle: DisplayArticleMock())
        
        XCTAssertTrue(articleListingVM.articles.value.isEmpty)
        articleListingVM.didLoad()
        XCTAssertFalse(articleListingVM.articles.value.isEmpty)
    }
}
