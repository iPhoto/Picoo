//
//  IQPhotoEditorManager.h
//
//  Created by Mohd Iftekhar Qurashi on 16/04/2014.
//  Copyright (c) 2014 Iftekhar. All rights reserved.

#import <Foundation/NSObject.h>

@class UIImage;


extern NSString *const IQPhotoEditorDidEditedImageNotification;

/*!
    @class      IQPhotoEditorManager
 
    @updated    16-04-2014
 */
@interface IQPhotoEditorManager : NSObject

/*!
    @method     sharedManager
 
    @return     Returns the default singleton instance.
 */
+(IQPhotoEditorManager*)sharedManager;

/*!
    @method     openWithImage:
 
    @param      image   The UIImage to pass to Picoo Photo Editor.
 
    @abstract   Opens the given image in Picoo Photo Editor.
 */
-(void)openWithImage:(UIImage*)image;

/*!
    @method     imageFromPhotoEditor
 
    @return     Returns the edited/original image by the Picoo Photo Editor.
 
    @discussion It returns the edited image from the Picoo Photo Editor. If you choose cancel in Picoo editor then the original image will be return.
 */
-(UIImage*)imageFromPhotoEditor;

/*!
    @abstract   A helper method that is used to provide an implementation for [UIApplicationDelegate application:openURL:sourceApplication:annotation:]. It will take care of  IQPhotoEditorDidEditedImageNotification be invoked if coming from Picoo Photo Editor.
 
    @param      url     The URL as passed to [UIApplicationDelegate application:openURL:sourceApplication:annotation:].
 */
- (BOOL)handleOpenURL:(NSURL *)url;

/*!
    @method     init
 
    @abstract   Should create only one instance of class. Should not call init.
 */
- (id)init	__attribute__((unavailable("init is not available in IQPhotoEditorManager, Use sharedManager")));

/*!
    @method     new
 
    @abstract   Should create only one instance of class. Should not call new.
 */
+ (id)new	__attribute__((unavailable("new is not available in IQPhotoEditorManager, Use sharedManager")));


@end

