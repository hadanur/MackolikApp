//
//  DetailsVC.swift
//  MackolikApp
//
//  Created by Hakan Adanur on 1.02.2023.
//

import UIKit

class DetailsVC: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let detailsCell = UINib(nibName: "DetailsCell", bundle: nil)
        tableView.register(detailsCell, forCellReuseIdentifier: "detailsCell")
        
    }
}

extension DetailsVC {
    static func create() -> DetailsVC {
        let vc = DetailsVC(nibName: "DetailsVC", bundle: nil)
        return vc
    }
}

extension DetailsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailsCell") as! DetailsCell
        cell.selectionStyle = .none
        return cell
    }
}
