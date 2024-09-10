import UIKit

class SignUpAdditionalInfoVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    
    // MARK: - Properties
    let countries = ["Egypt", "Palestine", "Syrian"]
    let countryFlags = ["eg", "pa", "sy"]
    
    var datePicker = UIDatePicker()
    var tableView = UITableView()
    var bottomSheetView = UIView()
    var grabberView = UIView()  // Grabber view for the bottom sheet
    
    var initialBottomSheetHeight: CGFloat = 300  // Initial bottom sheet height
    var maxBottomSheetHeight: CGFloat = 600  // Maximum height of the bottom sheet
    var minBottomSheetHeight: CGFloat = 150  // Minimum height of the bottom sheet
    
    private var presenter: SignUpPresenterProtocol!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = AuthenticationPresenter(view: self)
        
        setupNavigationBar()
        setupViews()
        setupDatePicker()
        setupCountryTextField()
        setupBottomSheet()  // Configure bottom sheet and table view
    }
    
    // MARK: - Action Methods
    @IBAction func continueBtnTapped(_ sender: UIButton) {
        self.presenter.tryRegister?(country: countryTextField.text, dateOfBirth: dateOfBirthTextField.text)
    }
    
    @IBAction func signInBtnTapped(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = SignInVC()
    }
    
    // MARK: - Setup Methods
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func setupViews() {
        UIColor.setupBackgroundColor(for: self.view, bottomColor: UIColor(hex: "FFC1C7"))
        UIColor.setupBackgroundColor(for: self.innerView, bottomColor: UIColor(hex: "FFC1C7"))
    }

    private func setupCountryTextField() {
        let arrowImageView = UIImageView(image: UIImage(systemName: "chevron.down"))
        arrowImageView.tintColor = .gray
        arrowImageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        countryTextField.rightView = arrowImageView
        countryTextField.rightViewMode = .always
        
        countryTextField.addTarget(self, action: #selector(showBottomSheet), for: .editingDidBegin)
    }
    
    private func setupDatePicker() {
        datePicker.backgroundColor = .white
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.maximumDate = Calendar.current.date(byAdding: .year, value: -18, to: Date())

        dateOfBirthTextField.inputView = datePicker
        
        datePicker.addTarget(self, action: #selector(handleDateSelection), for: .valueChanged)
        
        let calendarIconView = UIImageView(image: UIImage(systemName: "calendar"))
        calendarIconView.tintColor = .gray
        calendarIconView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        dateOfBirthTextField.rightView = calendarIconView
        dateOfBirthTextField.rightViewMode = .always
    }

    // MARK: - Bottom Sheet Setup
    private func setupBottomSheet() {
        bottomSheetView.frame = CGRect(x: 0, y: self.view.frame.height, width: self.view.frame.width, height: initialBottomSheetHeight)
        bottomSheetView.backgroundColor = .white
        bottomSheetView.layer.cornerRadius = 15

        grabberView.frame = CGRect(x: (self.view.frame.width - 60) / 2, y: 10, width: 60, height: 6)
        grabberView.backgroundColor = UIColor.lightGray
        grabberView.layer.cornerRadius = 3
        bottomSheetView.addSubview(grabberView)

        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        grabberView.addGestureRecognizer(panGesture)

        tableView.frame = CGRect(x: 0, y: 30, width: bottomSheetView.bounds.width, height: bottomSheetView.bounds.height - 30)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        bottomSheetView.addSubview(tableView)
        self.view.addSubview(bottomSheetView)
    }
    
    @objc private func showBottomSheet() {
        UIView.animate(withDuration: 0.3) {
            self.bottomSheetView.frame.origin.y = self.view.frame.height - self.initialBottomSheetHeight
        }
    }
    
    private func hideBottomSheet() {
        UIView.animate(withDuration: 0.3) {
            self.bottomSheetView.frame.origin.y = self.view.frame.height
        }
    }

    @objc private func handleDateSelection() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        dateOfBirthTextField.text = formatter.string(from: datePicker.date)
    }
    
    // MARK: - Handle Pan Gesture for Bottom Sheet
    @objc private func handlePanGesture(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self.view)
        let newHeight = bottomSheetView.frame.height - translation.y
        
        if newHeight >= minBottomSheetHeight && newHeight <= maxBottomSheetHeight {
            bottomSheetView.frame = CGRect(x: 0, y: self.view.frame.height - newHeight, width: self.view.frame.width, height: newHeight)
            gesture.setTranslation(.zero, in: self.view)
        }

        if gesture.state == .ended {
            let velocity = gesture.velocity(in: self.view)
            
            if velocity.y > 0 {
                UIView.animate(withDuration: 0.3) {
                    self.bottomSheetView.frame = CGRect(x: 0, y: self.view.frame.height - self.minBottomSheetHeight, width: self.view.frame.width, height: self.minBottomSheetHeight)
                }
            } else if velocity.y < 0 {
                UIView.animate(withDuration: 0.3) {
                    self.bottomSheetView.frame = CGRect(x: 0, y: self.view.frame.height - self.maxBottomSheetHeight, width: self.view.frame.width, height: self.maxBottomSheetHeight)
                }
            }
        }
    }
}

// MARK: - UITableView DataSource and Delegate
extension SignUpAdditionalInfoVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "countryCell")
        
        let flagImageView = UIImageView(image: UIImage(named: countryFlags[indexPath.row]))
        flagImageView.frame = CGRect(x: 10, y: 5, width: 30, height: 30)
        
        cell.textLabel?.text = countries[indexPath.row]
        cell.imageView?.image = flagImageView.image
        cell.backgroundColor = .clear
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        countryTextField.text = countries[indexPath.row]
        hideBottomSheet()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30
    }
}

// MARK: - SignUpAdditionalInfoVC Extension for Protocol
extension SignUpAdditionalInfoVC: AuthenticationProtocol {
    func showMessage(title: String?, message: String?) {
        self.showAlert(title: title, message: message)
    }
    
    func goToNextStep() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = SignInVC()
    }
}
