
import UIKit

struct CalculatorBrain {
    
    var totalPerPerson: Float = 0.0
    var settings: String = "0"
    mutating func calculateTotalperPerson(total: Float, numberOfPersons: Float, tip: Float) {
        totalPerPerson = total*(1+tip)/numberOfPersons
        settings = "Split between \(numberOfPersons), with \(tip*100)% tip."
    }
    
    func getTotalPerPerson() -> String {
        let totalPerPersonLabel = String(format: "%.2f", totalPerPerson)
        return totalPerPersonLabel
    }
    
    func getSettings() -> String {
        
        return settings 
    }
    
}
