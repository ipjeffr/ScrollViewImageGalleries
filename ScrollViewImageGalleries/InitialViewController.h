//
//  InitialViewController.h
//  ScrollViewImageGalleries
//
//  Created by Tenzin Phagdol on 2016-03-21.
//  Copyright © 2016 Jeffrey Ip. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InitialViewController : UIViewController <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *detailScrollView;

@property (weak, nonatomic) IBOutlet UIImageView *detailImageView;

@property (weak, nonatomic) UIImage *detailImage;

@end