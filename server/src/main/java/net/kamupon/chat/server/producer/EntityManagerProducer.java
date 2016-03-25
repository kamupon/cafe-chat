package net.kamupon.chat.server.producer;

import javax.enterprise.context.Dependent;
import javax.enterprise.inject.Produces;
import javax.inject.Named;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * EntityManagerのプロデューサ.
 * ------------------------------------
 * @author honda
 */
@Named
@Dependent
public class EntityManagerProducer {
    
    @PersistenceContext(unitName = "local")
    private EntityManager localManager;
    
    @Produces
    public EntityManager localEntityManager(){
        return this.localManager;
    }
    
}
