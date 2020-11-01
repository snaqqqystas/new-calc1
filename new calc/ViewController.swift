//
//  ViewController.swift
//  new calc
//
//  Created by SNQMACPRO on 31.10.2020.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    var numFromScreen:Double = 0
    var firstNumber:Double = 0
    var secondNumber:Double = 0
    var mathOps:Bool = false
    var operation:Int = 0
    var doubleDot:Bool = false
    var equalOps:Bool = false
    private var pass = 1111
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var secretPassLabel: UILabel!
    

    @IBOutlet weak var hideButton: UIButton!
    
    @IBOutlet weak var nextLevel: UIButton!
    @IBOutlet weak var okButton: UIButton!
    
    @IBAction func goToNext(_ sender: UIButton) {
        nextLevel.isHidden = true
    }
    
    @IBAction func acceptButton(_ sender: UIButton) {
        numFromScreen = Double(result.text!)!
        pass = Int(numFromScreen)
        okButton.isHidden = true
        hideButton.isHidden = false
        secretPassLabel.isHidden = true
        result.text = ""
    }
    @IBOutlet weak var cButt: UIButton!
    
    @IBAction func zeroToNine(_ sender: UIButton) {
        if mathOps == true || equalOps == true {
            result.text = String(sender.tag)
            mathOps = false
            equalOps = false
        } else {
            result.text = result.text! + String(sender.tag)
            
        }
        numFromScreen = Double(result.text!)!
    }
    
    @IBAction func operations(_ sender: UIButton) {
        if result.text != "" && sender.tag != 10 && sender.tag != 17 && sender.tag != 11 && sender.tag != 12 && sender.tag != 18 {
            firstNumber = Double(result.text!)!
            if sender.tag == 13 { // delenie
                result.text = "/"
            }
            else if sender.tag == 14 { // umnowenie
                result.text = "*"
            }
            else if sender.tag == 16 { // plus
                result.text = "+"
            }
            else if sender.tag == 15 { // minus
                result.text = "-"
            }
            operation = sender.tag
            mathOps = true
        }
        else if sender.tag == 10 { // clear all button
            result.text = ""
            firstNumber = 0
            numFromScreen = 0
            mathOps = false
            operation = 0
            doubleDot = false
            equalOps = false
        }
        else if sender.tag == 17 { // equal button
            if numFromScreen == 1111 && pass == 1111 {
                result.text = ""
                secretPassLabel.isHidden = false
                okButton.isHidden = false
                hideButton.isHidden = true
              
                
            } else if numFromScreen != 1111 && numFromScreen == Double(pass) {
                result.text = ""
                nextLevel.isHidden = false
                
            } else {
            
            
                
            if operation == 13 {
                    if numFromScreen != 0 { result.text = String(firstNumber / numFromScreen)
                } else { result.text = "На ноль делить нельзя!"}
                
            }
            
            if operation == 14 {
                result.text = String(firstNumber * numFromScreen)
            }
            if operation == 16 {
                result.text = String(firstNumber + numFromScreen)
            }
            if operation == 15 {
                result.text = String(firstNumber - numFromScreen)
            }
            
          
//            lrint(Double(result.text?)?)
            //            result.text =
            doubleDot = true
            equalOps = true
            
        }
        }
        else if sender.tag == 11 { // symbol reverse
            numFromScreen = Double(result.text!)!
            result.text = String(numFromScreen * (-1))
            numFromScreen = Double(result.text!)!
            
        }
        else if sender.tag == 12 { // percent
            result.text = String(numFromScreen / 100)
            numFromScreen = Double(result.text!)!
            
        }
        else if sender.tag == 18 {
            if result.text != "" && doubleDot == false {
                result.text? += "."
                doubleDot = true
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        secretPassLabel?.isHidden = true
        okButton?.isHidden = true
        nextLevel?.isHidden = true
        let url = URL(string: "https://academy-pmtech.talentlms.com/user/courses/id:542")
        let request = URLRequest(url: url!)
        webView?.load(request)
       
    }
    
    func check(val:Double)->Int?{
        let rounded = val.rounded()
        return rounded == val ? Int(rounded) : nil
    }
    
}

