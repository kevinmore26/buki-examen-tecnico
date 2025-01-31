import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({ providedIn: 'root' })
export class EventosService {
  private apiUrl = 'http://localhost:3000/eventos';  // 💡 URL del backend

  constructor(private http: HttpClient) {}

  obtenerEventos(): Observable<any[]> {
    return this.http.get<any[]>(this.apiUrl);
  }
}
