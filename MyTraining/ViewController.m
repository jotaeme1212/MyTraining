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
@synthesize mapa;
@synthesize puntoPartida;
@synthesize locationManager;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad {

    // Esto se usa para localización, para medir puntos, distancias, GPS, etc.
	self.locationManager = [[CLLocationManager alloc] init];
	locationManager.delegate = self; // Este controlador implementa los métodos del protocolo de Localización.
	locationManager.desiredAccuracy = kCLLocationAccuracyBest; // Mejor aproximación, primero GPS (si hay), Wi-Fi, etc.
    [locationManager startUpdatingLocation]; // Empieza a emitir el método de didUpdateToLocation (para saca localización).
    [mapa setShowsUserLocation:YES];

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    // Recupera el archivo de idioma para armar el diccionario de mensajes.
    // NSDictionary *diccTextos = [AppConfiguracion obtenerIdioma:@"en"]; // Idioma forzado
    NSDictionary *diccTextos = [AppConfiguracion obtenerIdioma]; // Idioma de la configuración

    // Conociendo la clave, accedemos a la propiedad.
    texto.text = [diccTextos objectForKey:@"TextoInicial"];
    [botLenguaje setTitle:[diccTextos objectForKey:@"botonIdioma"]forState:0];
}

- (void)viewDidUnload
{
    [self setTexto:nil];
    [self setBotLenguaje:nil];
    [self setMapa:nil];
    [self setPuntoPartida:nil];
    [self setLocationManager:nil];
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

// En este método se eligen las rotaciones válidas.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Métodos de la barra de botones

- (IBAction)cambiarLenguaje:(id)sender {

}

#pragma mark - Implementación de los metodos de CLLocationManagerDelegate

// Este método responde cada cierto período la nueva ubicación del usuario.
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    
    NSString *latitudStr;
	NSString *longitudStr;
	NSString *distanciaStr;
    
	if (puntoPartida == nil) { self.puntoPartida = newLocation; }

    CLLocationDistance distanciaActual = [newLocation distanceFromLocation:puntoPartida] / 1000;

	latitudStr   = [[NSString alloc] initWithFormat:@"%g", newLocation.coordinate.latitude];	
	longitudStr  = [[NSString alloc] initWithFormat:@"%g", newLocation.coordinate.longitude];
	distanciaStr = [[NSString alloc] initWithFormat:@"%gkm", distanciaActual];
    
	//longitud.text = longitudStr;
	//latitud.text = latitudStr;
	//distancia.text = distanciaStr;

	NSLog(@"Latitud: %@", latitudStr);
	NSLog(@"Longitud: %@", longitudStr);
    
	MKCoordinateRegion region;
    region.center.latitude = newLocation.coordinate.latitude;
    region.center.longitude = newLocation.coordinate.longitude;
    region.span.longitudeDelta = 0.01;
    region.span.latitudeDelta = 0.01;

	[mapa setRegion:region animated:YES];

}

// Método que da error por si no es posible obtener el acceso al sistema, por usuario u otro error.
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    
	NSString *tipoError;
	
	if (error.code == kCLErrorDenied) { tipoError = @"Acceso denegado"; }
	else { tipoError = @"Error desconocido"; }
    
	UIAlertView *alerta = [[UIAlertView alloc] 
						   initWithTitle:@"ERROR LOCALIZANDO" 
						   message:tipoError 
						   delegate:nil 
						   cancelButtonTitle:@"Aceptar" 
						   otherButtonTitles:nil];
	[alerta show];
    
}

@end
