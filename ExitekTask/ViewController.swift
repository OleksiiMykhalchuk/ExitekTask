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
        cell.textLabel?.text = "Movie Title Year"
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
}
