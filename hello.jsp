<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
  
  <html>  
  <head>  
  
    <sql:query dataSource="jdbc/oradb" var="tables">  
       show tables
    </sql:query>  
  
  </head>  
  <body>  
    <h1>Testing JDBC JINDI Oracle</h1>  
    <table width='500' border='1'>  
      <tr>  
        <th align='left'>Tables</th>  
      </tr>  
      <c:forEach var="table" items="${tables.rows}">  
        <tr>  
           <td> ${table}</td>  
       </tr>  
      </c:forEach>  
    </table>  
    <h1>Testing LDAP</h1>  
  </body>  
  </html>  
