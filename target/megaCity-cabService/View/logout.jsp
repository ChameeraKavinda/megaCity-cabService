<%@ page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession session1 = request.getSession(false);
    if (session1 != null) {
        session1.invalidate();
    }
%>
<script>
    window.close(); 
</script>
