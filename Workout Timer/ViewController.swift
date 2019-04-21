//
//  ViewController.swift
//  Workout Timer
//
//  Created by user153727 on 4/20/19.
//  Copyright © 2019 Devvers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Outlets?
    
    private let dataSource = ["10", "20", "30", "40", "50", "60"]
    
    @IBOutlet weak var TimeLabel: UILabel!
    
    @IBOutlet weak var intervalLabel: UILabel!
    
    @IBOutlet weak var timerChangeButton: UIButton!
    
    @IBOutlet weak var intervalChangeButton: UIButton!
    
    @IBOutlet weak var startTimerButton: UIButton!
    
    @IBOutlet weak var choiceDoneButton: UIButton!
    
    @IBOutlet weak var timerPicker: UIDatePicker!
    
    @IBOutlet weak var intervalPicker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        intervalPicker.dataSource = self
        intervalPicker.delegate = self
        
    }
    
    //MARK: Actions
    
    
    
    
    /* function: timeChangeAction
     *
     *  Description: Allows user to start the process of setting the "Time" from date picker of selections. Generally will just cause different buttons to become hidden/non-hidden
     */
    @IBAction func timeChangeAction(_ sender: UIButton) {
        
        timerChangeButton.isHidden = true
        
        intervalChangeButton.isEnabled = false
        
        timerPicker.isHidden = false
        
        choiceDoneButton.isHidden = false
        
        
    }
    
    
    
    
    /* funciton: intervalChangeAction
     *
     * Description: Allows user to start the process of setting the intervals of the timer. Will just change hidden status of some buttons and datePicker.
     */
    @IBAction func intervalChangeAction(_ sender: UIButton) {
        
        intervalChangeButton.isHidden = true
        
        timerChangeButton.isEnabled = false
        
        choiceDoneButton.isHidden = false
        
        intervalPicker.isHidden = false
        
        
    }
    
    
    
    
    /* function: timeChangeActionFinish
     *
     * Description: Finishes the time choosing process. Will take selection from user's datepicker choice, then update the time label with the user's choice. Will change buttons and datePickers hidden status.
     */
    @IBAction func timeChangeActionFinish(_ sender: Any) {
        
        if(timerChangeButton.isHidden == true){
            let dateFormatter =  DateFormatter()
            dateFormatter.dateFormat = "hh:mm"
            let timeChosen = dateFormatter.string(from: timerPicker.date)
            TimeLabel.text = timeChosen
            
            timerPicker.isHidden = true
            
            choiceDoneButton.isHidden = true
            
            timerChangeButton.isHidden = false
            
            intervalChangeButton.isEnabled = true
            
            startTimerButton.isHidden = false
            
            
        }
        else{
            
            
            
        }
    }
}
    
    extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return dataSource.count
        }
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return dataSource[row]
        }
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            intervalLabel.text = dataSource[row]
        }
        
        
    }


