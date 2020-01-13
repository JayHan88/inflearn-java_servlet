package tutorials;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/RequestObj2")
public class RequestObj2 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("DoPost");
        actionDo(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("DoGet");
        actionDo(request, response);
    }

    private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("actionDo");

        String id = (String)request.getAttribute("id");
        String pw = (String)request.getAttribute("pw");

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter writer = response.getWriter();
        writer.print("<html><head></head><body>");
        writer.print("RequestObj2" + "<hr/>");
        writer.print("id : " + id + "<br/>");
        writer.print("pw : " + pw );
        writer.print("</body></html>");
    }
}
