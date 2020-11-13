import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { PersonasComponent } from './personas/personas.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import {PersonaDetailComponent} from './persona-detail/persona-detail.component';

const routes: Routes = [
  { path: 'personas', component: PersonasComponent },
  { path: 'dashboard', component: DashboardComponent },
  { path: '', redirectTo: '/dashboard', pathMatch: 'full' },
  { path: 'detail/:id', component: PersonaDetailComponent }
];

@NgModule({
  declarations: [],
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
