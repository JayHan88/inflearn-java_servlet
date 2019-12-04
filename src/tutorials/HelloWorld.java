package tutorials;

import java.io.IOException;
import java.io.PrintWriter;

public class HelloWorld extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        System.out.println("doPost");
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        System.out.println("doGet");

        response.setContentType("text/html; charset=euc-kr");
        PrintWriter writer = response.getWriter();

        writer.println("<html>");
        writer.println("<head>");
        writer.println("</head>");
        writer.println("<body>");
        writer.println("<h1> Hello World </h1>");
        writer.println("</body>");
        writer.println("</html>");

        writer.close();
    }
}
