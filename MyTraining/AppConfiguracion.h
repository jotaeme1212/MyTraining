//
//  AppConfiguracion.h
//  Clase con procedimientos para recuperar archivos de configuración.
//
//  Created by Juan Manuel Marchese on 22-10-11.
//  Copyright (c) 2011 JMM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppConfiguracion

// Métodos de clase.

// Obtiene el archivo de configuración de la aplicación y lo retorna en un diccionario.
+(NSDictionary*)obtenerConfig;

// Obtiene y arma un diccionario con los textos de la vista, de acuerdo al idioma de la configuración.
+(NSDictionary*)obtenerIdioma;

// Obtiene y arma un diccionario con los textos de la vista, de acuerdo al idioma informado.
+(NSDictionary*)obtenerIdioma:(NSString*)idioma;

@end
