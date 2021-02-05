//
//  ViewController.swift
//  Calculator
//
//  Created by Amina Moldamyrza on 2/4/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var myDisplay: UILabel!
    var typing: Bool = false
    var dot: Bool = true
    @IBAction func digitPressed(_ sender: UIButton) {
        let current_digit = sender.currentTitle!
        let current_display = myDisplay.text!
        if current_digit == "."{
            if dot{
                myDisplay.text = current_display + current_digit
                dot = false
            }
        }
        else{
            if typing{
                myDisplay.text = current_display + current_digit
            }else{
                myDisplay.text = current_digit
                dot = true
                typing = true
            }
        }
    }
    
    var displayValue: Double{
        get{
            return Double(myDisplay.text!)!
        }
        set{
            myDisplay.text = String(newValue)
        }
    }
    
    private var calculatorModel = CalculatorModel()
    @IBAction func operationPressed(_ sender: UIButton) {
        calculatorModel.setOperand(displayValue)
        calculatorModel.performOperation(sender.currentTitle!)
        displayValue = calculatorModel.result!
        typing = false
    }
}

