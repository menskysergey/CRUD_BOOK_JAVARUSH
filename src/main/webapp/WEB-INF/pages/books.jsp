<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false" %>

<html>
<head>
    <title>Books(tab)</title>
    <link rel="stylesheet" href="https://www.w3schools.com/lib/w3.css">
    <style type="text/css">
        h1.header {
            text-align: center;
        }
        a:link{
            text-decoration: none;
        }
        a:hover {
            color: red;
        }
        .current {
            background-color: #404e80;
            text-align: center;
            color: aliceblue;
        }
        a.current {
            color: aliceblue;
        }
        .mainTable {
            width: 80%;
        }
    </style>
</head>

<body>

<div class="w3-container">
    <h1>Books</h1>

    <c:if test="${booksCount == 0}">
        <br />
        <p>No books found</p>
        <br />
    </c:if>
	
    <c:if test="${!empty listBooks}">
        <form action="<c:url value="/books/search"/>" method="post">
            <label for="title">Title:</label>
            <input type="text" name="searchString" value="${search.searchString}" placeholder="title"/>
            <input type="submit" name="search" id="1" value="Search" />
            <c:if test="${!empty search.searchString}">
                <a href="<c:url value="/books/1"/>"><input type="button" name="clear" id="2" value="Clear filter" /></a>
            </c:if>
        </form>
    </c:if>
    <br />
</div>

<div class="w3-container mainTable">
    <c:if test="${!empty listBooks}">
        <table class="w3-table w3-striped w3-border">
            <tr>
                <th>id</th>
                <th>title</th>
                <th>description</th>
                <th>author</th>
                <th>isbn</th>
                <th>printYear</th>
                <th>readAlready</th>
                <th colspan="2"></th>
            </tr>
            <c:forEach items="${listBooks}" var="books">
                <tr>
                    <td>${books.id}</td>
                    <td><a href="<c:url value="/bookdata/${books.id}"/>">${books.title}</a></td>
                    <td>${books.description}</td>
                    <td>${books.author}</td>
                    <td>${books.isbn}</td>
                    <td>${books.printYear}</td>
                    <td>${books.readAlready}</td>
                    <td><a href="<c:url value="/update/${books.id}"/>">Update</a></td>
                    <td><a href="<c:url value="/delete/${books.id}"/>">Delete</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    <br />
    <div class="w3-container">
        <c:if test="${booksCount > 0}">
            <table>
                <tr>
                    <td>Page:</td>
                    <c:forEach begin="${1}" end="${(booksCount/10) + (booksCount%10==0?0:1)}" var="i">
                        <td <c:if test="${page == i}"> class="current" </c:if>>
                            <a href="<c:url value="/books/${i}" />" <c:if test="${page == i}"> class="current" </c:if>> ${i} </a>
                        </td>
                    </c:forEach>
                </tr>
            </table>
        </c:if>
    </div>
</div>

<div class="w3-container">

    <c:if test="${empty search.searchString}">

        <c:if test="${!empty book.title}">
            <h2>Update book:</h2>
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
                        <form:input path="title"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="description">
                            <spring:message text="Description" />
                        </form:label>
                    </td>
                    <td>
                        <form:input path="description" />
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
                        <form:input path="author" />
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
                        <form:input path="isbn"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form:label path="printYear">
                            <spring:message text="PrintYear" />
                        </form:label>
                    </td>
                    <td>
                        <form:input path="printYear"/>
                    </td>
                </tr>
                               <tr>
                    <td colspan="2">
                            <c:if test="${!empty book.title}">
                                <input type="submit" value="<spring:message text="Update book" />"
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
