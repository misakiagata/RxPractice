//
//  ButtonTapViewController.swift
//  RxSwiftPractice
//
//  Created by 縣美早 on 2020/04/08.
//  Copyright © 2020 縣美早. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ButtonTapViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textChangeButton: UIButton!
    
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        textChangeButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.textLabel.text = "After"
            })
            .disposed(by: disposeBag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textLabel.text = "Before"
    }
}
