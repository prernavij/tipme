//
//  ViewController.swift
//  tipme
//
//  Created by Prerna Vij on 9/23/16.
//  Copyright (c) 2016 Prerna Vij. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func billIn(sender: AnyObject) {
        calculateTip()
    }
    
    @IBOutlet weak var tipLabel: UITextField!
    @IBOutlet weak var totalLabel: UITextField!
    @IBOutlet weak var billLabel: UITextField!
    @IBOutlet weak var billValue: UITextField!
    
    func getTip() -> Double {
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipValue = defaults.doubleForKey("tipValueKey")
        return tipValue
    }
    
    func calculateTip() {
        let tipValue = getTip()
        let bill:Double = (billLabel.text! as NSString).doubleValue
        let tip:Double = tipValue*bill
        let total:Double = bill + tip
        
        tipLabel.text = String(format: "%.2f",tip)
        totalLabel.text = String(format: "%.2f",total)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(handleTipSaved(_:)), name:"tipSaved", object: nil)
        
        self.tipLabel.enabled = false
        self.totalLabel.enabled = false

        if(getTip() != -1){
            calculateTip();
        }
    }
    
    func handleTipSaved(notification: NSNotification){
        if(getTip() != -1){
            calculateTip();
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true);
    }

}

