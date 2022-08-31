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

    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var addButtonOutlet: UIButton! {
        didSet {
            addButtonOutlet.layer.cornerRadius = cornerRadius
        }
    }
    @IBOutlet weak var tableView: UITableView!

    @IBAction func addButtonAction(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
