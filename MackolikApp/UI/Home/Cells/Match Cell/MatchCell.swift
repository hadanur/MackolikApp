//
//  Match Cell.swift
//  MackolikApp
//
//  Created by Hakan Adanur on 31.01.2023.
//

import Foundation
import UIKit

class MatchCell: UITableViewCell {
    @IBOutlet private weak var resultLabel: UILabel!
    
    func configure(match: Match) {
        resultLabel.text = "\(match.team1) \(match.score.ft[0]) - \(match.score.ft[1]) \(match.team2)"
    }
}
