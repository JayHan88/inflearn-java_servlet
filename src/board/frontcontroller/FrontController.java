package board.frontcontroller;

import board.command.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("*.bo")
public class FrontController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("doPost");
        String userId = request.getParameter("userId");
        System.out.println(userId);
        actionDo(request, response, userId);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("doGet");
        String userId = request.getParameter("userId");
        actionDo(request, response, userId);
    }

    private void actionDo(HttpServletRequest request, HttpServletResponse response, String userId) throws ServletException, IOException {
        System.out.println("actionDo");
        System.out.println(userId);
        request.setCharacterEncoding("UTF-8");
        request.setAttribute("userId", userId);

        String viewPage = null; // 요청을 받은 뒤에 어떤 view를 호출할 것인지 저장하는 변수
        Command command = null; // 어떤 command를 사용할 것인지 결정하는 객체
        String uri = request.getRequestURI();
        System.out.println("uri = " + uri);
        System.out.println("userId = " + userId);

        if(uri.equals("/Board/write_view.bo")) {
            viewPage = "write_view.jsp";
        } else if(uri.equals("/Board/write.bo")) {
            command = new WriteCommand();
            command.execute(request, response);
            viewPage = "list.bo";
        } else if(uri.equals("/Board/list.bo")) {
            command = new ListCommand();
            command.execute(request, response);
            viewPage = "list.jsp";
        } else if(uri.equals("/Board/content_view.bo")) {
            command = new ContentCommand();
            command.execute(request, response);
            viewPage = "content_view.jsp";
        } else if(uri.equals("/Board/modify.bo")) {
            command = new ModifyCommand();
            command.execute(request, response);
            viewPage = "list.bo";
        } else if(uri.equals("/Board/delete.bo")) {
            command = new DeleteCommand();
            command.execute(request, response);
            viewPage = "list.bo";
        } else if(uri.equals("/Board/reply_view.bo")) {
            command = new ReplyViewCommand();
            command.execute(request, response);
            viewPage = "reply_view.jsp";
        } else if(uri.equals("/Board/reply.bo")) {
            command = new ReplyCommand();
            command.execute(request, response);
            viewPage = "list.bo";
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
        dispatcher.forward(request, response);
    }
}
