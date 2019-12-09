<%@ page import="java.util.Enumeration" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Session Get </title>
</head>
<body>
    <%
        // Session 가져오기
        Object obj1 = session.getAttribute("mySessionName");
        String mySessionName = (String)obj1;
        out.println(mySessionName + "</br>");

        Object obj2 = session.getAttribute("myNum");
        Integer myNum = (Integer)obj2;
        out.println(myNum + "</br>");

        out.println("=============================</br>");

        // Session 속성 한번에 가져오기
        String sName;
        String sValue;

        Enumeration enumeration = session.getAttributeNames();
        while(enumeration.hasMoreElements()){
            sName = enumeration.nextElement().toString();
            sValue = session.getAttribute(sName).toString();
            out.println("sName : " + sName + "</br>");
            out.println("sValue : " + sValue + "</br>");
        }

        out.println("=============================</br>");

        // Session ID 가져오기
        String sessionID = session.getId();
        out.println("sessionID : " + sessionID + "</br>");

        // Session Interval 가져오기
        int sessionInter = session.getMaxInactiveInterval();
        out.println("sessionInterval : " + sessionInter + "</br>");

        out.println("=============================</br>");

        // Session 특정 속성 삭제하기
        session.removeAttribute("mySessionName");
        Enumeration enumeration1 = session.getAttributeNames();
        while(enumeration1.hasMoreElements()){
            sName = enumeration1.nextElement().toString();
            sValue = session.getAttribute(sName).toString();
            out.println("sName : " + sName + "</br>");
            out.println("sValue : " + sValue + "</br>");
        }

        out.println("=============================</br>");

        // Session 전체 삭제하기
        session.invalidate();
        if(request.isRequestedSessionIdValid()) {
            out.println("Session is valid.");
        }
        else {
            out.println("Session is invalid.");
        }
    %>
</body>
</html>
