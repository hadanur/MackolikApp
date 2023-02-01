//
//  HomeVC.swift
//  MackolikApp
//
//  Created by Hakan Adanur on 31.01.2023.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var collectionView: UICollectionView!
    var viewModel: HomeVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let matchCell = UINib(nibName: "MatchCell", bundle: nil)
        tableView.register(matchCell, forCellReuseIdentifier: "matchCell")
        
        let newsCell = UINib(nibName: "NewsCell", bundle: nil)
        collectionView.register(newsCell, forCellWithReuseIdentifier: "newsCell")
        
        viewModel.fetchMatches()
        viewModel.delegate = self
    }

}

extension HomeVC {
    static func create() -> HomeVC {
        let vc = HomeVC(nibName: "HomeVC", bundle: nil)
        vc.viewModel = HomeVM()
        return vc
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.matches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "matchCell") as! MatchCell
        let data = viewModel.matches[indexPath.row]
        cell.configure(match: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = DetailsVC.create()
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newsCell", for: indexPath) as! NewsCell
        return cell
    }
}

extension HomeVC: HomeVMDelegate {
    func fetchMatchesSuccess() {
        self.tableView.reloadData()
    }
    
    func fetchMatchesError() {
        showAlert(title: "Hata", message: "Veri Yüklenemedi")
    }
    
    
}
