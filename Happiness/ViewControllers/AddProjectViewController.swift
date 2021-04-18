import UIKit

class AddProjectViewController: UIViewController, UITableViewDataSource {
    let cellStyle = UITableViewCell.CellStyle.default;
    var delegate: AddProjectDelegate?
    var deps = ["serde", "edn-rs", "actix", "brcode", "uuid", "rayon", "num_cpus", "log", "chrono", "ron", "bytes"]
    
    @IBOutlet var happinessValue: UILabel!
    @IBOutlet var projectNameField: UITextField!
    var happinessSlider = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        happinessValue.text = "0.00"
    }

    @IBAction func happinessValue(_ slider: UISlider) {
        happinessSlider = Double(slider.value)
        let value = String(format: "%.2f", happinessSlider)
        happinessValue.text = value
    }
    
    @IBAction func add() {
        let name = projectNameField.text ?? "Undefined"
        let project = Project(name: name, happines: happinessSlider)
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let dep = deps[row]
        
        let cell = UITableViewCell(style: cellStyle, reuseIdentifier: nil)
        
        cell.textLabel?.text = dep
        return cell
    }
}

