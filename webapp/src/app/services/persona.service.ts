import { Injectable } from '@angular/core';
import { Persona } from '../personas/persona';
import { PERSONAS } from '../personas/mock-personas';
import { Observable, of, pipe } from 'rxjs';
import { MessageService } from '../services/message.service';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../environments/environment';
import { catchError, map, tap } from 'rxjs/operators';
@Injectable({
  providedIn: 'root'
})
export class PersonaService {

  private personasUrl = environment.personasBaseUrl;

  constructor(
    private http: HttpClient,
    private messageService: MessageService
  ) { }

  /*getPersonas(): Observable<Persona[]> {
    this.log('fetched personas');
    return of(PERSONAS);
  }

  getPersona(id: number): Observable<Persona> {
    this.log(`fetched persona id=${id}`);
    return of(PERSONAS.find(persona => persona.id === id));
  }*/

  getPersonas(): Observable<Persona[]> {
    return this.http.get<Persona[]>(this.personasUrl)
      .pipe(
        tap(_ => this.log('fetched personas')),
        catchError(this.handleError<Persona[]>('getPersonas', [])));
  }

  getPersona(id: number): Observable<Persona> {
    ;
    return this.http.get<Persona>(`${this.personasUrl}/${id}`)
      .pipe(
        tap(_ => this.log(`fetched persona id=${id}`)),
        catchError(this.handleError<Persona>(`getPersona id=${id}`))
      );
  }

  httpOptions = {
    headers: new HttpHeaders({ 'Content-Type': 'application/json' })
  };

  updatePersona(persona: Persona): Observable<any> {
    return this.http.put(`${environment.personasBaseUrl}/${persona.id}`,
      persona,
      this.httpOptions)
    pipe(
      tap(_ => this.log(`updated hero id=${persona.id}`)),
      catchError(this.handleError<any>('updatePersona'))
    );
  }

  private log(message: string) {
    this.messageService.add(`PersonaService: ${message}`);
  }

  /**
 * Handle Http operation that failed.
 * Let the app continue.
 * @param operation - name of the operation that failed
 * @param result - optional value to return as the observable result
 */
  private handleError<T>(operation = 'operation', result?: T) {
    return (error: any): Observable<T> => {

      // TODO: send the error to remote logging infrastructure
      console.error(error); // log to console instead

      // TODO: better job of transforming error for user consumption
      this.log(`${operation} failed: ${error.message}`);

      // Let the app keep running by returning an empty result.
      return of(result as T);
    };
  }

}
