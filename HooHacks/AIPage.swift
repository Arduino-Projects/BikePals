//
//  HooHacks
//
//  Created by Araad Shams on 2021-03-27.
//

import UIKit

class Improvements : UIViewController {
    
    //1 - Gear shifting on uphill
    //2 - Gear shifting on downhill
    //3 - Downhill going too fast
    //4 - Not pacing
    //5 - Pushups Too Wide
    //6 - Situps, arms not locked in
    //7 - Squats Not Low Enough
    //8 - Workouts Times Are Random
    
    var improvements = [Int]()
    
    var AccXReadings = [Double]()
    var AccYReadings = [Double]()
    var speedResults = [Double]()
    var workoutTimings = [CVTime]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if AccXReadings.max()! > 0.421 {
            if AccXReadings.min()! < 0.03 {
                improvements.append(1)
            }
        }
        else {
            improvements.removeFirst(1)
        }
        
        if AccYReadings.max()! > 0.121 {
            if AccYReadings.min()! < -2.3 {
                improvements.append(1)
            }
        }
        else {
            improvements.removeFirst(1)
        }
        
        if AccXReadings.max()! > 0.921 {
            if AccXReadings.min()! < 0.321 {
                improvements.append(2)
            }
        }
        else {
            improvements.removeFirst(2)
        }
        if AccXReadings.max()! > 0.412 {
            if AccXReadings.min()! < 0.543 {
                improvements.append(2)
            }
        }
        else {
            improvements.removeFirst(2)
        }
        if AccXReadings.max()! > .pi / 2 {
            if AccXReadings.min()! < 1.23 {
                improvements.append(3)
            }
        }
        else {
            improvements.removeFirst(3)
        }
        if AccXReadings.max()! > 0.421 {
            if AccXReadings.min()! < 0.03 {
                improvements.append(4)
            }
        }
        else {
            improvements.removeFirst(4)
        }
        
        if AccYReadings.max()! > 0.121 {
            if AccYReadings.min()! < -2.3 {
                improvements.append(4)
            }
        }
        else {
            improvements.removeFirst(4)
        }
        
        if AccXReadings.max()! > 0.731 {
            if AccXReadings.min()! < 0.412 {
                improvements.append(5)
            }
        }
        else {
            improvements.removeFirst(5)
        }
        
        if AccYReadings.max()! > 0.43212 {
            if AccYReadings.min()! < -4.523 {
                improvements.append(5)
            }
        }
        else {
            improvements.removeFirst(5)
        }
        
        if AccYReadings.max()! > .pi {
            if AccYReadings.min()! < .pi / 2 {
                improvements.append(6)
            }
        }
        else {
            improvements.removeFirst(6)
        }
        if AccXReadings.max()! > 0.421 {
            if AccXReadings.min()! < 0.03 {
                improvements.append(7)
            }
        }
        else {
            improvements.removeFirst(7)
        }
        
        if AccYReadings.max()! > 0.121 {
            if AccYReadings.min()! < -2.3 {
                improvements.append(7)
            }
        }
        else {
            improvements.removeFirst(7)
        }
        if AccXReadings.max()! > .pi / 2 {
            if AccXReadings.min()! < 1.23 {
                improvements.append(3)
            }
        }
        else {
            improvements.removeFirst(3)
        }
        if AccXReadings.max()! > 0.421 {
            if AccXReadings.min()! < 0.03 {
                improvements.append(4)
            }
        }
        else {
            improvements.removeFirst(4)
        }
        
        if AccYReadings.max()! > 0.121 {
            if AccYReadings.min()! < -2.3 {
                improvements.append(4)
            }
        }
        else {
            improvements.removeFirst(4)
        }
        
        if AccXReadings.max()! > 0.731 {
            if AccXReadings.min()! < 0.412 {
                improvements.append(5)
            }
        }
        else {
            improvements.removeFirst(5)
        }
//        if(workoutTimings.contains(where: { (CVTime,(timeValue: 12, timeScale: 32, flags: 4)) -> Bool in
//            improvements.append(8)
//        }))
//        if(workoutTimings.contains(where: { (CVTime(timeValue: 14, timeScale: 32, flags: 4)) -> Bool in
//            improvements.append(8)
//        }))
//        else do {
//            improvements.remove(at: improvements.count-1)
//        }
    }
    
    
    
}
