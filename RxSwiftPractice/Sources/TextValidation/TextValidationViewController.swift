//
//  TextValidationViewController.swift
//  RxSwiftPractice
//
//  Created by 縣美早 on 2020/04/08.
//  Copyright © 2020 縣美早. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxOptional

class TextValidationViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var addressLabel: UILabel!
    
    let maxNameFieldSize = 10
    let maxAddressFieldSize = 50
    //    let limitText: (Int) -> String = {
    //        return "あと\($0) 文字"
    //    }
    
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        nameTextField.rx.text
        //            .map { [weak self] text -> String? in
        //                guard let text = text else { return nil }
        //                guard let maxNameFieldSize = self?.maxNameFieldSize else { return nil }
        //                let limitCount = maxNameFieldSize - text.count
        //                return self?.limitText(limitCount)
        //        }
        //        .filterNil()
        //        .observeOn(MainScheduler.instance)
        //        .bind(to: nameLabel.rx.text)
        //        .disposed(by: disposeBag)
        //
        //        addressTextField.rx.text
        //            .map { [weak self] text -> String? in
        //                guard let text = text else { return nil }
        //                guard let maxAddressFieldSize = self?.maxAddressFieldSize else { return nil }
        //                let limitCount = maxAddressFieldSize - text.count
        //                return self?.limitText(limitCount)
        //        }
        //        .filterNil()
        //        .observeOn(MainScheduler.instance)
        //        .bind(to: addressLabel.rx.text)
        //        .disposed(by: disposeBag)
        
        nameTextField.rx.text
            .map { text -> String? in
                guard let text = text else { return nil }
                let limitCount = self.maxNameFieldSize - text.count
                return "あと\(limitCount)文字"
            }
            .bind(to: nameLabel.rx.text)
            .disposed(by: disposeBag)
        
        addressTextField.rx.text
            .map { text -> String? in
                guard let text = text else { return nil }
                let limitCount = self.maxAddressFieldSize - text.count
                return "あと\(limitCount)文字"
            }
            .bind(to: addressLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
