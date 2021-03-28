//
//  HooHacks
//
//  Created by Araad Shams on 2021-03-27.
//

import UIKit

class Compete : UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var pickerMins: UIPickerView!
    @IBOutlet weak var pickerKms: UIPickerView!
    @IBOutlet weak var pickerMeters: UIPickerView!
    @IBOutlet weak var buttonChooseFriend: RoundedButton!
    @IBOutlet weak var txtDistance: UILabel!
    @IBOutlet weak var txtTime: UILabel!
    
    
    var kilometers = 0
    var meters = 0
    var timeLimit = 0
    
    var friendName : String = ""

    var distancesKM = [String]()
    var distancesM = [String]()
    var times = [String]()
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //if going to signin screen, make sure it knows to do all necessary changes
        if segue.identifier == "chooseFriend" {
            if let nextViewController = segue.destination as? chooseFriend {
                    nextViewController.otherVC = self
            }
        }
        
        if segue.identifier == "waitingForOpponent" {
            if let nextViewController = segue.destination as? WaitingForOpponent {
                    nextViewController.kilometers = kilometers
                    nextViewController.meters = meters
                    nextViewController.timeLimit = timeLimit
                    nextViewController.friendName = friendName
            }
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadScreen()
        for i in 0...10000 {
            distancesKM.append(String(i) + "km")
            distancesM.append(String(i) + "m")
            times.append(String(i) + " min")
        }
        times[0] = "No Lim"
        pickerKms.delegate = self
        pickerMins.delegate = self
        pickerMeters.delegate = self
        
        pickerKms.dataSource = self
        pickerMins.dataSource = self
        pickerMeters.dataSource = self
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return times.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView == pickerMins){
            return times[row]
        }
        if(pickerView == pickerKms){
            return distancesKM[row]
        }
        if(pickerView == pickerMeters){
            return distancesM[row]
        }
        return ""
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
        
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView == pickerMins){
            timeLimit = row
        }
        if(pickerView == pickerKms){
            kilometers = row
        }
        if(pickerView == pickerMeters){
            meters = row
        }
        reloadScreen()
        
    }
    
    func reloadScreen() {
        var displayDist = ""
        var displayTime = ""
        
        let hrs : Int = timeLimit/60
        let mins = timeLimit - hrs*60
        
        displayTime = String(hrs) + "h" + ((mins < 10) ? "0":"") + String(mins) + "m"
        if(hrs == 0) {
            displayTime = String(mins) + "mins"
        }
        if(hrs == 0 && mins == 0){
            displayTime = "∞ mins"
        }
        
        if(kilometers == 0){
            displayDist = String(meters) + "mtrs"
        }
        
        else {
            displayDist = String(kilometers) + "." + (String((meters/100))) + "km"
        }
        
        txtTime.text = displayTime
        txtDistance.text = displayDist
        
    }
    
    @IBAction func chooseFriend(_ sender: Any) {
        performSegue(withIdentifier: "chooseFriend", sender: self)
    }
    
    @IBAction func btnStart(_ sender: Any) {
        performSegue(withIdentifier: "waitingForOpponent", sender: self)
    }
    
    
    func friendChosen() {
        if(friendName == "") {
            buttonChooseFriend.setTitle("Tap to Choose A Friend", for: .normal)
        }
        else {
            buttonChooseFriend.setTitle("Friend: " + friendName, for: .normal)
        }
    }
    
    
}
