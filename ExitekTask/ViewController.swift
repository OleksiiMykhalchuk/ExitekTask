//
//  ViewController.swift
//  ExitekTask
//
//  Created by Oleksii Mykhalchuk on 8/31/22.
//

import UIKit

class ViewController: UIViewController {
    var viewModel: ViewModel = ViewModel()
    private var cornerRadius: CGFloat = 6
// MARK: - Outlets
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var addButtonOutlet: UIButton! {
        didSet {
            addButtonOutlet.layer.cornerRadius = cornerRadius
        }
    }
    @IBOutlet weak var tableView: UITableView!
// MARK: - Action
    @IBAction func addButtonAction(_ sender: Any) {
        viewModel.writeData(movie: Movie(
            title: titleTextField.text ?? "",
            year: Int(yearTextField.text ?? "") ?? 0))
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .bottom)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
}
// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "default")
        let title = viewModel[indexPath.row].title
        let year = viewModel[indexPath.row].year
        cell.textLabel?.text = "\(title) \(year)"
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movies.count
    }
}
