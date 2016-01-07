package net.kamupon.chat.server.producer;

import java.util.logging.Logger;
import javax.enterprise.inject.spi.InjectionPoint;
import javax.ws.rs.Produces;

/**
 *
 * @author honda
 */
public class LoggerProducer {
    /** 外部ログメッセージファイルの名称 */
    private static final String RESOURCE_BUNDLE_NAME = "logMessages";
    
    @Produces
    public Logger getLogger(InjectionPoint ip){
        final String loggerName = ip.getMember().getDeclaringClass().getName();
        
        return Logger.getLogger(loggerName, RESOURCE_BUNDLE_NAME);
    }
}
