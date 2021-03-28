//
//  HooHacks
//
//  Created by Araad Shams on 2021-03-27.
//

import UIKit

class WaitingForOpponent : UIViewController {
    
    @IBOutlet weak var BigLabel: UILabel!
    @IBOutlet weak var Status: UIActivityIndicatorView!
    
    var countdown = 4
    var kilometers = 0
    var meters = 0
    var timeLimit = 0
    var friendName = ""
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //if going to signin screen, make sure it knows to do all necessary changes

        if segue.identifier == "mainScreen" {
            if let nextViewController = segue.destination as? InGame {
                    nextViewController.timeLimit = timeLimit
                    nextViewController.friendName = friendName
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: false)
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    
    @objc func fireTimer() {
        Status.alpha = 0
        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countdownTimer), userInfo: nil, repeats: true)
        
    }
    
    
    @objc func countdownTimer() {
        countdown -= 1
        if countdown == 0 {
            BigLabel.text = "Go!"
            performSegue(withIdentifier: "mainScreen", sender: self)
        }
        else {
            BigLabel.text = String(countdown)
        }
    }
    
}
