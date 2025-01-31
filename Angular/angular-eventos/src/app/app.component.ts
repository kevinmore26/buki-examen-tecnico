import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';  
import { EventosService } from './eventos.service';  
import { EventosComponent } from './eventos/eventos.component';  

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [EventosComponent],  
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  title = 'angular-eventos';  // 💡 Agregamos la propiedad title
  eventos: any[] = [];

  constructor(private eventosService: EventosService) {}

  ngOnInit() {
    this.eventosService.obtenerEventos().subscribe(data => {
      this.eventos = data;
    }, error => {
      console.error("❌ Error al obtener eventos:", error);
    });
  }
}
