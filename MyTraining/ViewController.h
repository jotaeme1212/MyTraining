//
//  ViewController.h
//  MyTraining
//
//  Created by Juan Manuel Marchese on 30-10-11.
//  Copyright (c) 2011 JMM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *texto;
@property (weak, nonatomic) IBOutlet UIButton *botLenguaje;

- (IBAction)cambiarLenguaje:(id)sender;

@end
