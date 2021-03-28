//
//  HooHacks
//
//  Created by Araad Shams on 2021-03-27.
//

import UIKit


class chooseFriend : UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tbvFriends: UITableView!
    var friends = ["Abed Nadir", "Arthur Mccabe", "Barry Simmons", "Beatrice Huang","Ben Schutz", "Bissy He","Daniyaal Farourqi", "Emily Sit", "Haoran Kwan", "Jason Xiao", "Kerrel White", "Merryl Cherry", "Nathan Peng", "Promethius Hornet", "Sarah Simons"]
    var friendsFLetters = ["A", "B",  "D",  "E",  "H",  "J",  "K",  "M",  "N",  "P",  "S"]
    
    var otherVC : Compete?
    
    var namesInSection = [2,4,1,1,1,1,1,1,1,1,1]

    override func viewDidLoad() {
        super.viewDidLoad()
        tbvFriends.delegate = self
        tbvFriends.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesInSection[section]
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChooseFriendCell", for: indexPath)
        
        var sumSections = 0;
        for i in stride(from: 0, to: indexPath.section, by: 1) {
            sumSections += tableView.numberOfRows(inSection: i);
        }

        cell.textLabel?.text = friends[sumSections + indexPath.row]
        
        return cell
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return namesInSection.count
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return friendsFLetters[section]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var sumSections = 0
        for i in stride(from: 0, to: indexPath.section, by: 1) {
            sumSections += tableView.numberOfRows(inSection: i);
        }

        print(friends[sumSections + indexPath.row])
        otherVC?.friendName = friends[sumSections + indexPath.row]
        otherVC?.friendChosen()
        dismiss(animated: true)
    }
    
}
