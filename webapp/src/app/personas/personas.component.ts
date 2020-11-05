import { Component, OnInit } from '@angular/core';
import {Persona} from '../personas/persona';
import {PERSONAS} from '../personas/mock-personas';
import {PersonaService} from '../services/persona.service';
import { MessageService } from '../services/message.service';

@Component({
  selector: 'app-personas',
  templateUrl: './personas.component.html',
  styleUrls: ['./personas.component.css']
})
export class PersonasComponent implements OnInit {

  constructor(private personaService: PersonaService,private messageService: MessageService) { }

  ngOnInit(): void {
    this.getPersonas();
  }

  persona : Persona = {
    id: 1,
    nombres : 'Tadeo',
    apellidos : 'Rivera-Pineda',
    email: 'xtecuanufo@gmail.com',
    usuario : 'xtecuan',
    nota: 9.78
  };

  selectedPersona : Persona;

  onSelect(cpersona: Persona) : void{
    this.selectedPersona = cpersona;
    this.messageService.add(`PersonasComponent: Selected persona id=${cpersona.id}`);
  }

  personas : Persona[];

  getPersonas() : void {
    this.personaService.getPersonas().subscribe(personas => this.personas = personas);
  }

}
