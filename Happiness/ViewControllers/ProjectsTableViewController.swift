import UIKit

class ProjectsTableViewController: UITableViewController, AddProjectDelegate {
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
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(showProjectDetails))
        cell.addGestureRecognizer(longPress)
        return cell
    }
    
    func addProject(_ project: Project) {
        projectList.append(project)
        tableView.reloadData()
    }
    
    @objc func showProjectDetails(recognizer: UILongPressGestureRecognizer) {
        if recognizer.state == UILongPressGestureRecognizer.State.began {
            let cell = recognizer.view as! UITableViewCell
            let indexPath = tableView?.indexPath(for: cell)
            if indexPath == nil { return }
            let row = indexPath!.row
            let item = projectList[row]
            
            let details = UIAlertController(title: item.name, message: item.details(), preferredStyle: UIAlertController.Style.alert)
            let ok = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            details.addAction(ok)
            present(details, animated: true, completion: nil)
        }
    }
}
