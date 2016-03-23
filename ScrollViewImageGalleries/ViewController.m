//
//  ViewController.m
//  ScrollViewImageGalleries
//
//  Created by Tenzin Phagdol on 2016-03-21.
//  Copyright © 2016 Jeffrey Ip. All rights reserved.
//

#import "ViewController.h"
#import "InitialViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImageView *image1 =[[UIImageView alloc] initWithFrame:CGRectMake(0,self.galleryScrollView.frame.size.height/4,self.galleryScrollView.frame.size.width,300)];
    image1.image=[UIImage imageNamed:@"Lighthouse-in-Field.jpg"];
    [self.galleryScrollView addSubview:image1];
    
    self.image1 = image1;
    self.image1.userInteractionEnabled = YES;
    
    UIImageView *image2 =[[UIImageView alloc] initWithFrame:CGRectMake(self.galleryScrollView.frame.size.width,self.galleryScrollView.frame.size.height/4,self.galleryScrollView.frame.size.width,300)];
    image2.image=[UIImage imageNamed:@"Lighthouse-night.jpg"];
    [self.galleryScrollView addSubview:image2];
    
    self.image2 = image2;
    self.image2.userInteractionEnabled = YES;
    
    UIImageView *image3 =[[UIImageView alloc] initWithFrame:CGRectMake(self.galleryScrollView.frame.size.width*2,self.galleryScrollView.frame.size.height/4,self.galleryScrollView.frame.size.width,300)];
    image3.image=[UIImage imageNamed:@"Lighthouse-zoomed.jpg"];
    [self.galleryScrollView addSubview:image3];
    
    self.image3 = image3;
    self.image3.userInteractionEnabled = YES;
    
    self.galleryScrollView.contentSize = CGSizeMake(self.galleryScrollView.frame.size.width * 3, self.galleryScrollView.frame.size.height);
    
    self.galleryScrollView.pagingEnabled = YES;
    
    //sets scrollview's delegate to view controller -- now the scrollview will notify view controller if changes are made; allows us to use UIScrollView delegate methods like scrollViewDidScroll for the UIPageController
    self.galleryScrollView.delegate = self;
    
    UITapGestureRecognizer *galleryImageTapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewTapGesture:)];
    [self.galleryScrollView addGestureRecognizer:galleryImageTapped];
    
//    [self scrollViewDidScroll:self.galleryScrollView];
    
}

-(void)scrollViewTapGesture:(UITapGestureRecognizer *)recognizer {
    if(self.galleryScrollView.contentOffset.x < self.galleryScrollView.frame.size.width) {
        [self performSegueWithIdentifier:@"showZoomView" sender:self.image1.image];
    } else if (self.galleryScrollView.contentOffset.x < self.galleryScrollView.frame.size.width*2) {
        [self performSegueWithIdentifier:@"showZoomView" sender:self.image2.image];
    } else {
        [self performSegueWithIdentifier:@"showZoomView" sender:self.image3.image];
    }
}

//must modify this method to pass the image to detail view controller
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    if ([segue.identifier isEqualToString:@"showZoomView"]) {
        
        // Update the destination view controller's detailImage
        NSLog(@"showZoomView");
        InitialViewController *iVC = (InitialViewController *) segue.destinationViewController;
        iVC.detailImage = sender;
    }
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if(self.galleryScrollView.contentOffset.x < self.galleryScrollView.frame.size.width) {
        self.pageControl.currentPage = 0;
    } else if (self.galleryScrollView.contentOffset.x < self.galleryScrollView.frame.size.width*2) {
        self.pageControl.currentPage = 1;
    } else {
        self.pageControl.currentPage = 2;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
