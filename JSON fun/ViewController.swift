//
//  ViewController.swift
//  JSON fun
//
//  Created by Sebastian Hette on 27.10.2016.
//  Copyright © 2016 MAGNUMIUM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var TextFieldName: UITextField!
    
    @IBAction func InsertarButton(_ sender: Any) {
        
        // prepare json data
        //We Indicate the headers is a json format
        
        
        let name = TextFieldName.text;
        let email = "rickhunter08@gmail.com";
        
        print("valor de \(name)");
        
        
        
        
        let headers = [
            "content-type": "application/json"
        ]
        
        
        
        let json = ["contact": [
            "name": "\(name)",
            "email": "\(email)"
            ]] as [String : Any]
        
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        
        //create post request
        
        let myUrl = URL(string: "http://chupes.herokuapp.com/contacts.json");
        var request = URLRequest(url:myUrl!)
        request.httpMethod = "POST"// Define method
        request.allHTTPHeaderFields=headers;
        request.httpBody=jsonData;
        
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if error != nil
            {
                print("error=\(error)")
                return
            }
            
            // You can print out response object
            print("response = \(response)")
            
            /* This section is to retrieve the answer from the server
             
             //Let's convert response sent from a server side script to a NSDictionary object:
             do {
             let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
             
             if let parseJSON = json {
             
             // Now we can access value of First Name by its key
             //let Name = parseJSON["name"] as? String
             //print("Name: \(Name)")
             //  print("*******Json value \(parseJSON)");
             }
             
             
             } catch {
             print(error)
             }
             */
        }
        task.resume()
        
        
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

