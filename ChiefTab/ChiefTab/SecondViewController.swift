//
//  SecondViewController.swift
//  ChiefTab
//
//  Created by econfig on 2/21/17.
//  Copyright © 2017 Dragon rojo. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return AContacts.count
       // return Contacts.count
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "cell")
        //cell.textLabel?.text = Contacts[indexPath.row]
        cell.textLabel?.text = AContacts[indexPath.row][0]
        
        // me retorna el nombre en el array para ponerlo ne la etiqueta
        return(cell)
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            let contactToErase = AContacts[indexPath.row][2]
            print("borraremos \(contactToErase)")
            
            // delete function
            
            let headers = [
                "content-type": "application/json",
                "cache-control": "no-cache",
                "postman-token": "2e03108b-3909-fa73-7c6b-abb2f210534a"
            ]
            
            let request = NSMutableURLRequest(url: NSURL(string: ("http://chupes.herokuapp.com/contacts/" + contactToErase))! as URL,
                                              cachePolicy: .useProtocolCachePolicy,
                                              timeoutInterval: 10.0)
            request.httpMethod = "DELETE"
            request.allHTTPHeaderFields = headers
            
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                if (error != nil) {
                    print(error!)
                } else {
                    let httpResponse = response as? HTTPURLResponse
                    print(httpResponse as Any)
                    
                }
            })
            
            
            AContacts.remove(at: indexPath.row)
            
            //Contacts.remove(at: indexPath.row)
            
            myTableView.reloadData()
            
            
            dataTask.resume()

        }
        
        
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

