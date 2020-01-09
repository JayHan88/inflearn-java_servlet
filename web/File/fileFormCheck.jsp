<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.Enumeration" %>
<%
    String path = request.getSession().getServletContext().getRealPath("FileFolder");
    // path = /Users/jay/Java/java_servlet/out/artifacts/java_servlet_war_exploded/FileFolder

    int size = 1024 *1024 * 10; // 10MB
    String file = ""; // 업로드한 파일의 이름
    String oriFile = ""; // 파일 이름 인덱싱 전의 이름

    try {
        MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy()); // parameter : request 객체, 저장될 서버 경로, 파일 최대 크기, 인코딩 방식, 같은 이름 파일명 방지 처리

        Enumeration files = multi.getFileNames();
        String str = files.nextElement().toString();

        file = multi.getFilesystemName(str);
        oriFile = multi.getOriginalFileName(str);
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> File Form Check</title>
</head>
<body>
File is successfully uploaded.
</body>
</html>