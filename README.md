# Welcome to Keyboard aware UIScrollView

This library consists of:

- GNKeyboardAwareScrollView - adjusts reachable area for keyboard appearance
- GNTextFieldsManager - helps with handling many textfields and navigating between them by `next` keyboard button


## Instalation

You can directly download source code and import it to your project, or use *cocoapods*:

`pod "GNKeyboardAwareScrollView"`

## GNKeyboardAwareScrollView

Many developers struggle with UIScrollView covered with keyboard. This class helps to ease the pain of observing keyboard notifications and automatically adjusts it's contentInset to ensure that whole scroll area is reachable.

All you need to do is add it as subview. It handles everything else.


## GNTextFieldsManager

Another useful thing when dealing with keyboard stuff are textfields and navigation between them. Good practice is to enable `next` keyboard button to switch to next textfield, but this requires catching delegate methods and manually calling becomeFirstResponder for all textfields (except the last one). This class helps with this in two ways:

- initialising the manager with array of textfields
- initialising with parent view and setting tag values for all required textfields

### Array of textfields
This is more straight forward solution and you can use the class like this:

```
#import <GNKeyboardAwareScrollView/GNTextFieldsManager.h>

...

-(void)viewDidLoad{
	[super viewDidLoad];
	
	NSArray *myTextFields = @[...]; // the order of array matters!

	self.textFieldsManager = [[GNTextFieldsManager alloc] initWithTextFields:myTextFields];
	
	// GNTextFieldsManagerDelegate is also UITextFieldDelegate and all delegate method calls
	// from textfields (except textFieldShouldReturn) are forwarded
	self.textFieldsManager.delegate = self;
}

// when user hits return button on last textfield this method is called
-(void)textFieldsManager:(GNTextFieldsManager *)manager lastTextFieldShouldReturn:(UITextField *)textField{
    NSLog(@"last textfield returned");
    [textField resignFirstResponder];
}

```

### Superview initialisation
Sometimes it's more comfortable to grab all textfields that are subviews of specified view. To use this method you need to ***specify tags for all textfields you want to use!***

The usage is similar to the previous example, the only change is in the initialisation method:

```
-(void)viewDidLoad{
	[super viewDidLoad];

	self.textFieldsManager = [[GNTextFieldsManager alloc] initWithView:self.view];
	...	
}
```



## Contribution

Please feel free to contact me or create pull requests. I hope You'll find these few lines of code useful.