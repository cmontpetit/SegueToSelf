
import UIKit

class ViewEditTableViewController: UITableViewController {

    @IBOutlet var cancelButton: UIBarButtonItem!
    @IBOutlet var saveButton: UIBarButtonItem!
    @IBOutlet var editButton: UIBarButtonItem!
    
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
