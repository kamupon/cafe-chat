package net.kamupon.chat.server.resource;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import org.glassfish.jersey.server.mvc.Template;

import net.kamupon.chat.server.dto.IndexViewDto;

/**
 * トップページのリソース
 * --------------------------------------
 * @author honda
 */
@Path("/")
public class IndexResource {
    @Inject
    protected EntityManager em;
    
    @Context
    protected HttpServletRequest request;
    
    @GET
    @Produces(MediaType.TEXT_HTML)
    @Template(name = "/index/index.jsp")
    public IndexViewDto index() {
        IndexViewDto dto = new IndexViewDto();
        
        return dto;
    }
}
