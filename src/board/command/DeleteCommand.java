package board.command;

import board.dao.Dao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteCommand implements Command {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response){
        System.out.println("Delete Command");
        String bId = request.getParameter("bId");
        Dao dao = new Dao();
        dao.delete(bId);
    }
}
