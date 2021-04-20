import Foundation

class Item {
    var name: String
    var version: String
    var check: Bool

    init(_ name: String, _ version: String) {
        self.name = name
        self.version = version
        self.check = false
    }
    
    func markCheck() {
        check = !check
    }
}
