
//
//  ViewController.swift
//  my_VEVO
//
//  Created by chinghoi on 2018/6/28.
//  Copyright © 2018年 chinghoi. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var inputPIN: UITextField!
    var PIN = ""
    var inputPINSucces = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        inputPIN.keyboardType = .numberPad
        inputPIN.becomeFirstResponder()
        //数值监听事件
        inputPIN.addTarget(self, action: #selector(isPINCountEqual4), for: .editingChanged)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        let alertController = UIAlertController(title: "Welcome to myVEVO\n", message: "myVEVO allows a visa holder to view and wmail their visa details.\n \n A PIN is required to secure the personal details used to find the visa record. \n \n  The PIN must be entered each time myVEVO is accessed. \n \n Your personal details can be cleared from this device by entering the PIN incorrectly three times.", preferredStyle: .alert)
        let alerAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(alerAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    //判断输入位数
    @objc func isPINCountEqual4() {
        if inputPIN.text?.count == 4 && inputPINSucces == false {
            PIN = inputPIN.text!
            inputPIN.text = ""
            inputPINSucces = true
        } else if inputPIN.text?.count == 4 && inputPINSucces == true {
            if PIN == inputPIN.text {
                performSegue(withIdentifier: "a", sender: nil)
                inputPINSucces = false
            } else {
                inputPINSucces = false
                inputPIN.text = ""
                let alertController = UIAlertController(title: "Incorrect PIN", message: "You have incorrectly entered your Pin three times. For security purposes, your details have been cleated. Please set a new PIN and enter your details to perform an enquiry.", preferredStyle: .alert)
                let alerAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alertController.addAction(alerAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
}

