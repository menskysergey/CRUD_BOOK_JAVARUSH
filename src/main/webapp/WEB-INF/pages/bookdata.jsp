<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<html>
<head>
    <title>BookData</title>

    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }

        .tg .tg-4eph {
            background-color: #f9f9f9
        }
    </style>

</head>
<body>
<h1>Book Details</h1>

<table class="tg">
    <tr>
        <th>id</th>
        <th>title</th>
        <th>description</th>
        <th>author</th>
        <th>isbn</th>
        <th>printYear</th>
        <th>readAlready</th>

    </tr>
    <tr>
        <td>${book.id}</td>
        <td>${book.title}</td>
        <td>${book.description}</td>
        <td>${book.author}</td>
        <td>${book.isbn}</td>
        <td>${book.printYear}</td>
        <td>${book.readAlready}</td>

    </tr>
</table>
<div class="w3-container">

    <c:if test="${empty search.searchString}">

        <c:if test="${!empty book.title}">
            <h2>Read book:</h2>
        </c:if>

        <c:if test="${empty book.title}">
            <h2>Create book:</h2>
        </c:if>

        <c:url var="addAction" value="/books/add"/>
        <form:form action="${addAction}" commandName="book">
            <table class="w3-border" style="padding: 5px">
                <c:if test="${!empty book.title}">
                    <tr>
                        <td>
                            <form:label path="id">
                                <spring:message text="Id" />
                            </form:label>
                        </td>
                        <td>
                            <form:input path="id" readonly="true" cssStyle="background-color: lightgrey; color: gray" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="author">
                                <spring:message text="Author" />
                            </form:label>
                        </td>
                        <td>
                            <form:input path="author" readonly="true" cssStyle="background-color: lightgrey; color: gray" />
                        </td>
                    </tr>

                </c:if>
                <tr>
                    <td>
                        <form:label path="title">
                            <spring:message text="Title" />
                        </form:label>
                    </td>
                    <td>
                        <form:input path="title" readonly="true" cssStyle="background-color: lightgrey; color: gray"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="description">
                            <spring:message text="Description" />
                        </form:label>
                    </td>
                    <td>
                        <form:input path="description" readonly="true" cssStyle="background-color: lightgrey; color: gray"/>
                    </td>
                </tr>
                <c:if test="${empty book.title}">
                <tr>
                    <td>
                        <form:label path="author">
                            <spring:message text="Author" />
                        </form:label>
                    </td>
                    <td>
                        <form:input path="author" readonly="true" cssStyle="background-color: lightgrey; color: gray" />
                    </td>
                </tr>
                <tr>
                    </c:if>
                    <td>
                        <form:label path="isbn">
                            <spring:message text="Isbn" />
                        </form:label>
                    </td>
                    <td>
                        <form:input path="isbn" readonly="true" cssStyle="background-color: lightgrey; color: gray"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="printYear">
                            <spring:message text="PrintYear" />
                        </form:label>
                    </td>
                    <td>
                        <form:input path="printYear" readonly="true" cssStyle="background-color: lightgrey; color: gray"/>
                    </td>
                </tr>
                <c:if test="${book.readAlready == false}">
                <tr>
                    <td>
                        <form:label path="readAlready">
                            <spring:message text="ReadAlready" />
                        </form:label>
                    </td>
                    <td>
                        <form:checkbox path="readAlready"/>
                    </td>
                </tr>
                </c:if>
                <tr>
                    <td colspan="2">
                        <c:if test="${!empty book.title}">
                        <c:if test="${book.readAlready == false}">
                            <input type="submit" value="<spring:message text="Read book" />"
                        </c:if>
                        </c:if>
                        <c:if test="${empty book.title}">
                            <input type="submit" value="<spring:message text="Create book" />"
                        </c:if>
                    </td>
                </tr>
            </table>
        </form:form>
    </c:if>

    <hr />
    <a href="<c:url value="/"/>">Start page</a>
    <br />

</div>



</body>
</html>