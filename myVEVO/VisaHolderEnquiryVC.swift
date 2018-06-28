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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let item = UIBarButtonItem(title: "back", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = item

        
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
            }
            +++ Section("DOCUMENT DETAILS")
            <<< TextRow(){
                $0.placeholder = "Document Number"
                }.onChange { row2 in
                    if row2.value != nil {
                        self.documentNumber = row2.value!}}
            <<< PushRow<String>() {
                $0.options = ["中国", "美国", "英国", "意大利", "德国", "叙利亚", "利比亚", "阿尔及利亚", "古巴", "埃及", "以色列", "越南", "泰国", "老挝", "加拿大", "巴西", "智力", "不丹", "沙特阿拉伯", "伊拉克", "南非", "蒙古", "韩国"]
                $0.title = "Country Of Document"
                $0.selectorTitle = "Choose an Country"
                }.onPresent { from, to in
                    to.dismissOnSelection = false
                    to.dismissOnChange = false
        }
    }
    @IBAction func Submit(_ sender: UIButton) {

        if (referenceNumber == "0049251846283" || referenceNumber == "EGOF2BQE82") && documentNumber == "EC5116279" {
            let visaDetailsVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VisaDetails")
            
            navigationController?.pushViewController(visaDetailsVC, animated: true)
        } else {
            let alertController = UIAlertController(title: "Incorrect PIN", message: "You have incorrectly entered your Pin three times. For security purposes, your details have been cleated. Please set a new PIN and enter your details to perform an enquiry.", preferredStyle: .alert)
            let alerAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(alerAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
}

