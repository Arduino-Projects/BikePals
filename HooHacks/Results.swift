//
//  HooHacks
//
//  Created by Araad Shams on 2021-03-27.
//

import UIKit

class Results : UIViewController {
    var score = 0.0
    var scoreOpp = 0.0
    
    var friendName = ""
    
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var lblScoreOpp: UILabel!
    @IBOutlet weak var lblFriendName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblScore.text = String(score) + "m"
        lblScoreOpp.text = String(scoreOpp) + "m"
        lblFriendName.text = friendName
        lblMessage.text = (score >= scoreOpp ? "Great Job!" : "Nice Try!")
    }
    
    @IBAction func goHomePressed(_ sender: Any) {
        performSegue(withIdentifier: "goHome", sender: self)
    }
    
}
