package JoinLoginApp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public interface Service {
    public ArrayList<MemberDto> execute (HttpServletRequest request, HttpServletResponse response);
}
