package board.command;

import board.dao.Dao;
import board.dto.Dto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ContentCommand implements Command {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        String bId = request.getParameter( "bId");
        Dao dao = new Dao();
        Dto dto = dao.contentView(bId);
        request.setAttribute("content_view", dto);
    }
}
