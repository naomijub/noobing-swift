import Foundation

class Item {
    var name: String
    var check: Bool

    init(_ name: String) {
        self.name = name
        self.check = false
    }
    
    func markCheck() {
        check = !check
    }
}
