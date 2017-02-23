//
//  FirstViewController.swift
//  ChiefTab
//
//  Created by econfig on 2/21/17.
//  Copyright © 2017 Dragon rojo. All rights reserved.
//

import UIKit

var Contacts = [String()]


class FirstViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
                            print("**** valor name \(name)")
                            Contacts.append(name as String!)
                            }
                        }
                        
                        /*
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
                        */
                    
                        
                    }
                        
                    catch
                    {
                        
                    }
                }
            }
        }
        task.resume()
        
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
}

