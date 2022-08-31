//
//  ViewController.swift
//  ExitekTask
//
//  Created by Oleksii Mykhalchuk on 8/31/22.
//

import UIKit

class ViewController: UIViewController {
    var viewModel: ViewModel = ViewModel()
// MARK: - Outlets
    @IBOutlet private weak var yearTextField: UITextField!
    @IBOutlet private weak var titleTextField: UITextField!
    @IBOutlet private weak var addButtonOutlet: UIButton!
    @IBOutlet private weak var tableView: UITableView!
// MARK: - Action
    @IBAction func addButtonAction(_ sender: Any) {
        viewModel.writeData(
            title: titleTextField.text ?? "",
            year: Int(yearTextField.text ?? "") ?? 0) {
            let indexPath = IndexPath(row: 0, section: 0)
            tableView.insertRows(at: [indexPath], with: .bottom)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
}
// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movie", for: indexPath)
        cell.textLabel?.text = "\(viewModel[indexPath.row].description)"
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getCount()
    }
}
