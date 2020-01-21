package board.command;

import board.dao.Dao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReplyCommand implements Command {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("Reply Command");
        String bId = request.getParameter("bId");
        String bName = request.getParameter("bName");
        String bTitle = request.getParameter("bTitle");
        String bContent = request.getParameter("bContent");
        String bGroup = request.getParameter("bGroup");
        String bStep = request.getParameter("bStep");
        String bIndent = request.getParameter("bIndent");

        System.out.println(bId);
        System.out.println(bName);
        System.out.println(bTitle);
        System.out.println(bContent);
        System.out.println(bGroup);


        Dao dao = new Dao();
        dao.reply(bId, bName, bTitle, bContent, bGroup, bStep, bIndent);
    }
}
