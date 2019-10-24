
    <%@page import="com.qf.pojo.Person"%>
    <%@page import="java.util.List"%>
    <%@page import="java.util.ArrayList"%>
    <%@ page language="java" contentType="text/html; charset=UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

    List<Person> persons = new ArrayList<Person>();
    Person person1 = new Person();
    person1.setAge(12);
     person1.setName("小明");
    persons.add(person1);
    Person person2 = new Person();
     person2.setAge(13);
     person2.setName("阿飞");
   persons.add(person2);
    request.setAttribute("persons", persons);


%>
    <html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSTL逆序循环</title>
    </head>
    <body>
        <div>正序</div>
    <div>
                <table>
                    <thead>
                    <tr>
                            <th>年龄</th>
                            <th>姓名</th>
                        </tr>
                </thead>
                    <tbody>
                    <c:forEach var="person" items="${persons }">
                            <tr>
                                <td>${person.age }</td>
                                <td>${person.name }</td>
                        </tr>
                        </c:forEach>
                </tbody>
                </table>
            </div>
        <br />
    <div>逆序</div>
        <div>
                <table>
                    <thead>
                    <tr>
                            <th>年龄</th>
                            <th>姓名</th>
                        </tr>
                </thead>
                    <tbody>
                    <c:set var="startIndex" value="${fn:length(persons)-1 }"></c:set>
                    <c:forEach var="person" items="${persons }" varStatus="status">
                            <tr>
                                <td>${persons[startIndex - status.index].age }</td>
                                <td>${persons[startIndex - status.index].name }</td>
                            </tr>
                        </c:forEach>
                </tbody>
                </table>
            </div>
        <br />
    </body>
    </html>

