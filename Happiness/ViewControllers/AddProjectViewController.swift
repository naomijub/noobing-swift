import UIKit

class AddProjectViewController: UIViewController {

    var delegate: AddProjectDelegate?
    
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
}

