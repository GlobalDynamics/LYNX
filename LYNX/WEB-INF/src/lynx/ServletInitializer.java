package lynx;

import java.io.*;
import java.sql.SQLException;
import java.beans.PropertyVetoException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;

public class ServletInitializer extends HttpServlet
{

    public void init() throws ServletException
    {
          try {
			Manager.createCon();
		} catch (ClassNotFoundException | SQLException | PropertyVetoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

    }

    public void service(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
    {

    }
}
