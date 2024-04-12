
package dao;

import java.sql.Connection;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DAO {
	static DataSource ds;

	// データベースの接続に必要な処理をgetConnectionというメソッドにまとめておく
	public Connection getConnection() throws Exception {
		if (ds==null) {
			InitialContext ic=new InitialContext();
			// TODO:DBの接続名はグループで使っているものに変更
			ds=(DataSource)ic.lookup("java:/comp/env/jdbc/kouka");
		}
		return ds.getConnection();
	}
}
