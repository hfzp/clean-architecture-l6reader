//
//  DisplayArticleTest.swift
//  l6reader
//
//  Created by Hafiz Pariabi on 3/7/17.
//  Copyright © 2017 Hafiz Pariabi. All rights reserved.
//

import XCTest
import RxSwift
import RxTest
import RxBlocking
@testable import l6reader

class L6ServiceMock : L6ServiceBaseMock {
    override func getArticles() -> Observable<[Article]> {
        return Observable.just([Article()])
    }
}

class DisplayArticleTest: XCTestCase {
    
    func testDisplay() {
        let l6Service = L6ServiceMock()
        let displayArticle = DisplayArticleImpl(l6Service: l6Service)
        let articles = try! displayArticle.display().toBlocking().first()!
        XCTAssertGreaterThan(articles.count, 0)
    }
}
