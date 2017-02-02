//
//  ViewController.swift
//  JSON fun
//
//  Created by Sebastian Hette on 27.10.2016.
//  Copyright © 2016 MAGNUMIUM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()

        let url = URL(string: "https://newsapi.org/v1/articles?source=cnn&sortBy=top&apiKey=55edd3e40ad347ab804edc2eaa976f99")
        
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
                        print(myJson)
                        //Esta es una cala para el branc del issue 1
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

