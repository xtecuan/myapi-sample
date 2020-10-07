/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.livejournal.xtecuan.samples.resources;

import com.livejournal.xtecuan.samples.entities.Personas;
import com.livejournal.xtecuan.samples.repository.PersonasRepository;
import java.util.List;
import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.json.Json;
import javax.transaction.Transactional;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.Response;
import javax.ws.rs.ext.ExceptionMapper;
import javax.ws.rs.ext.Provider;

/**
 *
 * @author xtecuan
 */
@Path("personas")
@ApplicationScoped
@Produces("application/json")
@Consumes("application/json")
public class PersonasResource {
    @Inject
    PersonasRepository personasRepository;

    @GET
    public List<Personas> get() {
        return personasRepository.listAll();
    }

    @GET
    @Path("{id}")
    public Personas getSingle(@PathParam("id") Long id) {
        Personas entity = personasRepository.findById(id);
        if (entity == null) {
            throw new WebApplicationException("Persona with id of " + id + " does not exist.", 404);
        }
        return entity;
    }

    @POST
    @Transactional
    public Response create(Personas persona) {
        if (persona.getId() != null) {
            throw new WebApplicationException("Id was invalidly set on request.", 422);
        }

        personasRepository.persist(persona);
        return Response.ok(persona).status(201).build();
    }
    
    @PUT
    @Path("{id}")
    @Transactional
    public Personas update(@PathParam("id") Long id, Personas persona) {
      
        if (persona.getUsuario() == null) {
            throw new WebApplicationException("Persona usuario was not set on request.", 422);
        }
        
        if (persona.getEmail() == null) {
            throw new WebApplicationException("Persona email was not set on request.", 422);
        }

        Personas entity = personasRepository.findById(id);

        if (entity == null) {
            throw new WebApplicationException("Persona with id of " + id + " does not exist.", 404);
        }
        
       entity.setUsuario(persona.getUsuario());
       entity.setEmail(persona.getEmail());
       if(persona.getNombres()!=null && !persona.getNombres().equals("")){
           entity.setNombres(persona.getNombres());
       }
       if(persona.getApellidos()!=null && !persona.getApellidos().equals("")){
           entity.setApellidos(persona.getApellidos());
       }
        
        personasRepository.persist(entity);

        return entity;
    }
    
    @DELETE
    @Path("{id}")
    @Transactional
    public Response delete(@PathParam("id") Long id) {
        Personas entity = personasRepository.findById(id);
        if (entity == null) {
            throw new WebApplicationException("Persona with id of " + id + " does not exist.", 404);
        }
        personasRepository.delete(entity);
        return Response.status(204).build();
    }

    @Provider
    public static class ErrorMapper implements ExceptionMapper<Exception> {

        @Override
        public Response toResponse(Exception exception) {
            int code = 500;
            if (exception instanceof WebApplicationException) {
                code = ((WebApplicationException) exception).getResponse().getStatus();
            }
            return Response.status(code)
                    .entity(Json.createObjectBuilder().add("error", exception.getMessage()).add("code", code).build())
                    .build();
        }

    }
}
