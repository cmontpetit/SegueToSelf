# SegueToSelf

This project shows one way to create a controller that has a segue to self. In this example, the segue to self allows the controller to switch between Read Only (view) and Read Write (editor) modes. There are 2 views which appear as follow:

```
       (Back)                (save/cancel)
    ↙----------↖             ↙----------↖
Root            Controller(RO)         (RW)
    ↘__________↗             ↘__________↗
      (show)                    (edit)
```

It uses Storyboards to establish the controllers, and defines 1 controller class with minimal code.

Project is iOS 9 and Swift.

## Controller class

```swift
import UIKit

class ViewEditTableViewController: UITableViewController {

    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    var editMode = false
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // The view contains all potential buttons,
        // and according to the mode, we only show the appropriate ones
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
        
        // Set the edit mode. The segue only occurs when using the "Edit" button.
        // Saving/cancelling is done using an action.
        if let controller1 = segue.destinationViewController as? UINavigationController {
            if let controller = controller1.topViewController as? ViewEditTableViewController {
                controller.editMode = true
            }
        }
    }
}
```

