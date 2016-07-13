//
//  ViewController.swift
//  TipCalculator
//
//  Created by Wu, Weng-Feng on 2016/7/12.
//  Copyright © 2016年 Wu, Weng-Feng. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate{
    
    
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var personSlider: UISlider!
    @IBOutlet weak var finalValueLabel: UILabel!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var personLabel: UILabel!
    
    var tipValue:Int = 0
    var taxValue:Int = 0
    var personValue:Int = 1
//    var finalValue:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        amountTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func silderValueChange(_ sender: UISlider) {
        
        
        switch sender {
        case tipSlider:
//            print("tip value change = \(Float(tipSlider.value))")
//            print("value ===== \(roundf(tipSlider.value))")
//            tipValue = Int(round(tipSlider.value))
            tipLabel.text = "\(lroundf(tipSlider.value))%"
        case personSlider:
//            print("person value change")
//            personValue = Int(round(personSlider.value))
            personLabel.text = "\(lroundf(personSlider.value))"
        default:
            print("nothing")
        }
        
        finalPriceCompute()
        
    }
    
    func finalPriceCompute() {
        if let price = amountTextField.text {
            let finalPrice = Int((Double(price)! + (Double(price)! * (Double(lroundf(tipSlider.value)) / 100))) / (Double(lroundf(personSlider.value))))
            finalValueLabel.text = "NT$\((finalPrice))"
        }

    }
    @IBAction func amountValueChange(_ sender: UITextField) {
        finalPriceCompute()
    }
    
    
    // 設定delegate 為self後，可以自行增加delegate protocol
    // 開始進入編輯狀態
    func textFieldDidBeginEditing(_ textField: UITextField){
//        print("textFieldDidBeginEditing:" + textField.text)
    }
    
    // 可能進入結束編輯狀態
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        print("textFieldShouldEndEditing:" + textField.text)
        
        return true
    }
    
    // 結束編輯狀態(意指完成輸入或離開焦點)
    func textFieldDidEndEditing(_ textField: UITextField) {
//        print("textFieldDidEndEditing:" + textField.text)
    }
    
    // 按下Return後會反應的事件
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //利用此方式讓按下Return後會Toogle 鍵盤讓它消失
        textField.resignFirstResponder()
        print("按下Return")
        return false
    }

    @IBAction func backgroundTap(_ sender: UIControl) {
        amountTextField.resignFirstResponder() // number label
    }



}

