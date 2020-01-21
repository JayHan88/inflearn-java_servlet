package board.command;

import board.dao.Dao;
import board.dto.Dto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class ListCommand implements Command{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        String userId = request.getAttribute("userId").toString();
        request.setAttribute("userId", userId);

        Dao dao = new Dao(); // Dao 객체 생성
        ArrayList<Dto> dtos = dao.list(); // Dao 객체에서 list 메소드 호출, dtos를 받아 옴
        request.setAttribute("list", dtos); // request 객체의 list 속성에 dtos를 담음
    }
}
