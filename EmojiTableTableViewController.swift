//
//  EmojiTableTableViewController.swift
//  EmojiDictionary
//
//  Created by Wolfpack Digital on 29.07.2021.
//

import UIKit

class EmojiTableTableViewController: UITableViewController
{

    var emojis: [Emoji] = [
       Emoji(symbol: "π", name: "Grinning Face",
       description: "A typical smiley face.", usage: "happiness"),
       Emoji(symbol: "π", name: "Confused Face",
       description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
       Emoji(symbol: "π", name: "Heart Eyes",
       description: "A smiley face with hearts for eyes.",
       usage: "love of something; attractive"),
       Emoji(symbol: "π§βπ»", name: "Developer",
       description: "A person working on a MacBook (probably using Xcode to write iOS apps in Swift).", usage: "apps, software, programming"),
       Emoji(symbol: "π’", name: "Turtle", description:
       "A cute turtle.", usage: "something slow"),
       Emoji(symbol: "π", name: "Elephant", description:
       "A gray elephant.", usage: "good memory"),
       Emoji(symbol: "π", name: "Spaghetti",
       description: "A plate of spaghetti.", usage: "spaghetti"),
       Emoji(symbol: "π²", name: "Die", description: "A single die.", usage: "taking a risk, chance; game"),
       Emoji(symbol: "βΊοΈ", name: "Tent", description: "A small tent.", usage: "camping"),
       Emoji(symbol: "π", name: "Stack of Books",
       description: "Three colored books stacked on each other.",
       usage: "homework, studying"),
       Emoji(symbol: "π", name: "Broken Heart",
       description: "A red, broken heart.", usage: "extreme sadness"), Emoji(symbol: "π€", name: "Snore",
       description:
       "Three blue \'z\'s.", usage: "tired, sleepiness"),
       Emoji(symbol: "π", name: "Checkered Flag",
       description: "A black-and-white checkered flag.", usage:
       "completion"),
        Emoji(symbol: "π", name: "Hamburger", description: "A vegan hamburger.", usage: "eating"),
        Emoji(symbol: "π₯", name: "Salad", description: "A boring salad.", usage: "eating"),
        Emoji(symbol: "π±", name: "Sushi", description: "A vegan sushi.", usage: "eating"),
        Emoji(symbol: "βοΈ", name: "Coffee", description: "A strong coffee.", usage: "drinking"),
        Emoji(symbol: "π§", name: "Falafel", description: "A delicious falafel.", usage: "eating"),
        Emoji(symbol: "π―", name: "Burito", description: "A vegan burito.", usage: "eating"),
        Emoji(symbol: "π₯", name: "Kiwi", description: "A nice kiwi", usage: "eating")
    ]
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        navigationItem.leftBarButtonItem = editButtonItem

    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    @IBAction func editButtonTapped(_ sender: UIBarButtonItem)
    {
        let tableViewEditingMode = tableView.isEditing
        
            tableView.setEditing(!tableViewEditingMode, animated: true)
   }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return emojis.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath)

        let emoji = emojis[indexPath.row]
        
        cell.textLabel?.text = "\(emoji.symbol) - \(emoji.name)"
        cell.detailTextLabel?.text = emoji.description

        cell.showsReorderControl = true
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt
       indexPath: IndexPath)
    {
        let emoji = emojis[indexPath.row]
        print("\(emoji.symbol) \(indexPath)")
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath)
    {
        let movedEmoji = emojis.remove(at: fromIndexPath.row)
            emojis.insert(movedEmoji, at: to.row)
       
    }
    
    override func tableView(_ tableView: UITableView,
    editingStyleForRowAt indexPath: IndexPath) ->
    UITableViewCell.EditingStyle
    {
        return .none
    }

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool
    {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

}
