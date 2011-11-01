//
//  ViewController.m
//  MyTraining
//
//  Created by Juan Manuel Marchese on 30-10-11.
//  Copyright (c) 2011 JMM. All rights reserved.
//

#import "ViewController.h"
#import "AppConfiguracion.h"

@implementation ViewController
@synthesize texto;
@synthesize botLenguaje;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    // Recupera el archivo de idioma para armar el diccionario de mensajes.
    //NSDictionary *diccTextos = [AppConfiguracion obtenerIdioma:@"en"]; // Idioma forzado
    NSDictionary *diccTextos = [AppConfiguracion obtenerIdioma]; // Idioma de la configuración

    // Conociendo la clave, accedemos a la propiedad.
    texto.text = [diccTextos objectForKey:@"TextoInicial"];
    [botLenguaje setTitle:[diccTextos objectForKey:@"botonIdioma"]forState:0];

}

- (void)viewDidUnload
{
    [self setTexto:nil];
    [self setBotLenguaje:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)cambiarLenguaje:(id)sender {

}

@end
