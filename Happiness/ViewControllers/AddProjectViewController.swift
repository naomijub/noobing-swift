import UIKit

class AddProjectViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let cellStyle = UITableViewCell.CellStyle.default;
    var delegate: AddProjectDelegate?
    var deps = [Item("serde"), Item("edn-rs"), Item("actix"), Item("brcode"), Item("uuid"),
                Item("rayon"), Item("num_cpus"), Item("log"), Item("chrono"), Item("ron"),
                Item("bytes")]
    
    @IBOutlet var happinessValue: UILabel!
    @IBOutlet var projectNameField: UITextField!
    var happinessSlider = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let newItemButton = UIBarButtonItem(
            title: "add new dependency",
            style: UIBarButtonItem.Style.plain,
            target: self,
            action: #selector(showAddNewDependency)
        )
        navigationItem.rightBarButtonItem = newItemButton
        happinessValue.text = "0.00"
    }

    @IBAction func happinessValue(_ slider: UISlider) {
        happinessSlider = Double(slider.value)
        let value = String(format: "%.2f", happinessSlider)
        happinessValue.text = value
    }
    
    @IBAction func add() {
        let items = deps.filter { (i) -> Bool in
            i.check
        }
        let name = projectNameField.text ?? "Undefined"
        let project = Project(name: name, happines: happinessSlider, deps: items)
        print(project.toString())
        
        if delegate == nil {
            return
        } else {
            delegate!.addProject(project)
        }
        
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        }
    }
    
    @objc func showAddNewDependency() {
        print("hello")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let dep = deps[row]
        
        let cell = UITableViewCell(style: cellStyle, reuseIdentifier: nil)
        
        cell.textLabel?.text = dep.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
    
        if cell == nil {
            return
        }
        
        if (cell!.accessoryType == UITableViewCell.AccessoryType.checkmark) {
            cell!.accessoryType = UITableViewCell.AccessoryType.none
        } else {
            cell!.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
        let row = indexPath.row
        let dep = deps[row]
        dep.markCheck()
    }
}

