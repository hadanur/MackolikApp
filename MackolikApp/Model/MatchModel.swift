//
//  MatchModel.swift
//  MackolikApp
//
//  Created by Hakan Adanur on 31.01.2023.
//

import Foundation


struct MatchBase: Codable {
    let name: String
    let matches: [Match]
}

struct Match: Codable {
    let round: String
    let date: String
    let team1: String
    let team2: String
    let score: Score
}

struct Score: Codable {
    let ft: [Int]
}
