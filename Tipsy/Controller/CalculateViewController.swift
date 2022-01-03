

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip: Float = 0.0
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        
        if sender.isSelected == true {
                sender.tintColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                sender.isSelected = false
            } else {
                zeroPctButton.isSelected = false
                twentyPctButton.isSelected = false
                tenPctButton.isSelected = false
                sender.tintColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1)
              
                sender.isSelected = true
            }

        
        let newstr = sender.currentTitle ?? "0%"
        let token = newstr.components(separatedBy: "%")
        tip = Float(token[0])! / 100.0
        
        //Hides keyboard after touching the tip buttons
        billTextField.endEditing(true)

    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let numberOfPersons = Float(splitNumberLabel.text!) ?? 2.0
        let total = Float(billTextField.text!) ?? 0.0
     
        
        
        calculatorBrain.calculateTotalperPerson(total: total, numberOfPersons: numberOfPersons, tip: tip)
        
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalPerPerson = calculatorBrain.getTotalPerPerson()
            destinationVC.settings = calculatorBrain.getSettings()
           
        }
        
    }
}

