import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func changeToJDTapped(_ sender: Any) {
        titleLabel.text = "JenkinsDemo"
        updateAccessibilityValues()
    }
    
    @IBAction func changeToMGTapped(_ sender: Any) {
        titleLabel.text = "Matt Glover"
        updateAccessibilityValues()
    }
    
    private func updateAccessibilityValues() {
        titleLabel.accessibilityValue = titleLabel.text
    }
}

