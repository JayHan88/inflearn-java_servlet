package board.command;

import board.dao.Dao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WriteCommand implements Command {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        String userId = request.getParameter("userId");
        String bName = request.getParameter("bName");
        String bTitle = request.getParameter("bTitle");
        String bContent = request.getParameter("bContent");

        Dao dao = new Dao();
        dao.write(userId, bTitle, bName, bContent);
    }
}
