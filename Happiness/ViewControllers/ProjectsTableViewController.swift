import UIKit

class ProjectsTableViewController: UITableViewController {
    var projectList = [Project(name: "WooriDB", happines: 5.0)];
    let cellStyle = UITableViewCell.CellStyle.default;

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "addProject") {
            let view = segue.destination as! AddProjectViewController
            view.delegate = self
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projectList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let project = projectList[row]
    
        let cell = UITableViewCell(style: cellStyle, reuseIdentifier: nil)
        
        cell.textLabel?.text = project.name
        return cell
    }
    
    func addProject(project: Project) {
        projectList.append(project)
        tableView.reloadData()
    }
}
