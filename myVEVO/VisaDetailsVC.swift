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
    //修改第一个section 中title 的字体颜色
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if section == 0 {
            let header = view as? UITableViewHeaderFooterView
            header?.textLabel?.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }

}
