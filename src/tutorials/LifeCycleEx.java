package tutorials;

import com.sun.xml.internal.ws.policy.privateutil.PolicyUtils;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LifeCycleEx extends HttpServlet {

    @PostConstruct
    private void initPostConstructor() {
        System.out.println("initPostConstructor");
    }

    @Override
    public void init() throws ServletException{
        System.out.println("init");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("doPost");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("doGet");
    }

    @Override
    public void destroy() {
        System.out.println("destroy");
    }

    @PreDestroy
    private void destroyPreDestroy() {
        System.out.println("destroyPreDestroy");
    }
}
