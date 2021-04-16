import UIKit

class AddProjectViewController: UIViewController {

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
        
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        }
    }
}

