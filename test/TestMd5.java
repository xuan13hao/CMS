import org.junit.Test;

import com.redcms.util.Md5Encrypt;


public class TestMd5
{
   @Test
   public void testMd5()
   {
	   System.out.println(Md5Encrypt.md5("admin"));
   }
}
