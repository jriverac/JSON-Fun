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
    
    
    @IBOutlet weak var GetName: UILabel!
    @IBOutlet weak var Getemail: UILabel!
    
     var name2 = " "
     var email2 = " "

    
    @IBAction func GetButton(_ sender: Any) {
        
       
        
        let url = URL(string: "http://chupes.herokuapp.com/contacts.json")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
           
            if error != nil
            {
                print ("ERROR")
            }
            else
            {
                if let content = data
                {
                    do
                    {
                        //Array
                        let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        //: Now you can define a function to process each item in the array:
                        
                      //  let totalContacts = myJson.count.hashValue
                          let contador = 0
                        
                   //     for _ in contador...totalContacts-1
                            
                   //     {
                            
                            if let userName = myJson[contador] as? NSDictionary
                            {
                                if let name = userName["name"] as? NSString{
                                    //This could avoid lots of crashes caused by the unexpected data types
                               
                                    self.name2 = (userName["name"] as? String)!
                                    
                                }
                            }
                            
                        
                            if let usermail = myJson[contador] as? NSDictionary
                            {
                                if let mail = usermail["email"] as? NSString
                                {
                                    print("EL mail del user es : \(mail)")
                                    self.email2 = (usermail["email"] as? String)!
                                }
                            }
                      //      contador += 1 // nos movemos al siguiente elemento
                     //   }//for
                   

                    }
                        
                    catch
                    {
                        
                    }
                }
            }
        }

        
        GetName.text = name2
        Getemail.text = email2
 
        
      task.resume()
        
    }
    
    
    
    
    
    
    @IBAction func InsertarButton(_ sender: Any) {
        
        // prepare json data
        //We Indicate the headers is a json format
        
        
        let name = TextFieldName.text
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
        
        
        let headers = [
            "content-type": "application/json" ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://chupes.herokuapp.com/contacts/29.json")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "DELETE"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse!)
            }
        })
        
        dataTask.resume()
        
        
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

