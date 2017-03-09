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

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
   
    private let data = Observable<[String]>.just(["first element", "second element", "third element"])
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        data.bindTo(tableView.rx.items(cellIdentifier: "articleItemCell")) {
                _, article, cell in
                cell.textLabel?.text = article
            }.disposed(by: disposeBag)
    }
}

