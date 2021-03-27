
import UIKit

class Career : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var Career: UITableView!
    
    var names = ["Abed Nadir", "Merryl Cherry", "Nathan Peng", "Promet Hornet", "Sarah Simons", "Jason Xiao"]
    var scores = ["0.75", "4.64", "1.42", "1.00", "6.00", "1.91"]
    var types = ["Lost - 1km", "Lost - 5km", "Lost - 2km", "Won - 1km", "Won - 6km", "Lost - 2km"]
    var times = ["1:48", "8:02", "2:37", "2:15", "11:43", "3:21"]
    var dates = ["Mar. 28 2021", "Mar. 27 2021", "Mar. 27 2021","Mar. 27 2021","Mar. 27 2021","Mar. 27 2021"]
    var victory = [false, false, false, true, true, false]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Career.dataSource = self
        Career.delegate = self
        Career.register(UINib(nibName: "CareerCell", bundle: nil), forCellReuseIdentifier: "CareerCell")

    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CareerCell", for: indexPath) as! CareerCell
        
        cell.Name.text! = names[indexPath.row]
        cell.Score.text! = scores[indexPath.row]
        cell.ExType.text! = types[indexPath.row]
        cell.Time.text! = times[indexPath.row]
        cell.Date.text! = dates[indexPath.row]
        if(victory[indexPath.row]) {
//            cell.Score.textColor = UIColor(red: 0.65098, green: 0.90588, blue: 0.69803, alpha: 1)
            cell.Score.textColor = UIColor.systemGreen
            cell.unitLabel.textColor = UIColor.systemGreen
            
        }
        else {
//            cell.Score.textColor = UIColor(red: 0.85490, green: 0.49020, blue: 0.45098, alpha: 1)
            cell.Score.textColor = UIColor.systemRed
            cell.unitLabel.textColor = UIColor.systemRed

        }

        return cell
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }
    
    
}
