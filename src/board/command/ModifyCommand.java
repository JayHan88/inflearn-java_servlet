package board.command;

import board.dao.Dao;
import board.dto.Dto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ModifyCommand implements Command {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        String bId = request.getParameter("bId");
        String bName = request.getParameter("bName");
        String bTitle = request.getParameter("bTitle");
        String bContent = request.getParameter("bContent");

        Dao dao = new Dao();
        dao.modify(bId, bName, bTitle, bContent);

    }
}
