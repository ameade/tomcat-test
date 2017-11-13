<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@page contentType="text/html"
 import="java.util.*,javax.naming.*,javax.sql.DataSource,java.sql.*"
  %>
  
  <html>  
  <body>  
    <h1>Testing JDBC JINDI Oracle</h1>  
    <table width='500' border='1'>  
      <tr>  
        <th align='left'>Tables in Database</th>  
      </tr>  
      <%
      try {
            
            Context ctx = new InitialContext();
            Object o = ctx.lookup("java:/jdbc/oradb");
            System.out.println("jdbc/oradb o: " + o.toString());
             
             DataSource ds = (DataSource) o;
             Connection conn = ds.getConnection();
              
              Statement stmt = conn.createStatement();
              ResultSet rs = stmt.executeQuery("select table_name from all_tables");
      } catch (NamingException ne) {
          System.out.println("NamingException: " + ne);
          System.err.println("NamingException: " + ne);
          ne.printStackTrace();
      } catch (ClassCastException cce) {
          System.out.println("ClassCastException: " + cce);
          System.err.println("ClassCastException: " + cce);
          cce.printStackTrace();
      } catch (SQLException sqle) {
          System.out.println("SQLException: " + sqle);
          System.err.println("SQLException: " + sqle);
          sqle.printStackTrace();
      }
      %>
      <c:forEach var="table" items="${rs}">  
        <tr>  
           <td> ${table.getString("table_name")}</td>  
       </tr>  
      </c:forEach>  
    </table>  
  </body>  
  </html>  
