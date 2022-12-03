//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Lucien George on 01/12/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var billRepository: BillRepository?

    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var splitPerPersonLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let billRepository = self.billRepository {
            splitPerPersonLabel.text = billRepository.calculateSplitPerPerson()
            informationLabel.text = billRepository.information()
        }
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
