import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var colorPanelView: UIView!
    private var isRedOn = true
    private var isGreenOn = true
    private var isBlueOn = true

    override func viewDidLoad() {
        super.viewDidLoad()
        colorPanelView.layer.cornerRadius = 4.0
        updateAccessibilityValues()
    }
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        switch sender.tag {
        case 1:
            isRedOn = sender.isOn
        case 2:
            isGreenOn = sender.isOn
        case 3:
            isBlueOn = sender.isOn
        default:
            break
        }
        
        updateColorPanelView()
        updateAccessibilityValues()
    }
    
    private func updateColorPanelView() {
        let red: CGFloat = isRedOn ? 1.0 : 0.0
        let green: CGFloat = isGreenOn ? 1.0 : 0.0
        let blue: CGFloat = isBlueOn ? 1.0 : 0.0
        colorPanelView.backgroundColor = UIColor.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    private func updateAccessibilityValues() {
        var colorPanelColor = "White"
        if isRedOn && isGreenOn && isBlueOn { colorPanelColor = "White" }
        if isRedOn && !isGreenOn && !isBlueOn { colorPanelColor = "Red" }
        if !isRedOn && !isGreenOn && isBlueOn { colorPanelColor = "Blue" }
        if !isRedOn && isGreenOn && !isBlueOn { colorPanelColor = "Green" }
        if isRedOn && isGreenOn && !isBlueOn { colorPanelColor = "Yellow" }
        if !isRedOn && isGreenOn && isBlueOn { colorPanelColor = "Cyan" }
        if isRedOn && !isGreenOn && isBlueOn { colorPanelColor = "Pink" }
        if !isRedOn && !isGreenOn && !isBlueOn { colorPanelColor = "Black" }
        
        colorPanelView.accessibilityValue = colorPanelColor
    }
}
