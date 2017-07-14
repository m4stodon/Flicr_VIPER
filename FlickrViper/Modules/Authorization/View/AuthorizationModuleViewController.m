//
//  TabBarViewController.m
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


#import "AuthorizationModuleViewController.h"
#import "AuthorizationModuleViewOutput.h"
#import "TabEntity.h"


@interface AuthorizationModuleViewController() <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *loginScreenTitle;
@property (weak, nonatomic) IBOutlet UITextField *loginTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end


@implementation AuthorizationModuleViewController

- (void)pushVC:(UIViewController *)viewController {
    [self presentViewController: viewController animated: true completion: nil];
}

#pragma mark - Lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"AuthorizationModuleViewController::ViewDidLoad::%@", self);
    
    [self setupIndicators];
    [self setupTextFields];
    [self setupButtons];
    [self setupGestures];
}

- (void)setupIndicators {
    [self.activityIndicator stopAnimating];
    [self.activityIndicator setHidden: YES];
}

- (void)setupTextFields {
    self.loginTextField.delegate    = self;
    self.passwordTextField.delegate = self;
}

- (void)setupButtons {
    self.loginButton.layer.cornerRadius = 10;
}

- (void)setupGestures {
    UITapGestureRecognizer* touch = [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector(touchGesture)];
    [self.view addGestureRecognizer: touch];
}

- (void)touchGesture {
    [self.loginTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}


#pragma mark - AuthorizationModuleViewInput


- (void)startProcessing {
    [self.loginTextField    setEnabled: NO];
    [self.passwordTextField setEnabled: NO];
    [self.loginButton       setEnabled: NO];
    [self.activityIndicator startAnimating];
    [self.activityIndicator setHidden: NO];
}

- (void)stopProcessing {
    [self.loginTextField    setEnabled: YES];
    [self.passwordTextField setEnabled: YES];
    [self.loginButton       setEnabled: YES];
    [self.activityIndicator stopAnimating];
    [self.activityIndicator setHidden: YES];    
}


#pragma mark - Actions


- (IBAction)loginButtonDidPressed: (UIButton *)sender {
    
    NSString* login    = [self.loginTextField.text stringByTrimmingCharactersInSet: NSCharacterSet.whitespaceAndNewlineCharacterSet];
    login = [login lowercaseString];
    
    NSString* password = [self.passwordTextField.text stringByTrimmingCharactersInSet: NSCharacterSet.newlineCharacterSet];
    password = [password lowercaseString];
    
    [self.output loginWithCredentials: login password: password];
}



@end
