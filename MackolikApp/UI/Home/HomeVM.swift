//
//  HomeVM.swift
//  MackolikApp
//
//  Created by Hakan Adanur on 31.01.2023.
//

import Foundation
import UIKit

protocol HomeVMDelegate: AnyObject {
    func fetchMatchesSuccess()
    func fetchMatchesError()
}

class HomeVM {
    let service = Webservice.shared
    weak var delegate: HomeVMDelegate?
    var matches = [Match]()
    
    func fetchMatches() {
        service.downloadMatches { result in
            if let result = result {
                for match in result.matches {
                    if match.round.contains("Round 1") {
                        self.matches.append(match)
                    }
                }
                DispatchQueue.main.async {
                    self.delegate?.fetchMatchesSuccess()
                }
            } else {
                self.delegate?.fetchMatchesError()
            }
        }
    }
}
