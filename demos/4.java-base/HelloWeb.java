import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class HelloWeb extends HttpServlet {
     @Override
     protected void service(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
	System.out.println("This the first Web Application");
                resp.getWriter().write("<html><h3>Hello, Web</h3><script>alert('hello web')</script></html>");
     }
}