package tutorials;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

public class FormEx extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String [] hobby = request.getParameterValues("hobby");
        String major = request.getParameter("major");
        String protocol = request.getParameter("protocol");

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter writer = response.getWriter();

        writer.println("<html><head></head><body>");
        writer.println("이름 : " + name + "</br>");
        writer.println("아이디 : " + id + "</br>");
        writer.println("패스워드 : " + pw + "</br>");
        writer.println("취미 : " + Arrays.toString(hobby) +"</br>");
        writer.println("전공 : " + major + "</br>");
        writer.println("프로토콜 : " + protocol);
        writer.println("</body></html>");
        writer.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
