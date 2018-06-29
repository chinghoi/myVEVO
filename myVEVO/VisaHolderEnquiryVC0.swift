//
//  BarcodeVC.swift
//  myVEVO
//
//  Created by chinghoi on 2018/6/29.
//  Copyright © 2018年 chinghoi. All rights reserved.
//

import UIKit

class VisaHolderEnquiryVC0: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func Submit(_ sender: UIButton) {
        
        //注册关闭 PickerView 通知
        NotificationCenter.default.post(name: NSNotification.Name("off"), object: nil)

        if (definReferenceNumber == "0049251846283" || definReferenceNumber == "EGOF2BQE82") && definDocumentNumber == "EC5116279" && definDate == "06-20-1993" && countrySelected == "Australia"{
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
