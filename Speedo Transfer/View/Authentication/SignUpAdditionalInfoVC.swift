import UIKit

class SignUpAdditionalInfoVC: UIViewController, CountryPickerDelegate {

    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!

    var datePicker = UIDatePicker()
    var toolbar = UIToolbar()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupViews()
        setupCountryTextField()
        setupDatePicker()
    }

    private func setupCountryTextField() {
        let arrowImageView = UIImageView(image: UIImage(systemName: "chevron.down"))
        arrowImageView.tintColor = .gray
        arrowImageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        countryTextField.rightView = arrowImageView
        countryTextField.rightViewMode = .always

        // Show Bottom Sheet when tapping the country field or arrow
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showCountryPicker))
        countryTextField.addGestureRecognizer(tapGesture)
    }

    @objc private func showCountryPicker() {
        let countryPickerVC = CountryPickerVC()
        countryPickerVC.delegate = self

        // Present as a bottom sheet
        if let sheet = countryPickerVC.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
        }
        present(countryPickerVC, animated: true, completion: nil)
    }

    // MARK: - CountryPickerDelegate
    func didSelectCountry(country: String) {
        countryTextField.text = country
    }

    private func setupDatePicker() {
        datePicker.backgroundColor = .white
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.maximumDate = Calendar.current.date(byAdding: .year, value: -18, to: Date())
        dateOfBirthTextField.inputView = datePicker
        dateOfBirthTextField.inputAccessoryView = toolbar
        datePicker.addTarget(self, action: #selector(handleDateSelection), for: .valueChanged)

        let calendarIconView = UIImageView(image: UIImage(systemName: "calendar"))
        calendarIconView.tintColor = .gray
        calendarIconView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        dateOfBirthTextField.rightView = calendarIconView
        dateOfBirthTextField.rightViewMode = .always
    }

    @objc private func handleDateSelection() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        dateOfBirthTextField.text = formatter.string(from: datePicker.date)
    }
}
