import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAvatarImageView()
        updateAccessibilityValues()
    }
    
    private func setupAvatarImageView() {
        let avatarImageSize = avatarImageView.bounds.size
        avatarImageView.layer.cornerRadius = avatarImageSize.width / 2
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.borderColor = UIColor.black.cgColor
        avatarImageView.layer.borderWidth = 2.0
    }
    
    @IBAction func editButtonTapped(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Change Name", message: nil, preferredStyle: .alert)
        alertController.addTextField(configurationHandler: { (textField) in
            textField.placeholder = "Enter New Name"
        })
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] (action: UIAlertAction) in
            let textField = alertController.textFields![0]
            self?.nameLabel.text = textField.text
            self?.updateAccessibilityValues()
        }))
        
        alertController.accessibilityLabel = "changeNameAlert"
        present(alertController, animated: true)
    }
    
    private func updateAccessibilityValues() {
        nameLabel.accessibilityValue = nameLabel.text
        locationLabel.accessibilityValue = locationLabel.text
    }
}
