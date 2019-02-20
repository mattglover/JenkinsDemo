import UIKit

class HomeViewController: UIViewController {

    private var isOn = true
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTitle()
        updateAccessibilityValues()
    }
    
    @IBAction func toggleButtonTspped(_ sender: UIButton) {
        isOn.toggle()
        updateTitle()
        updateAccessibilityValues()
    }
    
    private func updateTitle() {
        titleLabel.text = isOn ? "ON" : "OFF"
        view.backgroundColor = isOn ? UIColor.init(named: "onColor") : UIColor.init(named: "offColor")
    }
    
    private func updateAccessibilityValues() {
        titleLabel.accessibilityValue = titleLabel.text
        view.accessibilityValue = titleLabel.text
    }
}
