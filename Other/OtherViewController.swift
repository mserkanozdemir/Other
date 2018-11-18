//
//  ViewController.swift
//  Other
//
//  Created by Serkan Özdemir on 14.11.2018.
//  Copyright © 2018 Serkan Özdemir. All rights reserved.
//

import UIKit

class OtherViewController: UIViewController {
    
    var viewModel = OtherViewModel()
    
    private lazy var tableview: UITableView = {
        let tableview = UITableView.init(frame: .zero, style: .plain)
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableview.delegate = self
        tableview.dataSource = self
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableview)
        populateUI()
    }
    
    func populateUI() {
        tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableview.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    }
}

extension OtherViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionTitle = viewModel.sections[section].sectionTitle
        let sectionHeaderView = ListSectionHeaderView()
        sectionHeaderView.populate(with: sectionTitle)
        return sectionHeaderView
    }
    
}

extension OtherViewController: UITableViewDataSource {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sections[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.sections[indexPath.section].rows[indexPath.row].rowName
        return cell
    }
}
