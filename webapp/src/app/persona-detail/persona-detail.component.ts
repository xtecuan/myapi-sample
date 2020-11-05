import { Component, OnInit, Input } from '@angular/core';
import {Persona} from '../personas/persona';

@Component({
  selector: 'app-persona-detail',
  templateUrl: './persona-detail.component.html',
  styleUrls: ['./persona-detail.component.css']
})
export class PersonaDetailComponent implements OnInit {

  @Input() persona: Persona;

  constructor() { }

  ngOnInit(): void {
  }

   
}
