//
//  ViewController.swift
//  MusicTableView
//
//  Created by Artem Martirosyan on 12.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var models = MusicTableViewCellModel.loadSampleData()
    var hiddenSections = Set<Int>()
    
    private let customCellId = "customCellId"
    private let customHeaderId = "customHeaderId"
    
    lazy private var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(MusicTableViewCell.self, forCellReuseIdentifier: customCellId)
        tableView.register(MusicTableViewHeader.self, forHeaderFooterViewReuseIdentifier: customHeaderId)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

// MARK: - Private methods
extension ViewController {
    private func configureView() {
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func expandSection(tag: Int) {
        let section = tag

        func indexPathsForSection() -> [IndexPath] {
            var indexPaths = [IndexPath]()

            for row in 0..<models[section].count {
                indexPaths.append(IndexPath(row: row,
                                            section: section))
            }
            return indexPaths
        }

        if hiddenSections.contains(section) {
            hiddenSections.remove(section)
            tableView.insertRows(at: indexPathsForSection(),
                                      with: .fade)
        } else {
            hiddenSections.insert(section)
            tableView.deleteRows(at: indexPathsForSection(),
                                      with: .fade)
        }
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: customHeaderId) as? MusicTableViewHeader else { return UITableViewHeaderFooterView() }
        var title = ""
        switch section {
        case 0:
            title = "Rock"
        case 1:
            title = "Pop"
        case 2:
            title = "Hip-Hop"
        case 3:
            title = "Rap"
        default:
            title = ""
        }
        header.configureHeader(title: title, buttonTag: section, buttonTappedCallback: expandSection)
                        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        80
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: customCellId, for: indexPath) as? MusicTableViewCell else { return UITableViewCell() }
        let model = models[indexPath.section][indexPath.row]
        cell.configureCell(albumTitle: model.albumTitle, albumRating: model.albumRating)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hiddenSections.contains(section) ? 0 : models[section].count
    }
}
