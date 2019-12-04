package tutorials;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

// Using web.xml
public class ServletInitParam extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //Servlet Config method : getInitParameter
        String id = getInitParameter("id");
        String pw = getInitParameter("pw");
        String path = getInitParameter("path");

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter writer = response.getWriter();

        writer.println("<html><head></head><body>");
        writer.println("아이디 : " + id + "</br>");
        writer.println("패스워드 : " + pw + "</br>");
        writer.println("PATH : " + path);
        writer.println("</body></html>");

        writer.close();
    }
}
