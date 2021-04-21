import UIKit

class AddDependencyItemViewController: UIViewController {

    @IBOutlet var name: UITextField?
    @IBOutlet var version: UITextField?
    var delegate: AddItemDelegate?
    
    init(delegate: AddItemDelegate) {
        self.delegate = delegate
        super.init(nibName: "AddDependencyItemViewController", bundle: nil)
    }
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addDeps() {
        let newName = name!.text
        let newVersion = version!.text
        
        if newName == nil || newVersion == nil || delegate == nil { return }
        
        let newItem = Item(newName!, newVersion!)
        delegate!.addItem(newItem)
        
        if let nav = navigationController {
            nav.popViewController(animated: true)
        }
    }

}
