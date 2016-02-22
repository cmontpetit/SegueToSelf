//
//  ViewEditTableViewController.swift
//  SegueToSelf
//
//  Created by Claude Montpetit on 16-01-10.
//  Copyright © 2016 Claude Montpetit. All rights reserved.
//

import UIKit

class ViewEditTableViewController: UITableViewController {

    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    var editMode = false
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if (editMode) {
            self.navigationItem.leftBarButtonItems = [cancelButton]
            self.navigationItem.rightBarButtonItems = [saveButton]
        }else{
            self.navigationItem.leftBarButtonItems = []
            self.navigationItem.rightBarButtonItems = [editButton]
        }
    }
    
    @IBAction func onSave(sender: AnyObject) {
        self.onCancel(sender)
    }
    
    @IBAction func onCancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion:{})
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let controller1 = segue.destinationViewController as? UINavigationController {
            if let controller = controller1.topViewController as? ViewEditTableViewController {
                controller.editMode = true
            }
        }
    }
}
