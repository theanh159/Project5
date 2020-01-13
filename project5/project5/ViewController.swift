//
//  ViewController.swift
//  project5
//
//  Created by admin on 1/13/20.
//  Copyright © 2020 personal. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UITableViewController {
    
    var allWords = [String]()
    var useWords = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        if let startWordPath =  Bundle.main.path(forResource: "start", ofType: "txt") {
            if let startWord = try? String(contentsOfFile: startWordPath) {
                allWords = startWord.components(separatedBy: "\n")
            }
        } else {
            allWords = ["silkworm"]
        }
        startGame()
    }
    
    func startGame() {
        allWords = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: allWords) as! [String]
        title = allWords[0]
        useWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = allWords[indexPath.row]
        return cell
    }

}

