//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class BillViewController: UIViewController {

    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitLabel: UILabel!
    let backgrounColor: UIColor = UIColor(red: 2, green: 176, blue: 107, alpha: 1)
    var selectedButton: UIButton!
    var billRepository: BillRepository = BillRepository()

    override func viewDidLoad() {
        super.viewDidLoad()

        selectedButton = tenPctButton
        billRepository.setTip(buttonText: (tenPctButton.titleLabel?.text)!)
        billRepository.setSplit(value: Float(stepper.value))
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        selectedButton.isSelected = false
        sender.isSelected = true
        selectedButton = sender
        billRepository.setTip(buttonText: (sender.titleLabel?.text)!)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitLabel.text = String(Int(sender.value))
        billRepository.setSplit(value: Float(sender.value))
    }

    @IBAction func totalAmountEntered(_ sender: UITextField) {
        billRepository.setTotalAmount(value: NSString(string: billTextField.text!).floatValue)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.billRepository = billRepository
        }
    }
}

