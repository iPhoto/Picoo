Picoo
=====

Open Picoo Photo Editor from your own apps to enhance photo easily without any extra effort.

Installation
---

Step 1:- Linking against framework
- Link your project against `Picoo.framework` found in "Picoo framework.zip" file.

Step 2:- Register custom URL Scheme
- Go into your app's TARGET->Info tab.
- Expand `URL Types` section found at the bottom. You will find `Identifier` and `URL Schemes` fields.
- Fill the `Identifier` field, the value of `Identifier` field should be the reverse domain for your app e.g. "com.yourcompany.myapp".
- Fill the `URL Schemes` field, you can use each item as a different url you wish to use, so if you wanted to use "myapp://" you would create `URL Schemes` called "myapp"`.

Step 3:- Implement delegate method of `UIApplication`.
- Import `#import <Picoo/IQPhotoEditorManager.h>` in your AppDelegate.
- Implement `application:openURL:sourceApplication:annotation:` protocol and call `handleOpenURL:` method of `IQPhotoEditorManager` something like this:-

````
- -(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    [[IQPhotoEditorManager sharedManager] handleOpenURL:url];
    return YES;
}
````

Step 4:- Open Picoo Photo Editor
- Register/Unregister for `IQPhotoEditorDidEditedImageNotification` notification in your ViewController from where you want to edit your image.
````
- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(picooEditorNotification:) name:IQPhotoEditorDidEditedImageNotification object:nil];
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

````

- Open Picoo Editor using `openWithImage:` method. and pass your `UIImage` object which you want to be edited.
````
- (IBAction)editAction:(UIButton *)sender
{
    [[IQPhotoEditorManager sharedManager] openWithImage:imageView.image];
}
````

- Get edited image in notification callback using `imageFromPhotoEditor` method.
````
-(void)picooEditorNotification:(NSNotification*)notification
{
    imageView.image = [[IQPhotoEditorManager sharedManager] imageFromPhotoEditor];
}
````

Sample application
---
- A sample application can be found in this repository with all the above setup.

Contact us
---
If you wish to contact us, email at: picooapp@gmail.com

