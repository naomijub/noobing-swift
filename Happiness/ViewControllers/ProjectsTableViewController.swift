import UIKit

class ProjectsTableViewController: UITableViewController {
    let cocorobo = [Project(name: "WooriDB", happines: 5.0)];
    let cellStyle = UITableViewCell.CellStyle.default;

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cocorobo.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let project = cocorobo[row]
    
        let cell = UITableViewCell(style: cellStyle, reuseIdentifier: nil)
        
        cell.textLabel?.text = project.name
        return cell
    }

}