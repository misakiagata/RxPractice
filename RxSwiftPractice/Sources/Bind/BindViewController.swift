
//
//  BindViewController.swift
//  RxSwiftPractice
//
//  Created by 縣美早 on 2020/04/10.
//  Copyright © 2020 縣美早. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxOptional

class BindViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextField.rx.text
            .bind(to: nameLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
