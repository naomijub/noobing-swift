import UIKit

class AddProjectViewController: UIViewController {

    var delegate: ProjectsTableViewController?
    
    @IBOutlet var projectNameField: UITextField!
    var happinessSlider = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func happinessValue(_ slider: UISlider) {
        happinessSlider = Double(slider.value)
    }
    
    @IBAction func add() {
        let name = projectNameField.text ?? "Undefined"
        let project = Project(name: name, happines: happinessSlider)
        print(project.toString())
        
        if delegate == nil {
            return
        } else {
            delegate!.addProject(project: project)
        }
        
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        }
    }
}

