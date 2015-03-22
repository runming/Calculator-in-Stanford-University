//
//  ViewController.swift
//  Calculator
//
//  Created by 华润明 on 15/3/22.
//  Copyright (c) 2015年 华润明. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var input = false
    
    @IBAction func Number(sender: UIButton) {
        let digit = sender.currentTitle!
        if input {
            display.text = display.text! + digit
        }
        else {
            display.text = digit
            input = true
        }
    }
    
    @IBAction func operation(sender: UIButton) {
        let operation = sender.currentTitle!
        if input {
            enter()
        }
        switch operation{
        case"+":extensionoperation{$1+$0}
        case"−":extensionoperation{$1-$0}
        case"×":extensionoperation{$1*$0}
        case"÷":extensionoperation{$1/$0}
        default:break
        }
    }
    
    func extensionoperation(operation:(Double,Double)->Double){
        if result.count >= 2 {
            displayValue = operation(result.removeLast(),result.removeLast())
            enter()
        }
    }
    
    var result = Array<Double>()
    
    @IBAction func enter() {
        input = false
        result.append(displayValue)
        println("result = \(result)")
    }
    
    var displayValue : Double{
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            input = false
        }
    }
    
    @IBAction func clear(sender: UIButton) {
        display.text = "0"
        return result = Array()
    }


}

