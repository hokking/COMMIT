package kr.or.ddit.ibatis.config;

import java.io.IOException;
import java.io.Reader;
import java.nio.charset.Charset;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class SqlMapClientFactory {
	private static SqlMapClient smc;
	static {
		Reader rd = null;
		try {
			Charset charset = Charset.forName("utf-8");
			Resources.setCharset(charset);
			
			rd = Resources.getResourceAsReader("kr/or/ddit/ibatis/config/sqlMapConfig.xml");
			smc = SqlMapClientBuilder.buildSqlMapClient(rd);
			
			rd.close();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if(rd!=null) try {rd.close();} catch(IOException e) {}
		}
	}
	
	public static SqlMapClient getSqlMapClient() {
		return smc;
	}
}
