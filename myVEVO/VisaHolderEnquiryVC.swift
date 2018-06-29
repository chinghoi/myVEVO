//
//  Visa Holder Enquiry.swift
//  myVEVO
//
//  Created by chinghoi on 2018/6/28.
//  Copyright © 2018年 chinghoi. All rights reserved.
//

import UIKit
import Eureka

class VisaHolderEnquiryVC: FormViewController {
    
    var referenceNumber = ""
    var documentNumber = ""
    
    var dataArray = [String]()
    var filteredArray = [String]()
    var shouldShowSearchResults = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let item = UIBarButtonItem(title: "back", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = item
        
        //读取国家数据
        loadListOfCountries()

        
        form +++ Section("DOCUMENT TYPE")
            <<< LabelRow(){ row in
                row.title = "Passport, DFTTA or Titre de Voyage"
                //row.placeholder = "Enter text here"
            }
            +++ Section("REFERENCE NUMBER")
            <<< TextRow(){
                $0.placeholder = "Please enter Visa Grant Number or Transaction Reference Number(TRN)"
                }.onChange { row1 in
                    if row1.value != nil {
                        self.referenceNumber = row1.value!}}
            +++ Section("DATE OF BIRTH")
            <<< DateRow(){
                $0.title = "mm/dd/yyy"
                $0.value = Date(timeIntervalSinceReferenceDate: 0)
                print($0.value)
                }
            +++ Section("DOCUMENT DETAILS")
            <<< TextRow(){
                $0.placeholder = "Document Number"
                }.onChange { row2 in
                    if row2.value != nil {
                        self.documentNumber = row2.value!}}
            <<< PushRow<String>() {
                //加载国家数据
                $0.options = dataArray
                //$0.title = "Country Of Document"
                //$0.selectorTitle = "Choose an Country"
                $0.value = "Choose an Country"
                }.onPresent { from, to in
                    to.dismissOnSelection = false
                    to.dismissOnChange = false
        }
    }
    @IBAction func Submit(_ sender: UIButton) {

        let visaDetailsVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VisaDetails")
        
        navigationController?.pushViewController(visaDetailsVC, animated: true)
//        if (referenceNumber == "0049251846283" || referenceNumber == "EGOF2BQE82") && documentNumber == "EC5116279" {
//            let visaDetailsVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VisaDetails")
//            
//            navigationController?.pushViewController(visaDetailsVC, animated: true)
//        } else {
//            let alertController = UIAlertController(title: "Incorrect PIN", message: "You have incorrectly entered your Pin three times. For security purposes, your details have been cleated. Please set a new PIN and enter your details to perform an enquiry.", preferredStyle: .alert)
//            let alerAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
//            alertController.addAction(alerAction)
//            self.present(alertController, animated: true, completion: nil)
//        }
    }
    func loadListOfCountries() {
        // 得到国家列表文件的路径
        let pathToFile = Bundle.main.path(forResource: "countries", ofType: "txt")
        
        if let path = pathToFile {
            // 得到文件内容，加载到一个字符串中
            //(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: nil)!
            let countriesString = try! String(contentsOfFile: path, encoding: String.Encoding.utf8)
            
            // 通过换行符分割，得到国家列表，存到数组中
            dataArray = countriesString.components(separatedBy: "\n")//countriesString.componentsSeparatedByString("\n")
            
            // 刷新tableView
            //tblSearchResults.reloadData()
        }
    }
    // 自定义value类型是Bool的Cell
    // Cell是使用 .xib 定义的，所以我们可以直接设置outlets
    public class CustomCell: Cell<Bool>, CellType {
        @IBOutlet weak var switchControl: UISwitch!
        @IBOutlet weak var label: UILabel!
        
        public override func setup() {
            super.setup()
            switchControl.addTarget(self, action: #selector(CustomCell.switchValueChanged), for: .valueChanged)
        }
        
        @objc func switchValueChanged(){
            row.value = switchControl.isOn
            row.updateCell() // Re-draws the cell which calls 'update' bellow
        }
        
        public override func update() {
            super.update()
            backgroundColor = (row.value ?? false) ? .white : .black
        }
    }
    
    // 自定义的Row，拥有CustomCell和对应的value
    public final class CustomRow: Row<CustomCell>, RowType {
        required public init(tag: String?) {
            super.init(tag: tag)
            // 我们把对应CustomCell的 .xib 加载到cellProvidor
            cellProvider = CellProvider<CustomCell>(nibName: "DateCell")
        }
    }    
}
//class DateCell: ListCheckCell<Date> {}
