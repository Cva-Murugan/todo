//
//  ViewController.swift
//  UserDefaults
//
//  Created by Novastrid on 24/05/23.
//

import UIKit

//protocol TodoDataDelegate{
//    var todoList :[String] {get set}
//}

struct person: Codable{
    var name : String
    var age : Int
}


class ViewController: UIViewController {
    
//    var todoList = [String]()
    
//    var delegate: TodoDataDelegate?
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textview: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var jo = person(name: "Jo", age: 21)
        
        do{
            var encode = try PropertyListEncoder().encode(jo)
            UserDefaults.standard.set(encode, forKey: "jo")
            
            var value: Data = UserDefaults.standard.value(forKey: "jo") as! Data
            var obj = try PropertyListDecoder().decode(person.self, from: value)
        }
        catch{
            dump(error)
        }
        
        
        
    }
    
    
    @IBAction func saveBtn(_ sender: UIButton) {
        
        
        var todos = UserDefaults.standard.array(forKey: "todo-list") as? [String] ?? []
        
        
        let todo = textview.text
        
        todos.append(todo!)
        
        UserDefaults.standard.set(todos, forKey: "todo-list")
        
//        delegate?.todoList.append(todo!)
        
        let name = Notification.Name("todo-textview")
        NotificationCenter.default.post(name: name, object:nil)
        
    
        self.dismiss(animated: true)
        
    }
    

}
