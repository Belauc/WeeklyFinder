//
//  ViewController.swift
//  WeeklyFinder
//
//  Created by sergey on 27.06.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBAction func findDay(_ sender: UIButton) {
        
        guard let day = dateTextField.text, let month = monthTextField.text, let year = yearTextField.text else {
            return
        }
        // календарь
        let calendar = Calendar.current
        var dateComponent = DateComponents()
        dateComponent.day = Int(day)
        dateComponent.month = Int(month)
        dateComponent.year = Int(year)
        
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "EEEE"
        dateFormater.locale = Locale(identifier: "ru_RU")
        
        guard let date = calendar.date(from: dateComponent) else {
            return
        }
        
        let weakDay = dateFormater.string(from: date).capitalized
        
        resultLabel.text = weakDay
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

