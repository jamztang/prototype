//
//  ListTableViewController.m
//  prototype-test
//
//  Created by James Tang on 27/3/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import "ListTableViewController.h"
#import "FSFancyStoryboardSegue.h"
#import "FSGLBoxTransitionViewController.h"
#import "FSGLScaleRotateTransitionViewController.h"
#import "FSGLTileFlyViewController.h"
#import "FSGLClothFlipTransitionViewController.h"

@interface ListTableViewController ()

@end

@implementation ListTableViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue isKindOfClass:[FSFancyStoryboardSegue class]]) {
        FSFancyStoryboardSegue *fancySegue = (FSFancyStoryboardSegue *)segue;
        UIViewController<FSFancyStoryboardSegueTransitionProtocol> *transitionViewController = nil;

        if ([segue.identifier isEqualToString:@"scale"]) {
            transitionViewController = [[FSGLScaleRotateTransitionViewController alloc] initWithNibName:nil bundle:nil];
        }
        else if ([segue.identifier isEqualToString:@"box"]) {
            transitionViewController = [[FSGLBoxTransitionViewController alloc] initWithNibName:nil bundle:nil];
        }
        else if ([segue.identifier isEqualToString:@"tile"]) {
            transitionViewController = [[FSGLTileFlyViewController alloc] initWithNibName:nil bundle:nil];
        }
        else if ([segue.identifier isEqualToString:@"cloth"]) {
            transitionViewController = [[FSGLClothFlipTransitionViewController alloc] initWithNibName:nil bundle:nil];
        }

        fancySegue.transitionViewController = transitionViewController;

//        if ([fancySegue.destinationViewController respondsToSelector:@selector(setBgImageName:)]) {
//            NSString *bgImageName = nil;
//            if (nil == self.bgImageName) {
//                //		while ([(bgImageName = [NSString stringWithFormat:@"miles_photo_%d.jpg", randomInt(1, 4)]) isEqualToString:self.bgImageName]) ;
//                bgImageName = [NSString stringWithFormat:@"miles_photo_%d.jpg", randomInt(1, 4)];
//            }
//
//            FSViewController *destinationViewController = (FSViewController *)fancySegue.destinationViewController;
//            destinationViewController.bgImageName = bgImageName;
//            //	    [fancySegue.destinationViewController performSelector:@selector(setBgImageName:) withObject:bgImageName];
//        }
    }
}


@end
