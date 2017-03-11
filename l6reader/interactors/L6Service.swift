//
//  L6Service.swift
//  l6reader
//
//  Created by Hafiz Pariabi on 3/7/17.
//  Copyright © 2017 Hafiz Pariabi. All rights reserved.
//

import Foundation
import RxSwift

protocol L6Service {
    func getArticles() -> Observable<[Article]>
}

class L6ServiceBaseMock : L6Service {
    func getArticles() -> Observable<[Article]> { return Observable.empty() }
}
