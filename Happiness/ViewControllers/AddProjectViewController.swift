import UIKit

class AddProjectViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddItemDelegate {
    let cellStyle = UITableViewCell.CellStyle.default;
    var delegate: AddProjectDelegate?
    var deps = [Item("serde", "1.0"), Item("edn-rs", "1.0"), Item("actix", "1.0"), Item("brcode", "1.0"), Item("uuid", "1.0"),
                Item("rayon", "1.0"), Item("num_cpus", "1.0"), Item("log", "1.0"), Item("chrono", "1.0"), Item("ron", "1.0"),
                Item("bytes", "1.0")]
    
    @IBOutlet var happinessValue: UILabel!
    @IBOutlet var projectNameField: UITextField!
    @IBOutlet var tableView: UITableView?
    
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
        
        if let del = delegate {
            del.addProject(project)
        }
        
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        }
    }
    
    func addItem(_ item: Item) {
        deps.append(item)
        if let tabView = tableView {
            tabView.reloadData()
        }
    }
    
    @objc func showAddNewDependency() {
        let newDeps = AddDependencyItemViewController(delegate: self)
        if let nav = navigationController {
            nav.pushViewController(newDeps, animated: true)
        }
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
    
        if let c = cell {
            if (c.accessoryType == UITableViewCell.AccessoryType.checkmark) {
                c.accessoryType = UITableViewCell.AccessoryType.none
            } else {
                c.accessoryType = UITableViewCell.AccessoryType.checkmark
            }
            let row = indexPath.row
            let dep = deps[row]
            dep.markCheck()
        }
    }
}

