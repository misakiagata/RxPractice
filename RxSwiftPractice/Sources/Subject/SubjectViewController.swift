//
//  SubjectViewController.swift
//  RxSwiftPractice
//
//  Created by 縣美早 on 2020/04/09.
//  Copyright © 2020 縣美早. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SubjectViewController: UIViewController {
    
    let helloWorldSubject = PublishSubject<String>()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        helloWorldSubject
            .subscribe(onNext: { [weak self] value in
                print("value is \(value)")
            })
            .disposed(by: disposeBag)
        
        helloWorldSubject.onNext("Hello World!")
        helloWorldSubject.onNext("Hello World!!")
        helloWorldSubject.onNext("Hello World!!!")
    }
}
