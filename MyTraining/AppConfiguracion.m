//
//  AppConfiguracion.m
//  Clase con procedimientos para recuperar archivos de configuración.
//
//  Created by Juan Manuel Marchese on 22-10-11.
//  Copyright (c) 2011 JMM. All rights reserved.
//

#import "AppConfiguracion.h"

@implementation AppConfiguracion

// Métodos de clase.

+(NSDictionary*)obtenerConfig {
    
    // Recupera el idioma del archivo de configuración
    NSString* pathConfig = [[NSBundle mainBundle] pathForResource:@"AppConfig" ofType:@"plist"];
    NSDictionary* configuracion = [[NSDictionary alloc] initWithContentsOfFile:pathConfig];
    return configuracion;
    
}

+(NSDictionary*)obtenerIdioma {
    
    // Recupera el archivo de configuración
    NSDictionary* archConfig = [self obtenerConfig];
    
    // Arma el nombre del archivo del idioma
    NSString* idioma = [archConfig objectForKey:@"Idioma"]; // Propiedad Idioma del archivo
    NSString* archivoIdioma = [[NSString alloc] initWithFormat:@"AppMensajes_%@",idioma];
    
    // Buscamos la ubicación del fichero de mensajes en los Recursos (Supporting Files).
    NSString* pathIdioma = [[NSBundle mainBundle] pathForResource:archivoIdioma ofType:@"plist"];
    
    // Se arma un diccionario con el contenido del archivo.
    NSDictionary* mensajesApp = [[NSDictionary alloc] initWithContentsOfFile:pathIdioma];
    return mensajesApp;
    
}

+(NSDictionary*)obtenerIdioma:(NSString*)idioma {
    
    // El idioma viene "forzado" como parámetro, no sale de la configuración
    NSString* archivoIdioma = [[NSString alloc] initWithFormat:@"AppMensajes_%@",idioma];
    
    // Buscamos la ubicación del fichero de mensajes en los Recursos (Supporting Files).
    NSString* pathIdioma = [[NSBundle mainBundle] pathForResource:archivoIdioma ofType:@"plist"];
    
    // Se arma un diccionario con el contenido del archivo.
    NSDictionary* mensajesApp = [[NSDictionary alloc] initWithContentsOfFile:pathIdioma];
    return mensajesApp;
    
}

@end
