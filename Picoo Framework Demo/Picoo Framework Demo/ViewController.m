//
//  ViewController.m
//  PicooEditor Demo
//
//  Created by Mohd Iftekhar Qurashi on 16/04/2014.
//  Copyright (c) 2014 Iftekhar. All rights reserved.

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

#import <Picoo/IQPhotoEditorManager.h>

@interface ViewController ()
{
    IBOutlet UIImageView *imageView;
}

@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    imageView.layer.shadowColor = [[UIColor blackColor] CGColor];
    imageView.layer.shadowOffset = CGSizeMake(2, 2);
    imageView.layer.shadowOpacity = 0.8;
    imageView.layer.shadowRadius = 5.0;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(picooEditorCallback:) name:IQPhotoEditorDidEditedImageNotification object:nil];
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)picooEditorCallback:(NSNotification*)notification
{
    imageView.image = [[IQPhotoEditorManager sharedManager] imageFromPhotoEditor];
}

- (IBAction)editAction:(UIButton *)sender
{
    [[IQPhotoEditorManager sharedManager] openWithImage:imageView.image];
}

@end
