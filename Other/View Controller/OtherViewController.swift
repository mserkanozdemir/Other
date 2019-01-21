//
//  ViewController.swift
//  Other
//
//  Created by Serkan Özdemir on 14.11.2018.
//  Copyright © 2018 Serkan Özdemir. All rights reserved.
//

import UIKit
import Cartography

class OtherViewController: UIViewController {
    
    var viewModel = OtherViewModel()
    
    private lazy var tableview: UITableView = {
        let tableview = UITableView.init(frame: .zero, style: .plain)
        tableview.register(OtherCell.self, forCellReuseIdentifier: "cell")
        tableview.register(TextFieldTableViewCell.self, forCellReuseIdentifier: "textFieldCell")
        tableview.register(SliderTableViewCell.self, forCellReuseIdentifier: "sliderCell")
        tableview.delegate = self
        tableview.dataSource = self
        tableview.tableHeaderView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 0.1, height: 0.1))
        tableview.tableFooterView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 30.0))
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
        constrain(tableview) { $0.edges == $0.superview!.edges }
    }
}

extension OtherViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let section = viewModel.sections[section]
        let sectionHeaderView = ListSectionHeaderView()
        sectionHeaderView.populate(with: section.sectionTitle, showTopLine: section.shouldShowTopLine )
        return sectionHeaderView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return viewModel.sections[section].sectionHeaderHeight
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 44
//    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
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
        case .Name, .Surname, .BirthDate, .Email :
            let cell = tableView.dequeueReusableCell(withIdentifier: "textFieldCell", for: indexPath) as! TextFieldTableViewCell
            cell.populateUI(with: rowType)
            return cell
        case .AllowSms, .AllowEmail:
            let cell = tableView.dequeueReusableCell(withIdentifier: "sliderCell", for: indexPath) as! SliderTableViewCell
            cell.populateUI(with: rowType)
            cell.selectionStyle = .none
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OtherCell
            cell.populateUI(with: rowType)
            
            return cell
        }
    }
}
