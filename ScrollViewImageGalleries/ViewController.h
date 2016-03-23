//
//  ViewController.h
//  ScrollViewImageGalleries
//
//  Created by Tenzin Phagdol on 2016-03-21.
//  Copyright © 2016 Jeffrey Ip. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, strong) IBOutlet UIScrollView *galleryScrollView;
@property (nonatomic, strong) UIImageView *image1;
@property (nonatomic, strong) UIImageView *image2;
@property (nonatomic, strong) UIImageView *image3;

-(void)scrollViewTapGesture:(UITapGestureRecognizer *)recognizer;

@end