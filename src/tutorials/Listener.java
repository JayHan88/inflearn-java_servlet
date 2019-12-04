package tutorials;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

// @WebListener
public class Listener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent arg0){
        System.out.println("Context Initialized");
    }
    @Override
    public void contextDestroyed(ServletContextEvent arg0){
        System.out.println("Context Destroyed");
    }
}
