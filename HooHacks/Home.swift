//
//  HooHacks
//
//  Created by Araad Shams on 2021-03-27.
//

import UIKit

class Home : UIViewController {
    var circularView: CircularProgressView!

    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        circularView = CircularProgressView(frame: containerView.frame)
        circularView.center = containerView.center
        containerView.addSubview(circularView)
        let duration = 1    //Play with whatever value you want :]
        circularView.progressAnimation(duration: TimeInterval(duration))
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
    }
    

}
