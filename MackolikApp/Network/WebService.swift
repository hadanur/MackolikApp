//
//  WebServcie.swift
//  MackolikApp
//
//  Created by Hakan Adanur on 31.01.2023.
//

import Foundation
import UIKit

class Webservice {
    
    static let shared = Webservice()
    
    private init() { }
    
    func downloadMatches(completion : @escaping (MatchBase?) -> ()) {
        let url = URL(string: "https://raw.githubusercontent.com/openfootball/football.json/master/2019-20/tr.1.json")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                do {
                    let matchlist = try JSONDecoder().decode(MatchBase.self, from: data)
                    print(matchlist)
                    completion(matchlist)
                } catch {
                    print(error.localizedDescription)
                    print(String(describing: error))
                }
            }
        }.resume()
    }
}
