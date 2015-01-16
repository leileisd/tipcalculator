//
//  ViewController.swift
//  tips
//
//  Created by Lei Lei on 1/5/15.
//  Copyright (c) 2015 Lei Lei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var scSwitch: UISwitch!
    let tipPercentages = [0.18, 0.2, 0.22]
    let extraPercentages = [0, 0.05, 0.1]
    let nf = NSNumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.grayColor()
        totalLabel.text="$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onServiceCharge(sender: AnyObject) {
        nf.numberStyle = .PercentStyle
        if scSwitch.on{
            for (var i=0; i<tipControl.numberOfSegments; i++)
            {
                tipControl.setTitle(nf.stringFromNumber(extraPercentages[i]), forSegmentAtIndex: i)
            }
        }
        else{
            for (var i=0; i<tipControl.numberOfSegments; i++)
            {
                tipControl.setTitle(nf.stringFromNumber(tipPercentages[i]), forSegmentAtIndex: i)
            }
        }
        onEditingChange(sender)
    }
    
    @IBAction func onEditingChange(sender: AnyObject) {
        
        var tipPrecentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        if scSwitch.on{
            tipPrecentage = extraPercentages[tipControl.selectedSegmentIndex]
        }
        else{
            tipPrecentage = tipPercentages[tipControl.selectedSegmentIndex]
        }
        
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPrecentage
        var total = billAmount + tip
        
        tipLabel.text="$\(tip)"
        totalLabel.text="$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

