//
//  ViewController.swift
//  Happiness
//
//  Created by Julia Naomi Boeira on 08/04/21.
//

import UIKit

class AddProjectViewController: UIViewController {

    @IBOutlet var projectNameField: UITextField!;
    var happinessSlider = 0.0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func happinessValue(_ slider: UISlider) {
        happinessSlider = Double(slider.value)
    }
    
    @IBAction func add() {
        let name = projectNameField.text ?? "Undefined"
        let project = Project(name: name, happines: happinessSlider)
        print(project.toString())
    }
}

