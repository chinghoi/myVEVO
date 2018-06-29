//
//  VisaHolderEnquiryTableVC.swift
//  myVEVO
//
//  Created by chinghoi on 2018/6/29.
//  Copyright © 2018年 chinghoi. All rights reserved.
//

import UIKit

var definReferenceNumber = ""
var definDocumentNumber = ""
var definDate = ""



class VisaHolderEnquiryTableVC: UITableViewController {
    
    @IBOutlet weak var referenceNumber: UITextField!
    @IBOutlet weak var documentNumber: UITextField!
    @IBOutlet weak var date: UITextField!
    @IBOutlet weak var countryOfDocument: UILabel!
    
    let NwDatePicker = UIDatePicker.init()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //数值监听事件
        referenceNumber.addTarget(self, action: #selector(isRight0), for: .editingChanged)
        referenceNumber.addTarget(self, action: #selector(offDate0), for: .editingDidBegin)
        documentNumber.addTarget(self, action: #selector(isRight1), for: .editingChanged)
        documentNumber.addTarget(self, action: #selector(offDate1), for: .editingDidBegin)
        referenceNumber.clearButtonMode = .whileEditing
        documentNumber.clearButtonMode = .whileEditing
        

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(off),
                                               name: NSNotification.Name("off"),
                                               object: nil)
        
        
        /**
         设置大小
         */
        NwDatePicker.frame = CGRect.init(x: 0, y: UIScreen.main.bounds.height - 280, width: UIScreen.main.bounds.width, height: 280)
        
        /**
         设置轮廓
         */
        //        NwDatePicker.layer.borderWidth = 1
        //        NwDatePicker.layer.borderColor = UIColor.gray.cgColor
        NwDatePicker.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        /**
         显示的日期的形式
         */
        NwDatePicker.datePickerMode = .date
        
        view.addSubview(NwDatePicker)
        
        NwDatePicker.isHidden = true
        /**
         监控其值的变化
         */
        NwDatePicker.addTarget(self, action: #selector(chooseDate( _:)), for:UIControlEvents.valueChanged)
    }

    /**
     获取选择的时间
     */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        if countrySelected != "" {
            countryOfDocument.text = countrySelected
            countryOfDocument.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
    
    @objc func off(){
        NwDatePicker.isHidden = true
    }
    
    @objc func chooseDate(_ datePicker:UIDatePicker) {
        let  chooseDate = datePicker.date
        let  dateFormater = DateFormatter.init()
        dateFormater.dateFormat = "MM-dd-YYYY"
        print(dateFormater.string(from: chooseDate))
        definDate = dateFormater.string(from: chooseDate)
        date.text = dateFormater.string(from: chooseDate)
    }
    @objc func offDate0() {
        NwDatePicker.isHidden = true
    }
    @objc func offDate1() {
        NwDatePicker.isHidden = true
    }
    @IBAction func creatData(_ sender: UIButton) {
        referenceNumber.resignFirstResponder()
        documentNumber.resignFirstResponder()
        
        NwDatePicker.isHidden = false
        
    }
    
    @objc func isRight0() {
        NwDatePicker.isHidden = true
        if referenceNumber.text != nil {
            definReferenceNumber = referenceNumber.text!
        }
    }
    @objc func isRight1() {
        NwDatePicker.isHidden = true
        if documentNumber.text != nil {
            definDocumentNumber = documentNumber.text!
        }
    }
    @IBAction func cheoseCountry(_ sender: UIButton) {
        NwDatePicker.isHidden = true
        documentNumber.resignFirstResponder()
        referenceNumber.resignFirstResponder()
        let countryListVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CountryListVC")
        navigationController?.pushViewController(countryListVC, animated: true)
        
    }
    
    @IBAction func infoBtn(_ sender: UIButton) {
        NwDatePicker.isHidden = true
        let alertController = UIAlertController(title: "Reference Number\n", message: "The Visa Grant Number can be found on your visa grant notification.\n \n The Transaction Reference Number can be found in your ImmiAccount and on any correspondence from the department.", preferredStyle: .alert)
        let alerAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(alerAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
