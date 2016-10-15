//
//  ViewController.swift
//  Calculate-task
//
//  Created by Yu Ma on 6/16/16.
//  Copyright © 2016 Yu Ma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var bigC: UIButton!
    
    // create operandStack array，to momery two operation number
    var operandStack = Array<Double>()
    // weather user type all numbers
    var userIsInTheMiddleOfTypingANumber : Bool = false
    // rember operation symbel
    var remberTheMathematicalSign : String! = " "
    
    var TheTimeUserClickButton = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func appendDigit(sender: UIButton) {
        
        //conut the numbers in textfield
        let count = display.text!.characters.count
        
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            if count <= 9{
                display.text = display.text! + digit
            }
        }
        else{
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
        // set " C " for clear button
        bigC.setTitle("C", forState: UIControlState.Normal)
        
        
        
    }
    
    
    
    @IBAction func C(sender: AnyObject) {
        let Zero : String! = "0"
        display.text = Zero
        operandStack = Array<Double>(arrayLiteral: 0.0)
        userIsInTheMiddleOfTypingANumber = false
        bigC.setTitle("AC", forState: UIControlState.Normal)
        TheTimeUserClickButton = 1
    }
    
    
    
    //remberTheMathematicalSign add the typed value
    @IBAction func operate(sender: AnyObject) {
        remberTheMathematicalSign = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            userIsInTheMiddleOfTypingANumber = false
            operandStack.append(displayValue)
            
        }
        if TheTimeUserClickButton > 1 {
            switch remberTheMathematicalSign {
            case "×" : performOperation {$0 * $1}
            case "÷" : performOperation {$1 / $0}
            case "+" : performOperation {$0 + $1}
            case "−" : performOperation {$1 - $0}
            default:break
                
            }
        }
    }
    
    
    // operate the value in  operandStack
    @IBAction func equals(sender: UIButton) {
        if userIsInTheMiddleOfTypingANumber {
            userIsInTheMiddleOfTypingANumber = false
            operandStack.append(displayValue)
        }
        
        let counts = display.text!.characters.count
        if counts >= 10 {
            //display.text = (display.text! as NSString).substringToIndex(10)
            if userIsInTheMiddleOfTypingANumber {
                userIsInTheMiddleOfTypingANumber = false
                operandStack.append(displayValue)
            }
            switch remberTheMathematicalSign {
            case "×" : performOperation {$0 * $1}
            case "÷" : performOperation {$1 / $0}
            case "+" : performOperation {$0 + $1}
            case "−" : performOperation {$1 - $0}
            default:break
            }
            TheTimeUserClickButton = ++TheTimeUserClickButton
            
            
        }else{
            switch remberTheMathematicalSign {
            case "×" : performOperation {$0 * $1}
            case "÷" : performOperation {$1 / $0}
            case "+" : performOperation {$0 + $1}
            case "−" : performOperation {$1 - $0}
            default:break
            }
            TheTimeUserClickButton = ++TheTimeUserClickButton
            
        }
        // if the typed value large than 100000000000
        if Double(display.text!) > 100000000000 {
            //save the
            let count1 = display.text!.characters.count
            var theNumberOfZero = 1
           // need to split to two parts for calcutation
            for var i = 6; i < count1; ++i {
                theNumberOfZero *= 10
            }
           
            let OneToTen = (display.text! as NSString).substringToIndex(8)
            let x = Double(OneToTen)! / Double(theNumberOfZero)
            let Y = (String(x) as NSString).substringToIndex(8)
            display.text = String(Y) + "e\(count1-2)"
        }
        
        
        let count2 = display.text!.characters.count
        if count2 >= 11 {
            let OneToTen = (display.text! as NSString).substringToIndex(11)
            let OneToN = (display.text! as NSString).substringToIndex(9)
            let end11 = (OneToTen as NSString).substringFromIndex(10)
            var end10 = (OneToTen as NSString).substringFromIndex(9)

            if Int(end11) >= 5 {
                end10 = String(Int(end10)! + 1)
                display.text = OneToN + end10
            }
            
        }
        
    }
    
    
    func performOperation(operation : (Double,Double) -> Double ) {
        if operandStack.count >= 2{
            displayValue = operation(operandStack.removeLast(),operandStack.removeLast())
            userIsInTheMiddleOfTypingANumber = false
            operandStack.append(displayValue)
        }
    }
    
    var displayValue : Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
    
    
      
    @IBOutlet weak var landScapedisplay: UILabel!
    @IBOutlet weak var landScapebigC: UIButton!
    
    // create operandStack array，to momery two operation number
    var landScapeoperandStack = Array<Double>()
    // weather user type all numbers
    var landScapeuserIsInTheMiddleOfTypingANumber : Bool = false
    // rember operation symbel
    var landScaperemberTheMathematicalSign : String! = " "
    
    var landScapeTheTimeUserClickButton = 1
    
    
    
    
    @IBAction func landScapeappendDigit(sender: UIButton) {
        
        //conut the numbers in textfield
        let count = landScapedisplay.text!.characters.count
        
        let digit = sender.currentTitle!
        if landScapeuserIsInTheMiddleOfTypingANumber {
            if count <= 9{
                landScapedisplay.text = landScapedisplay.text! + digit
            }
        }
        else{
            landScapedisplay.text = digit
            landScapeuserIsInTheMiddleOfTypingANumber = true
        }
        // set " C " for clear button
        landScapebigC.setTitle("C", forState: UIControlState.Normal)
        
        
        
    }
    
    
    
    @IBAction func landScapeC(sender: AnyObject) {
        let Zero : String! = "0"
        landScapedisplay.text = Zero
        landScapeoperandStack = Array<Double>(arrayLiteral: 0.0)
        landScapeuserIsInTheMiddleOfTypingANumber = false
        landScapebigC.setTitle("AC", forState: UIControlState.Normal)
        landScapeTheTimeUserClickButton = 1
    }
    
    
    
    //remberTheMathematicalSign add the typed value
    @IBAction func landScapeoperate(sender: AnyObject) {
        landScaperemberTheMathematicalSign = sender.currentTitle!
        if landScapeuserIsInTheMiddleOfTypingANumber {
            landScapeuserIsInTheMiddleOfTypingANumber = false
            landScapeoperandStack.append(landScapedisplayValue)
            
        }
        if landScapeTheTimeUserClickButton > 1 {
            switch landScaperemberTheMathematicalSign {
            case "×" : landScapeperformOperation {$0 * $1}
            case "÷" : landScapeperformOperation {$1 / $0}
            case "+" : landScapeperformOperation {$0 + $1}
            case "−" : landScapeperformOperation {$1 - $0}
            default:break
                
            }
        }
    }
    
    
    // operate the value in  operandStack
    @IBAction func landScapeequals(sender: UIButton) {
        if landScapeuserIsInTheMiddleOfTypingANumber {
            landScapeuserIsInTheMiddleOfTypingANumber = false
            landScapeoperandStack.append(landScapedisplayValue)
        }
        
        let counts = landScapedisplay.text!.characters.count
        if counts >= 10 {
            //display.text = (display.text! as NSString).substringToIndex(10)
            if landScapeuserIsInTheMiddleOfTypingANumber {
                landScapeuserIsInTheMiddleOfTypingANumber = false
                landScapeoperandStack.append(landScapedisplayValue)
            }
            switch landScaperemberTheMathematicalSign {
            case "×" : landScapeperformOperation {$0 * $1}
            case "÷" : landScapeperformOperation {$1 / $0}
            case "+" : landScapeperformOperation {$0 + $1}
            case "−" : landScapeperformOperation {$1 - $0}
            default:break
            }
            landScapeTheTimeUserClickButton = ++landScapeTheTimeUserClickButton
            
            
        }else{
            switch landScaperemberTheMathematicalSign {
            case "×" : landScapeperformOperation {$0 * $1}
            case "÷" : landScapeperformOperation {$1 / $0}
            case "+" : landScapeperformOperation {$0 + $1}
            case "−" : landScapeperformOperation {$1 - $0}
            default:break
            }
            landScapeTheTimeUserClickButton = ++landScapeTheTimeUserClickButton
            
        }
        // if the typed value large than 100000000000
        if Double(landScapedisplay.text!) > 100000000000 {
            //save the
            let count1 = landScapedisplay.text!.characters.count
            var theNumberOfZero = 1
            // need to split to two parts for calcutation
            for var i = 6; i < count1; ++i {
                theNumberOfZero *= 10
            }
            
            let OneToTen = (landScapedisplay.text! as NSString).substringToIndex(8)
            let x = Double(OneToTen)! / Double(theNumberOfZero)
            let Y = (String(x) as NSString).substringToIndex(8)
            landScapedisplay.text = String(Y) + "e\(count1-2)"
        }
        
        
        let count2 = landScapedisplay.text!.characters.count
        if count2 >= 11 {
            let OneToTen = (landScapedisplay.text! as NSString).substringToIndex(11)
            let OneToN = (landScapedisplay.text! as NSString).substringToIndex(9)
            let end11 = (OneToTen as NSString).substringFromIndex(10)
            var end10 = (OneToTen as NSString).substringFromIndex(9)
            
            if Int(end11) >= 5 {
                end10 = String(Int(end10)! + 1)
                landScapedisplay.text = OneToN + end10
            }
            
        }
        
    }
    
    func landScapeperformOperation(operation : (Double,Double) -> Double ) {
        if landScapeoperandStack.count >= 2{
            landScapedisplayValue = operation(landScapeoperandStack.removeLast(),landScapeoperandStack.removeLast())
            landScapeuserIsInTheMiddleOfTypingANumber = false
            landScapeoperandStack.append(landScapedisplayValue)
        }
    }
    
    
    var landScapedisplayValue : Double {
        get {
            return NSNumberFormatter().numberFromString(landScapedisplay.text!)!.doubleValue
        }
        set {
            landScapedisplay.text = "\(newValue)"
            landScapeuserIsInTheMiddleOfTypingANumber = false
        }
    }
    
    
}

