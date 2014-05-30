//
//  ViewController.m
//  imageconvert
//
//  Created by 866584 on 5/30/14.
//  Copyright (c) 2014 TCS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIImage *image = [UIImage imageNamed:@"images.jpeg"];
    
    NSData *imageData = UIImagePNGRepresentation(image);
    // UIImageJPGRepresentation also work
    
    NSInteger length = [imageData length];
    NSLog(@"lenght of images %d",length);
    
    Byte *byteData = (Byte*)malloc(length);
    memcpy(byteData, [imageData bytes], length);
    
    NSData *newData = [NSData dataWithBytes:byteData length:length];
    
    UIImage *newImage = [UIImage imageWithData:newData];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:newImage];
    imageView.frame = CGRectMake(50, 50, 100, 100);
    [self.view addSubview:imageView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
