# SegueToSelf

This project shows one way to create a controller that has a segue to self. There are 2 views which appear as follow:

```
       (Back)                (save/cancel)
    ↙----------↖             ↙----------↖
Root            Controller(RO)         (RW)
    ↘__________↗             ↘__________↗
      (show)                    (edit)
```

It uses Storyboards to establish the controllers, and defines 1 controller class with minimal code.

Project is iOS 9 and Swift.
