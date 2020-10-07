/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.livejournal.xtecuan.samples.repository;

import com.livejournal.xtecuan.samples.entities.Personas;
import io.quarkus.hibernate.orm.panache.PanacheRepositoryBase;
import javax.enterprise.context.ApplicationScoped;

/**
 *
 * @author xtecuan
 */
@ApplicationScoped
public class PersonasRepository implements PanacheRepositoryBase<Personas,Long>{
    
}
