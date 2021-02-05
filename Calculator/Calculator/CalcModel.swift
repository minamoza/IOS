//
//  CalcModel.swift
//  Calculator
//
//  Created by Amina Moldamyrza on 2/4/21.
//

import Foundation

enum Operation{
    case constant(Double)
    case unaryOperation((Double)->Double)
    case binaryOperatin((Double, Double)->Double)
    case equals
    case clear
}

func addition(op1: Double, op2: Double)-> Double{
    return op1 + op2
}

func subtraction(op1: Double, op2: Double)->Double{
    return op1 - op2
}

func reverse(op1: Double)->Double{
    return op1 * (-1)
}

func multiplication(op1: Double, op2: Double)->Double{
    return op1 * op2
}

func division(op1: Double, op2: Double)->Double{
    return op1/op2
}

func percent(op1: Double)->Double{
    let op = saving?.firstOperand
    if(op != nil){
        return op! * (op1/100)
    }else{
        return op1/100
    }
}

private var saving: SaveFirstOperandAndOperation?
struct SaveFirstOperandAndOperation {
    var firstOperand: Double
    var operation: (Double, Double) -> Double
    
    func performOperationWith(secondOperand op2: Double)->Double{
        return operation(firstOperand, op2)
    }
}

struct CalculatorModel {
    var my_operation: Dictionary<String, Operation> =
    [
        "π": Operation.constant(Double.pi),
        "e": Operation.constant(M_E),
        "+": Operation.binaryOperatin(addition),
        "-": Operation.binaryOperatin(subtraction),
        "+/-": Operation.unaryOperation(reverse),
        "x": Operation.binaryOperatin(multiplication),
        "÷": Operation.binaryOperatin(division),
        "%": Operation.unaryOperation(percent),
        "AC": Operation.clear,
        "=": Operation.equals
    ]
    private var global_value: Double?
    
    mutating func setOperand(_ operand: Double){
        global_value = operand
    }
    
    var cont: Bool = false
    mutating func performOperation(_ operation: String){
        let symbol = my_operation[operation]!
        switch symbol {
        case .constant(let value):
            global_value = value
            
        case .unaryOperation(let function):
            global_value = function(global_value!)
            
        case .binaryOperatin(let function):
            if(cont){
                global_value = saving?.performOperationWith(secondOperand: global_value!)
            }else{
                cont = true
            }
            saving = SaveFirstOperandAndOperation(firstOperand: global_value!, operation: function)
            
        case .equals:
            if global_value != nil{
                global_value = saving?.performOperationWith(secondOperand: global_value!)
            }
            
        case .clear:
            saving?.firstOperand = 0
            global_value = 0
        }
    }
    
    var result: Double?{
        get{
            return global_value
        }
    }

}
