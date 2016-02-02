//
//  ViewController.swift
//  MeetMeUp
//
//  Created by Julian Lee on 2/1/16.
//  Copyright © 2016 mobilemakers. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var results = NSDictionary()
    var resultsArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: "https:api.meetup.com/2/open_events.json?zip=11358&time=-1w,&amp;status=past&key=416b1450566153175a2c28613426796c")
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            do {
                self.results = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as! NSDictionary
            }
            catch let error as NSError {
                print("json error: \(error.localizedDescription)")
            }
            self.resultsArray = self.results.objectForKey("results") as! [NSDictionary]
            self.tableView.reloadData()
            
        }
        task.resume()
        
        print(results)
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.resultsArray.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell!
        let dictionary = self.resultsArray[indexPath.row] as! NSDictionary
        
        cell.textLabel!.text = (dictionary.objectForKey("name") as! String)
        
        if let venue = dictionary["venue"] as? NSDictionary {
            cell.detailTextLabel!.text = venue.objectForKey("address_1") as? String
        }else{
            cell.detailTextLabel!.text = ""
        }
        return cell;
    }
}

