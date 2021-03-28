//
//  HooHacks
//
//  Created by Araad Shams on 2021-03-27.
//
import UIKit
import CoreBluetooth

class InGame : UIViewController, CBPeripheralDelegate {
    
    @IBOutlet weak var player1Dist: UILabel!
    @IBOutlet weak var player2Dist: UILabel!
    @IBOutlet weak var oppName: UILabel!
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var speed: UILabel!
    @IBOutlet weak var BPM: UILabel!
    @IBOutlet weak var elevation: UILabel!
    
    var friendName =  ""
    var timeLimit = 0
    var distanceMain = 0.0
    
    var distanceOpp = 0
    
    
    
    
    
    override func viewDidLoad() {
        ViewController.peripheral.delegate = self
        timeLimit = timeLimit*60
        
        oppName.text = friendName
        
        _ = Timer.scheduledTimer(timeInterval: 2.7, target: self, selector: #selector(updateBPM), userInfo: nil, repeats: true)
        
        _ = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(updateOpp), userInfo: nil, repeats: true)
        
        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
        _ = Timer.scheduledTimer(timeInterval: 1.7, target: self, selector: #selector(updateAngle), userInfo: nil, repeats: true)
        
        let data = Data("G".utf8)
        ViewController.peripheral.writeValue(data, for: ViewController.characteristic, type: .withoutResponse)
    }
    
    @IBAction func Forefit(_ sender: Any) {
        let data = Data("F".utf8)
        ViewController.peripheral.writeValue(data, for: ViewController.characteristic, type: .withoutResponse)
        performSegue(withIdentifier: "results", sender: self)
    }
    
    
    @objc func updateTime() {
        timeLimit -= 1
        
        let numSecs = timeLimit%60
        let numMins = (timeLimit - numSecs)/60
        
        timer.text = String(numMins) + ":" + (numSecs < 10 ? "0":"") + String(numSecs)
    }
    
    @objc func updateBPM() {
        BPM.text = String(Int.random(in: 86...94)) + " BPM"
    }
    
    @objc func updateOpp() {
        distanceOpp += Int.random(in: 1...4)
        player2Dist.text = String(distanceOpp) + "m"
    }
    
    @objc func updateAngle() {
        let angle = Int.random(in: 0...2)
        elevation.text = String(angle) + "º uphill"
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic,
                    error: Error?) {
        var speedD = ""
        var distance = ""
        var ans = ""
        for val in characteristic.value! {
            let s = String(UnicodeScalar(UInt8(val)))
            if (s == "S") {
                speedD = ans
                ans = ""
            }
            else{
                ans += s
            }
        }
        distance = ans
        speedD = speedD.trimmingCharacters(in: .whitespacesAndNewlines)
        distance = distance.trimmingCharacters(in: .whitespacesAndNewlines)
        
        distanceMain += (Double(distance)!)/1000
        
        player1Dist.text = String(Int(distanceMain)) + "m"
        speed.text = speedD + " km/h"
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //if going to signin screen, make sure it knows to do all necessary changes
        if segue.identifier == "results" {
            if let nextViewController = segue.destination as? Results {
                    nextViewController.friendName = friendName
                    let y = Double(round(10*distanceMain)/10)
                    nextViewController.score = y
                    nextViewController.scoreOpp = Double(distanceOpp)
            }
        }
    }
  
    
    
    
}
