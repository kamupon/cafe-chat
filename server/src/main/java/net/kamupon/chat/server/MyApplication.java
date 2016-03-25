package net.kamupon.chat.server;

import javax.ws.rs.ApplicationPath;

import org.glassfish.jersey.server.ResourceConfig;
import org.glassfish.jersey.server.mvc.jsp.JspMvcFeature;

/**
 * サーバの起動時設定.
 * ---------------------------------
 * @author honda
 */
@ApplicationPath("/")
public class MyApplication extends ResourceConfig {
    
    public MyApplication(){
        packages("net.kamupon.chat.server");
        
        register(JspMvcFeature.class);
        property(JspMvcFeature.TEMPLATE_BASE_PATH, "/WEB-INF/view");
    }
}
