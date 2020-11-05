import { Injectable } from '@angular/core';
import { Persona } from '../personas/persona';
import { PERSONAS } from '../personas/mock-personas';
import { Observable, of } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class PersonaService {

  constructor() { }

  getPersonas(): Observable<Persona[]> {
    return of(PERSONAS);
  }
}
