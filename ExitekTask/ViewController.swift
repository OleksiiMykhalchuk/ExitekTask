//
//  ViewController.swift
//  ExitekTask
//
//  Created by Oleksii Mykhalchuk on 8/31/22.
//

import UIKit

extension ViewController {
    static func make(viewModel: ViewModel) -> UIViewController {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! ViewController
        viewController.viewModel = viewModel
        return viewController
    }
}

class ViewController: UIViewController {
    var viewModel: ViewModel!
// MARK: - Outlets
    @IBOutlet private weak var yearTextField: UITextField!
    @IBOutlet private weak var titleTextField: UITextField!
    @IBOutlet private weak var addButtonOutlet: UIButton!
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            viewModel.didUpdate = { [weak self] in
                self?.tableView.reloadData()
            }
            viewModel.didUpdateWithIndex = { index in
                let indexPath = IndexPath(row: index, section: 0)
                self.tableView.insertRows(at: [indexPath], with: .bottom)
            }
            viewModel.showError = { [weak self] errorMessage in
                self?.showAlert(errorMessage)
            }
        }
    }
// MARK: - Action
    @IBAction private func addButtonAction(_ sender: Any) {
        guard viewModel.validateYear(Int(yearTextField.text ?? "") ?? 0) else {
            yearTextField.addBorder()
            return
        }
        viewModel.writeData(
            title: titleTextField.text ?? "",
            year: Int(yearTextField.text ?? "") ?? 0)
        yearTextField.text = ""
        titleTextField.text = ""
        view.endEditing(true)
    }
    @IBAction private func textDidChange(_ sender: Any) {
        if titleTextField.text == "" || yearTextField.text == "" {
            addButtonOutlet.isEnabled = false
            addButtonOutlet.alpha = 0.3
        } else {
            addButtonOutlet.isEnabled = true
            addButtonOutlet.alpha = 1
        }
        yearTextField.layer.borderWidth = 0
    }
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        print("\(viewModel.applicationDocumentDirectory)")
        viewModel.readData()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.start()
    }
}
// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movie", for: indexPath)
        cell.textLabel?.text = "\(viewModel[indexPath.row])"
        cell.isUserInteractionEnabled = false
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getCount()
    }
}
