//
//  SubjectModel.swift
//  RxSwiftPractice
//
//  Created by 縣美早 on 2020/04/09.
//  Copyright © 2020 縣美早. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SubjectViewModel {
    
    let helloWorldSubject = PublishSubject<String>()
    let helloWorldRelay = PublishRelay<String>()
    
    func updateItem() {
        helloWorldSubject.onNext("Hello World!")
        helloWorldSubject.onNext("Hello World!!")
        helloWorldSubject.onNext("Hello World!!!")
        
        helloWorldRelay.accept("Hello World!")
        helloWorldRelay.accept("Hello World!!")
        helloWorldRelay.accept("Hello World!!!")
    }
}
