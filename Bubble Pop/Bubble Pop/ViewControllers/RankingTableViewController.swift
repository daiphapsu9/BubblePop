//
//  RankingTableViewController.swift
//  Bubble Pop
//
//  Created by Quang Binh Dang on 18/4/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import UIKit

extension PlayerEntity {
    func toPlayer() -> Player {
        let player = Player(name : self.name!, score : Int(self.score) )
        return player
    }
}

class RankingTableViewController: UITableViewController {

    var players : [Player] = []
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
        players = Utilities.shared.retrievePlayers()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return players.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCellIdentifier", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = players[indexPath.row].name
        cell.detailTextLabel?.text = String(players[indexPath.row].score)
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    // MARK: HELPERS
    
    func sort() { // should probably be called sort and not filter
        players.sort() { $0.score > $1.score }
        self.tableView.reloadData(); 
    }

}
