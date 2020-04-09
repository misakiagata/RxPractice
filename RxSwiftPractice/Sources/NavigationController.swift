//
//  NavigationController.swift
//  RxSwiftPractice
//
//  Created by 縣美早 on 2020/04/08.
//  Copyright © 2020 縣美早. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func loadView() {
        super.loadView()
        navigationBar.prefersLargeTitles = true
    }
}
