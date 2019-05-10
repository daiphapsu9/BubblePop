//
//  GameOverViewController.swift
//  Bubble Pop
//
//  Created by Quang Binh Dang on 26/4/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // CONSTANT, max 5 players will be displayed
    let DEFAULT_RANKING_NUMBER = 5
    
    //outlet definition
    @IBOutlet weak var labelScore: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // variable definition
    var players : [Player] = []
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
        labelScore.text = "\(Int(Utilities.shared.score))"
        players = Utilities.shared.retrievePlayers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        if let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (players.count < DEFAULT_RANKING_NUMBER) ? players.count : DEFAULT_RANKING_NUMBER
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCellIdentifier", for: indexPath)
        // Configure the cell...
        cell.textLabel?.text = players[indexPath.row].name
        cell.detailTextLabel?.text = String(players[indexPath.row].score)
        return cell
    }
    
    // MARK:
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
}
