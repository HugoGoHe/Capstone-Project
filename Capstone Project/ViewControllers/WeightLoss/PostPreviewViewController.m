//
//  PostPreviewViewController.m
//  Capstone Project
//
//  Created by Hugo Gomez Herrera on 7/11/22.
//

#import "PostPreviewViewController.h"
#import "ProgressPic.h"

@interface PostPreviewViewController ()

@property(nonatomic, strong) NSDate *currentDate;

@end

@implementation PostPreviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"MM/dd/yyyy"];
    NSString *dateString = [dateFormatter stringFromDate:self.currentDate];
    self.dateLabel.text = dateString;
    self.progressPic.image = self.selectedImage;
}

- (IBAction)didTapCheckMark:(id)sender {
    [ProgressPic postUserImage:self.selectedImage withWeight:[self.weightLabel.text floatValue] withDate:self.currentDate withCompletion:^(BOOL succeeded, NSError * _Nullable error){
        if(!error){
            [self.delegate didPost];
        }
    }];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UITabBarController *nav = [storyboard instantiateViewControllerWithIdentifier: @"TabBarViewController"];
    [nav setModalPresentationStyle:UIModalPresentationFullScreen];
    [nav setSelectedViewController:[nav.viewControllers objectAtIndex:0]];
    [self.navigationController presentViewController:nav animated:YES completion:nil];
    
}

- (IBAction)didTapBack:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UITabBarController *nav = [storyboard instantiateViewControllerWithIdentifier: @"TabBarViewController"];
    [nav setModalPresentationStyle:UIModalPresentationFullScreen];
    [nav setSelectedViewController:[nav.viewControllers objectAtIndex:0]];
    [self.navigationController presentViewController:nav animated:YES completion:nil];
}
@end
