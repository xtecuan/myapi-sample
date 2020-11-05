import { Injectable } from '@angular/core';
import { Persona } from '../personas/persona';
import { PERSONAS } from '../personas/mock-personas';
import { Observable, of } from 'rxjs';
import {MessageService} from '../services/message.service'

@Injectable({
  providedIn: 'root'
})
export class PersonaService {

  constructor(private messageService : MessageService) { }

  getPersonas(): Observable<Persona[]> {
    this.messageService.add('PersonaService: fetched personas');
    return of(PERSONAS);
  }
}
