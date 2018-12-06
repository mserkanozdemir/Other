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
        let tableview = UITableView.init(frame: .zero, style: .grouped)
        tableview.register(OtherCell.self, forCellReuseIdentifier: "cell")
        tableview.register(LogOutTableViewCell.self, forCellReuseIdentifier: "logOutCell")
        tableview.delegate = self
        tableview.dataSource = self
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.tableFooterView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 30.0))
        tableview.tableFooterView?.backgroundColor = #colorLiteral(red: 0.9294117647, green: 0.9294117647, blue: 0.9294117647, alpha: 1)
        tableview.backgroundColor = #colorLiteral(red: 0.9294117647, green: 0.9294117647, blue: 0.9294117647, alpha: 1)
        tableview.separatorColor = tableview.backgroundColor
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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return viewModel.sections[section].sectionHeaderHeight
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
        guard let rowType = viewModel.getRowType(indexPath: indexPath) else  {
           return UITableViewCell()
        }
        
        switch rowType {
        case .Logout :
            let cell = tableView.dequeueReusableCell(withIdentifier: "logOutCell", for: indexPath) as! LogOutTableViewCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OtherCell
            cell.populateUI(with: rowType)
            
            return cell
        }
        
        

        
    }
}
