//
//  CountryListVC.swift
//  myVEVO
//
//  Created by chinghoi on 2018/6/29.
//  Copyright © 2018年 chinghoi. All rights reserved.
//

import UIKit

var countrySelected = ""

class CountryListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    var dataArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        loadListOfCountries()
    }
    
    func loadListOfCountries() {
        // 得到国家列表文件的路径
        let pathToFile = Bundle.main.path(forResource: "countries", ofType: "txt")
        
        if let path = pathToFile {
            // 得到文件内容，加载到一个字符串中
            //(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: nil)!
            let countriesString = try! String(contentsOfFile: path, encoding: String.Encoding.utf8)
            
            // 通过换行符分割，得到国家列表，存到数组中
            dataArray = countriesString.components(separatedBy: "\n")

        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryList", for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let str = tableView.cellForRow(at: indexPath)?.textLabel?.text!
        countrySelected = str!
        navigationController?.popViewController(animated: true)
    }
}
