//
//  DetailedViewController.swift
//  MeetMeUp
//
//  Created by Julian Lee on 2/1/16.
//  Copyright © 2016 mobilemakers. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hostingGroupLabel: UILabel!
    @IBOutlet weak var rsvpLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var detailedDictionaryObject = NSDictionary()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = self.detailedDictionaryObject.objectForKey("name") as? String
        self.rsvpLabel.text = self.detailedDictionaryObject.objectForKey("yes_rsvp_count")?.stringValue
        
        let hostingGroupDictionary = self.detailedDictionaryObject.objectForKey("group")
        
        self.hostingGroupLabel.text = hostingGroupDictionary!.objectForKey("name") as? String
        self.descriptionLabel.text = self.detailedDictionaryObject.objectForKey("description") as? String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
