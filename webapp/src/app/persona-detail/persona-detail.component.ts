import { Component, OnInit, Input } from '@angular/core';
import { Persona } from '../personas/persona';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { PersonaService } from '../services/persona.service';


@Component({
  selector: 'app-persona-detail',
  templateUrl: './persona-detail.component.html',
  styleUrls: ['./persona-detail.component.css']
})
export class PersonaDetailComponent implements OnInit {

  @Input() persona: Persona;

  constructor(
    private route: ActivatedRoute,
    private personaService: PersonaService,
    private location: Location
  ) { }

  ngOnInit(): void {
    this.getPersona();
  }

  getPersona(): void {
    const id: number = +this.route.snapshot.paramMap.get('id');
    this.personaService.getPersona(id)
      .subscribe(persona => this.persona = persona);
  }

  goBack(): void {
    this.location.back();
  }

  save(): void {
    this.personaService.updatePersona(this.persona)
      .subscribe(() => this.goBack());
  }

}
