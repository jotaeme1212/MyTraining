//
//  ViewController.h
//  MyTraining
//
//  Created by Juan Manuel Marchese on 30-10-11.
//  Copyright (c) 2011 JMM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>	
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *texto;
@property (weak, nonatomic) IBOutlet UIButton *botLenguaje;

@property (weak, nonatomic) IBOutlet MKMapView *mapa;

@property (nonatomic, retain) CLLocation *puntoPartida;
@property (nonatomic, retain) CLLocationManager *locationManager;

- (IBAction)cambiarLenguaje:(id)sender;

@end
