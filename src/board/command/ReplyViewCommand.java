package board.command;

import board.dao.Dao;
import board.dto.Dto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReplyViewCommand implements Command {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response){
        System.out.println("ReplyView Command");
        String bId = request.getParameter("bId");
        Dao dao = new Dao();
        Dto dto = dao.reply_view(bId);

        request.setAttribute("reply_view", dto);
    }
}