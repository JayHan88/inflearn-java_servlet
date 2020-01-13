package tutorials;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("*.do")
public class FrontCon extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("doPost");
        actionDo(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("doGet");
        actionDo(request,response);
    }

    private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("actionDo");

        String uri = request.getRequestURI();
        System.out.println("uri :" + uri);
        String conPath = request.getContextPath();
        System.out.println("context path : " + conPath);
        String command = uri.substring(conPath.length());
        System.out.println("command : " + command);

        if(command.equals("/Pattern/insert.do")) {
            System.out.println("insert");
            System.out.println("---------");
        } else if(command.equals("/Pattern/update.do")) {
            System.out.println("update");
            System.out.println("---------");
        } else if(command.equals("/Pattern/select.do")) {
            System.out.println("select");
            System.out.println("---------");
        } else if(command.equals("/Pattern/delete.do")) {
            System.out.println("delete");
            System.out.println("---------");
        }
    }
}
