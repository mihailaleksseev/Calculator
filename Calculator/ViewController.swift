//
//  ViewController.swift
//  Calculator
//
//  Created by Михаил Алексеев on 28/12/2018.
//  Copyright © 2018 Mikhail Aleksseev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numberFromScreen : Double = 0
    var firstNum : Double = 0
    var operation : Int = 0
    var signe : Bool = false
    
    @IBOutlet weak var result: UILabel!
    
    @IBAction func Digits(_ sender: UIButton) {
        
        if signe {
            result.text = String(sender.tag)
            signe = false
        } else {
            result.text = result.text! + String(sender.tag)
        }
        
        numberFromScreen = Double(result.text!)!
    }
    
    @IBAction func buttons(_ sender: UIButton)
    {
        if result.text != "" && sender.tag != 10 && sender.tag != 17{
            
            firstNum = Double(result.text!)!
            
            if sender.tag == 12 { //%
                result.text = "%"
            } else if sender.tag == 13 { //del
                result.text = "/"
            } else if sender.tag == 14 { //x
                result.text = "x"
            } else if sender.tag == 15 { //-
                result.text = "-"
            } else if sender.tag == 16 { //+
                result.text = "+"
            
            operation = sender.tag
            signe = true
                
            }
        } else if sender.tag == 17 { //=
            if operation == 12 {
                result.text = String (firstNum / numberFromScreen)
            } else if operation == 13 {
                result.text = String (firstNum / numberFromScreen)
            } else if operation == 14 {
                result.text = String (firstNum * numberFromScreen)
            } else if operation == 15 {
                result.text = String (firstNum - numberFromScreen)
            } else if operation == 16 {
                result.text = String (firstNum + numberFromScreen)
            }
        } else if sender.tag == 10 { //C
            result.text = ""
            firstNum = 0
            numberFromScreen = 0
            operation = 0
        } else if sender.tag == 11 { //+-
            result.text = result.text
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

