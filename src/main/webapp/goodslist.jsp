<%--
  Created by IntelliJ IDEA.
  User: Shinelon
  Date: 2019/10/23
  Time: 8:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page isELIgnored="false" %>
    <ul class="subnav fl">
<c:forEach items="${goodslist}" var="goodslists">
        <li><a class="${goodslists.classname}" href="#${goodslists.banner}">${goodslists.title}</a></li>
</c:forEach>
    </ul>


<%--<c:forEach items="${goodslist}" var="goodslists">--%>
<%--    ${goodslists.goodsid}<br>--%>
<%--    ${goodslists.title}<br>--%>
<%--    ${goodslists.classname}<br>--%>
<%--    ${goodslists.banner}<br>--%>

<%--</c:forEach>--%>




