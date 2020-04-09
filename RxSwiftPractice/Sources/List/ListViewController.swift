//
//  File.swift
//  RxSwiftPractice
//
//  Created by 縣美早 on 2020/04/08.
//  Copyright © 2020 縣美早. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    private var rowType: RowType?
    
    private enum RowType: String, CaseIterable {
        case buttonTap
        case textValidation
        case subject
        
        static let all = allCases.map { $0.rawValue }
    }
    
    @IBOutlet private weak var listTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    func configureUI() {
        listTableView.tableFooterView = UIView()
        listTableView.dataSource = self
        listTableView.delegate = self
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch RowType.allCases[indexPath.row] {
        case .buttonTap:
            let buttonTapViewController = ButtonTapViewController.instantiate()
            navigationController?.pushViewController(buttonTapViewController, animated: true)
        case .textValidation:
            let buttonTapViewController = TextValidationViewController.instantiate()
            navigationController?.pushViewController(buttonTapViewController, animated: true)
        case .subject:
            let subjectViewController = SubjectViewController.instantiate()
            navigationController?.pushViewController(subjectViewController, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RowType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "ListViewControllerCell")
        cell?.textLabel?.text = RowType.all[indexPath.row]
        return cell!
    }
}
