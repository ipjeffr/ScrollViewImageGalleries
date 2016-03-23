//
//  InitialViewController.m
//  ScrollViewImageGalleries
//
//  Created by Tenzin Phagdol on 2016-03-21.
//  Copyright © 2016 Jeffrey Ip. All rights reserved.
//

#import "InitialViewController.h"

@interface InitialViewController ()

@end

@implementation InitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.detailScrollView.minimumZoomScale = 0.1;
    self.detailScrollView.maximumZoomScale = 2;
    
    if (self.detailImage) {
        self.detailImageView.image = self.detailImage;
    }
    
}

//optional UIScrollViewDelegate method; implemented here, to return self.detailImageView, i.e. to tell the scroll view which image view to zoom
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.detailImageView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
