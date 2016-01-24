//
//  ViewController.swift
//  GarageDoorOpener
//
//  Created by Justin Barnes on 2016-01-24.
//  Copyright © 2016 Justin Barnes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldWS: UITextField!
    @IBAction func buttonPressed(sender: AnyObject) {
        if(textFieldWS.text!.characters.count == 0){
            print("empty string")
        } else {
            print(textFieldWS.text!)
            //let postEndPoint: String = textFieldWS.text!
            let postEndPoint: String = "http://jsonplaceholder.typicode.com/posts/1"
            guard let url = NSURL(string:postEndPoint) else {
                print("Error: cannot create URL")
                return
            }
            let urlRequest = NSURLRequest(URL: url)
            let config = NSURLSessionConfiguration.defaultSessionConfiguration()
            let session = NSURLSession(configuration: config)
            let task = session.dataTaskWithRequest(urlRequest, completionHandler: { (data,response,error) in
                guard let responseData = data else {
                    print("Did not receive data")
                    return
                }
                
                guard error == nil else {
                    print("error calling GET "+self.textFieldWS.text!)
                    print(error)
                    return
                }
                
                print(responseData.length)
            })
            task.resume()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello World")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

