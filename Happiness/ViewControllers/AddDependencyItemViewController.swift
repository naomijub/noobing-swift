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
    }
    
    @IBAction func addDeps() {
        let newName = name!.text
        let newVersion = version!.text
        if let (name, version, del) = ifLets(t: newName, s: newVersion, u: delegate) {
            let newItem = Item(name, version)
            del.addItem(newItem)
        }
        
        if let nav = navigationController {
            nav.popViewController(animated: true)
        }
    }

}
