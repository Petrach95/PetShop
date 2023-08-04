package it.betacom.logger;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
public class MyLogger {
	
	private static Logger logger = LogManager.getLogger("filename");
	
    
	public static void debug(String messaggio) {
		logger.debug(messaggio);
	}
    public static void info(String messaggio) {
    	logger.info(messaggio);
    }
    public static void warn(String messaggio) {
    	logger.warn(messaggio);
    }
    public static void error(String messaggio) {
    	logger.error(messaggio);
    }
    public static void fatal(String messaggio) {
    	logger.fatal(messaggio);
    }
}
