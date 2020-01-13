package JoinLoginApp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class MemberAllService implements Service {

    @Override
    public ArrayList<MemberDto> execute (HttpServletRequest request, HttpServletResponse response) {
        MemberDao dao = MemberDao.getInstance();
        return dao.memberAll();
    }
}
