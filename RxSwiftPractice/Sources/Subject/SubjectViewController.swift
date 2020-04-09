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
    
    private let disposeBag = DisposeBag()
    var viewModel: SubjectViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = SubjectViewModel()
        
        viewModel.helloWorldSubject
            .subscribe(onNext: { [weak self] value in
                print("Subject:\nvalue is \(value)")
            })
            .disposed(by: disposeBag)
        
        viewModel.helloWorldRelay
            .subscribe(onNext: { [weak self] value in
                print("Relay:\nvalue is \(value)")
            })
            .disposed(by: disposeBag)
        
        viewModel.updateItem()
    }
}
