//
//  ViewController.swift
//  JsonTrial
//
//  Created by Mickey Goga on 2/19/18.
//  Copyright © 2018 Magy Elias. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    var batters = [Batter]()
    var results = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataService.shared.getData{
            (data) in
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? JSON else {
                    return
                }
//                print(json)
//                let resultJSON = Result(json: json)
                
                let json_base = JSON_Base(json: json)
                print(json_base)
                
                guard let results = json_base?.results else {
                    return
                }
                print(results)
                self.results = results
                
                //-------------------------------------------//
//                let itemRespone = ItemResponse(json: json)
//                guard let batters = itemRespone?.items.first?.batters.batters else {
//                    return
//                }
////                print(batters)
//                self.batters = batters
            } catch {
                print(error)
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
//        return batters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = results.first?.repeatInterval
        var count = 0
        for item in results[indexPath.row].on {
            if count > 0 {
                cell.detailTextLabel?.text = "\(String(describing: cell.detailTextLabel?.text))," + "\(String(describing: item))"
            } else {
                cell.detailTextLabel?.text = item
            }
            count += 1
        }
        
//        cell.detailTextLabel?.text = results[indexPath.row].item
        
        //----------------------------------------------------------------------//
//        cell.textLabel?.text = batters[indexPath.row].type
//        cell.detailTextLabel?.text = batters[indexPath.row].id
        return cell
    }
}

