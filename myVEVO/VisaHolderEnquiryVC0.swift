//
//  BarcodeVC.swift
//  myVEVO
//
//  Created by chinghoi on 2018/6/29.
//  Copyright © 2018年 chinghoi. All rights reserved.
//

import UIKit

@available(iOS 10.0, *)
class VisaHolderEnquiryVC0: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func Submit(_ sender: UIButton) {
        
        //注册关闭 PickerView 通知
        NotificationCenter.default.post(name: NSNotification.Name("off"), object: nil)

        if (definReferenceNumber == "0049251846283" || definReferenceNumber == "EGOF2BQE82") && definDocumentNumber == "EC5116279" && definDate == "06-20-1993" && countrySelected == "China"{
            let loadingView: LoadingView = LoadingView(frame: CGRect(x: self.view.frame.size.width/2-50, y: self.view.frame.size.height/2-50, width: 100, height: 100))
            loadingView.backgroundColor = #colorLiteral(red: 0.9019607843, green: 0.9019607843, blue: 0.9019607843, alpha: 0.4)//UIColor(displayP3Red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 0.4)
            let background = UIView()
            background.frame = self.view.frame
            background.backgroundColor = #colorLiteral(red: 0.003921568627, green: 0.003921568627, blue: 0.003921568627, alpha: 0.001)//UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 0.1)
            self.view.addSubview(loadingView)
            self.view.addSubview(background)
            DispatchQueue.main.asyncAfter(deadline: .now()+30, execute:
                {
                    let visaDetailsVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VisaDetails")
                    self.navigationController?.pushViewController(visaDetailsVC, animated: true)
                    loadingView.frame = CGRect(x: 700, y: 700, width: 7, height: 7)
                    background.frame = loadingView.frame
            })
            
        } else {
            
            let alertController = UIAlertController(title: "Incorrect information", message: "The information you input is incorrect", preferredStyle: .alert)
            let alerAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(alerAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
