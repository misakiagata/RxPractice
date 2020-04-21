//
//  CountViewController.swift
//  RxSwiftPractice
//
//  Created by 縣美早 on 2020/04/21.
//  Copyright © 2020 縣美早. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CountViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    private let disposeBag = DisposeBag()
    
    var viewModel: CountViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewModel()
    }
    
    private func setupViewModel() {
        let input = RxViewModelInput (
            plusButton: plusButton.rx.tap.asObservable(),
            minusButton: minusButton.rx.tap.asObservable(),
            clearButton: clearButton.rx.tap.asObservable()
        )
        viewModel = CountViewModel(input: input)
        
        viewModel.outputs?.counterText
            .drive(countLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
