//
//  ViewController.swift
//  tipme
//
//  Created by Prerna Vij on 9/23/16.
//  Copyright (c) 2016 Prerna Vij. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UITextField!
    @IBOutlet weak var totalLabel: UITextField!
    @IBOutlet weak var billLabel: UITextField!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    @IBOutlet weak var billValue: UITextField!
    @IBOutlet weak var customTipField: UITextField!
    
    
    @IBAction func customTipSet(sender: AnyObject) {
        var tipValue = (customTipField.text as NSString).doubleValue / 100
        calculateTip(tipValue)
    }
    
    @IBAction func tipSelected(sender: AnyObject) {
        
        let tipOptions = [0.18, 0.2, 0.25]
        var tipValue:Double
        customTipField.hidden = true;
        customTipField.enabled = false;
        
        if (tipSelector.selectedSegmentIndex == 3) {
            customTipField.hidden = false;
            customTipField.enabled = true;
            tipValue = (customTipField.text as NSString).doubleValue / 100
        }
        else
        {
            tipValue = tipOptions[tipSelector.selectedSegmentIndex]
        }
        
        calculateTip(tipValue)
    }
    
    
    func calculateTip(tipValue:Double) {
        print (tipValue)
        let bill:Double = (billLabel.text as NSString).doubleValue
        let tip:Double = tipValue*bill
        let total:Double = bill + tip
        tipLabel.text = String(format: "%.2f",tip)
        totalLabel.text = String(format: "%.2f",total)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        customTipField.hidden = true;
        tipSelector.selectedSegmentIndex = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true);
    }

}

