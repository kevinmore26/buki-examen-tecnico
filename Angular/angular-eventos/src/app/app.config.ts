import { ApplicationConfig } from '@angular/core';
import { provideRouter } from '@angular/router';
import { provideHttpClient } from '@angular/common/http';  // 💡 Importamos HttpClient

export const appConfig: ApplicationConfig = {
  providers: [
    provideRouter([]),
    provideHttpClient()  // 💡 Esto permite hacer peticiones HTTP
  ]
};
