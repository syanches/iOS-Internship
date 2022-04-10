//
//  ViewController.swift
//  TableViewWithEditing
//
//  Created by Artem Martirosyan on 10.04.2022.
//

import UIKit

class ViewController: UIViewController {

    var model = [["Chelsea F.C.","Lyon", "Liverpool","Manchester"],
                 ["Spartak","Bayern", "Everton","Arsenal"],
                 ["Lokomotiv","Borussia", "Milan","Zenit"],
                 ["Rubin","Shalke", "Inter","Galaxy"]
    ]

    var additionalTeams = ["PSG", "Valencia", "Real Madrid", "Barcelona", "Krasnodar", "Bayern 04", "Real Betis", "Rotor", "Enisey", "Fulham", "Beshiktash"]

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.allowsSelection = false
        return tableView
    }()

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addData))
        navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.title = "Champions League"
    }

    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: animated)
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        model.count
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model[indexPath.section][indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Group A"
        case 1:
            return "Group B"
        case 2:
            return "Group C"
        case 3:
            return "Group D"
        default:
            return nil
        }
    }

    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let team = self.model[sourceIndexPath.section].remove(at: sourceIndexPath.row)
        self.model[destinationIndexPath.section].insert(team, at: destinationIndexPath.row)
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            model[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Count of teams: \(String(model[section].count))"
    }
}

// MARK: - Private methods
extension ViewController {
    @objc
    private func addData() {
        let randomGroup = Int.random(in: 0..<model.count)
        model[randomGroup].append(additionalTeams.randomElement() ?? "Richmond AFC")
        tableView.reloadData()
    }
}
