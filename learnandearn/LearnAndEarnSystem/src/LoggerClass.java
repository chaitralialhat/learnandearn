

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
//Driver file to initiate execution.
	public class LoggerClass {  
		Logger logger;
		private LoggerClass(){
			logger=Logger.getLogger(LoggerClass.class);
			PropertyConfigurator.configure(LoggerClass.class.getProtectionDomain().getCodeSource().getLocation().getPath()+"log4j.properties");
		}
		public static LoggerClass getLoggerInstance(){
			return new LoggerClass();
		}	
	}
