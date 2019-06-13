//
//  TodoListViewController.swift
//  IosCours3
//
//  Created by epita on 17/05/2019.
//  Copyright © 2019 epita. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    var todoItems = [ToDoItem]();
    var index:Int = 0;
    
    func AddItems()
    {
        let t1 = ToDoItem(itemName: "item1", color: UIColor.white);
        todoItems.append(t1);
        let t2 = ToDoItem(itemName: "item2", color: UIColor.white);
        todoItems.append(t2);
        let t3 = ToDoItem(itemName: "item3", color: UIColor.white);
        todoItems.append(t3);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // AddItems();
        
        //self.tableView.isEditing = true
        
        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // self.tableView.isEditing = false
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: false)
            if indexPath.row < todoItems.count {
                let todoItem = todoItems[indexPath.row]
                todoItem.completed = !todoItem.completed
                tableView.reloadRows(at: [indexPath], with: .none)
            } }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt
        indexPath:IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:
            "toto1", for: indexPath)
        if indexPath.row < todoItems.count {
            let todoItem = todoItems[indexPath.row]
            cell.textLabel?.text = todoItem.itemName
            cell.backgroundColor = todoItem.separatorColor
            
            self.index = indexPath.row;
            
            if todoItem.completed {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todoItems.count
    }
    
    @IBAction func unwindToList(_ segue:UIStoryboardSegue){
        if (fromEditSegue == false)
        {
            if let source = segue.source as? AddTodoItemViewController {
                if let item = source.todoItem {
                    todoItems.append(item)
                    tableView.reloadData()
                }
            }
        }
        else
        {
            if let source = segue.source as? AddTodoItemViewController {
                //let tmp = self.todoItems[index]
                

                if let item = source.todoItem {
                    //todoItems.append(item)
                    todoItems.remove(at: index)
                    todoItems.insert(item, at: index)
                    tableView.reloadData()
                }
            }
        }
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            self.todoItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    */
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let tmp = self.todoItems[fromIndexPath.row]
        todoItems.remove(at: fromIndexPath.row)
        todoItems.insert(tmp, at: to.row)
    }

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "edit"
        {
            fromEditSegue = true;
            
            /*
            let todoVC = segue.destination as! AddTodoItemViewController
            
            todoVC.todoItem = todoItems[index]
            
            
            if let sender = sender as? UIBarButtonItem, sender == doneButton {
                if let text = textField.text, text.count > 0 {
                    todoItem = ToDoItem(itemName: text, color:color ?? UIColor.white)
                } }*/
        }
        else
        {
            fromEditSegue = false;
            
        }
    }
 
    var fromEditSegue:Bool = false;
}
