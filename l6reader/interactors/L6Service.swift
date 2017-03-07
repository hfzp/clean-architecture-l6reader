//
//  L6Service.swift
//  l6reader
//
//  Created by woi on 3/7/17.
//  Copyright © 2017 woi. All rights reserved.
//

import Foundation

protocol L6Service {
    func getArticles() -> [Article]
}

class L6ServiceBaseMock : L6Service {
    func getArticles() -> [Article] { return [] }
}