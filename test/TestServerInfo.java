import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintStream;
import java.util.Properties;


public class TestServerInfo
{
public static void main(String[] args) throws IOException
{
	Properties p=System.getProperties();
	p.setProperty("zz","你好吗");
	//p.list(System.out);
	PrintStream ps=new PrintStream("c:\\zz.xml");
	p.storeToXML(ps, "网站信息设置");
	
	FileInputStream fi=new FileInputStream("c:\\zz.xml");
	Properties pss=new Properties();
	pss.loadFromXML(fi);
	System.out.println(pss.getProperty("zz"));
	
	
	
	
	/*
	
	
	pss.load(fi);
	System.out.println(pss.getProperty("zz"));*/
}
}
