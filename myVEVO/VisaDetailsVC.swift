//
//  VisaHolderVC.swift
//  myVEVO
//
//  Created by chinghoi on 2018/6/28.
//  Copyright © 2018年 chinghoi. All rights reserved.
//

import UIKit
import Eureka

class VisaDetailsVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
    }
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if section == 0 {
            let header = view as? UITableViewHeaderFooterView
            header?.textLabel?.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }

}
