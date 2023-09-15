import UIKit

final class ViewController: UIViewController {

    private lazy var presentButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Present"
        configuration.baseForegroundColor = UIColor.white
        configuration.baseBackgroundColor = UIColor.systemBlue
        configuration.titleLineBreakMode = .byWordWrapping
        let button = UIButton(configuration: configuration)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(presentButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(presentButton)

        // Constraints
        presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        presentButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
    }

    // MARK: Private methods

    @objc
    private func presentButtonTapped() {
        let presentViewController = PresentViewController()
        presentViewController.modalPresentationStyle = .popover

        if let popoverPresentationController = presentViewController.popoverPresentationController {
            popoverPresentationController.permittedArrowDirections = .up
            popoverPresentationController.sourceView = self.view
            popoverPresentationController.sourceRect = presentButton.frame
            popoverPresentationController.delegate = self
            present(presentViewController, animated: true)
        }
    }
}


// MARK: - UIPopoverPresentationControllerDelegate

extension ViewController: UIPopoverPresentationControllerDelegate {

    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        .none
    }

    func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
        true
    }
}
