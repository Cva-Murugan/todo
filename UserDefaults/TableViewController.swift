//
//  TableViewController.swift
//  UserDefaults
//
//  Created by Novastrid on 24/05/23.
//

import UIKit




class TableViewController: UITableViewController /*, TodoDataDelegate*/ {
    
    var todoList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let name =  Notification.Name("todo-textview")

        NotificationCenter.default.addObserver(self, selector: #selector(dataTrandfer), name: name, object: nil)
        
        let val: [String] = UserDefaults.standard.stringArray(forKey: "todo-list")!
        todoList = val
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        let value = UserDefaults.standard.stringArray(forKey: "todo-list") ?? []
//        todoList = value
//
//    }
    
    @objc func dataTrandfer(){
//        print("HEllo",todo.object as? [String])
//        tableView.reloadData()
        
        let val: [String] = UserDefaults.standard.stringArray(forKey: "todo-list")!
        todoList = val
        
        tableView.reloadData()
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return todoList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = todoList[indexPath.row]
        return cell
    }
    
    
    @IBAction func addBtn(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "viewController") as! ViewController
        
//        self.navigationController?.pushViewController(vc, animated: true)
        
        self.present(vc, animated: true)
        
//        vc.delegate = self
        
        
        
    }
    
}
