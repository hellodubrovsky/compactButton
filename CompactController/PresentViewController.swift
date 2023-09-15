import UIKit

final class PresentViewController: UIViewController {

    private lazy var segmentControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["280pt","150pt"])
        control.selectedSegmentIndex = 0
        control.addTarget(self, action: #selector(self.segmentedValueChanged(_:)), for: .valueChanged)
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()

    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .close)
        button.backgroundColor = .lightGray
        button.tintColor = .systemBlue
        button.layer.cornerRadius = button.frame.width / 1.5
        button.layer.cornerCurve = .continuous
        button.layer.masksToBounds = true
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.preferredContentSize = CGSize(width: 300, height: 280)
        self.view.backgroundColor = .white
        self.view.addSubview(segmentControl)
        self.view.addSubview(closeButton)

        // Constraints
        NSLayoutConstraint.activate([
            segmentControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            closeButton.heightAnchor.constraint(equalToConstant: 20),
            closeButton.widthAnchor.constraint(equalTo: closeButton.heightAnchor, multiplier: 1),
            closeButton.centerYAnchor.constraint(equalTo: segmentControl.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    // MARK: Private methods

    @objc
    private func segmentedValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.preferredContentSize.height = 280
        case 1:
            self.preferredContentSize.height = 150
        default:
            fatalError()
        }
    }

    @objc
    private func closeButtonTapped() {
        dismiss(animated: true)
    }
}
