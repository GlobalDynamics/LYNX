package lynx;

import java.beans.PropertyVetoException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class Manager {
	public static String con = "jdbc:jtds:sqlserver://U0171723-W7A/lynx;instance=SQL2012";
	private static String userName = "test";
	private static String password = "Britnie7";
	public static ComboPooledDataSource cpds = new ComboPooledDataSource();
	public static String SQL;

	public Manager() {

	}

	public static void createCon() throws SQLException, ClassNotFoundException,
			PropertyVetoException {
		cpds.setDriverClass("net.sourceforge.jtds.jdbc.Driver");
		cpds.setJdbcUrl(con);
		cpds.setUser(userName);
		cpds.setPassword(password);
		cpds.setMinPoolSize(40);
		cpds.setAcquireIncrement(20);
		cpds.setInitialPoolSize(40);
		Connection con = null;
		try {
			con = cpds.getConnection();
		} finally {
			con.close();
		}
		System.out.println(cpds.getMinPoolSize());

	}
	public static void Close(PreparedStatement pst, ResultSet rs, Connection con) throws SQLException
	{
		pst.close();
		rs.close();
		con.close();
	}

}
