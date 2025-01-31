import { Component, Input, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-eventos',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './eventos.component.html',
  styleUrls: ['./eventos.component.css']
})
export class EventosComponent implements OnInit {
  @Input() eventos: any[] = [];

  ngOnInit() {
    this.eventos = this.eventos.map(evento => ({
      ...evento,
      fecha: new Date(evento.fecha),  // 💡 Convierte la fecha a objeto Date
      hora: this.formatHora(evento.hora)  // 💡 Convierte la hora a formato legible
    }));
  }

  formatHora(horaStr: string): string {
    if (!horaStr) return 'Hora no disponible';

    const [horas, minutos] = horaStr.split(':').map(Number);
    const ampm = horas >= 12 ? 'PM' : 'AM';
    const horas12 = horas % 12 || 12; // Convierte 00:00 a 12 AM
    return `${horas12}:${minutos.toString().padStart(2, '0')} ${ampm}`;
  }

}
