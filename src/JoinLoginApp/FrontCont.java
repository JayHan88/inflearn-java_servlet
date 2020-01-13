package JoinLoginApp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;

@WebServlet("*.doo")
public class FrontCont extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("doPost");
        actionDo(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("doGet");
        actionDo(request, response);
    }

    private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        System.out.println("uri = " + uri);

        if (uri.equals("/JoinLoginApp/MemberAll.doo")) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter writer = response.getWriter();
            writer.println("<html><head></head><body>");

            Service service = new MemberAllService();
            ArrayList<MemberDto> dtos = service.execute(request, response);

            for (int i = 0; i < dtos.size(); i++) {
                MemberDto dto = dtos.get(i);

                String id = dto.getId();
                String pw = dto.getPw();
                String name = dto.getName();
                String eMail = dto.getEmail();
                Timestamp rDate = dto.getRdate();
                String address = dto.getAddress();

                writer.println(id + ", " + pw + "," + name + "," + eMail + "," + rDate + "," + address + "<hr/>");
            }
            writer.println("</body></html>");
        }
    }
}
