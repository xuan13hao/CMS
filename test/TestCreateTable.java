import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.catalina.tribes.util.Arrays;

import com.redcms.dao.core.ConnectionManager;


public class TestCreateTable
{

	/**
	 * @param args
	 * @throws SQLException 
	 */
	public static void main(String[] args) throws SQLException
	{
		Connection con=ConnectionManager.getInstance().getConnection();
		PreparedStatement ps=con.prepareStatement("create table ? like ?");
		ps.setString(1,"pic");
		ps.setString(2, "content");
		ps.addBatch();
		ps.setString(1, "pic_txt");
		ps.setString(2, "content_txt");
		ps.addBatch();
		int[] re=ps.executeBatch();
		//System.out.println(Arrays.toString(re));
        for(int i:re)
        {
        	System.out.println(i);
        }
	}

}
