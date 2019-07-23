package linux.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import linux.bean.CommandDetail;
import linux.util.DBUtil;

public class CommandDetailDAO {
	
	public void add(CommandDetail bean) {
		String sql = "insert into commanddetail values(null, ?, ?, ?)";
		try (Connection c = DBUtil.getConnection();
				PreparedStatement ps = c.prepareStatement(sql)) {
			ps.setInt(1, bean.getCid());
			ps.setString(2, bean.getPara());
			ps.setString(3, bean.getFunc());
			
			ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void delete(CommandDetail bean) {
		String sql = "delete from commanddetail where id = ?";
		try(Connection c = DBUtil.getConnection();
				PreparedStatement ps = c.prepareStatement(sql)) {
			ps.setInt(1, bean.getId());
			
			ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void update(CommandDetail bean) {
		
	}
	
	public List<CommandDetail> list(int cid) {
		List<CommandDetail> beans = new ArrayList<CommandDetail>();
		String sql = "select * from commanddetail where cid = ?";
		try (Connection c = DBUtil.getConnection();
				PreparedStatement ps = c.prepareStatement(sql)) {
			ps.setInt(1, cid);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				CommandDetail bean = new CommandDetail();
				int id = rs.getInt(1);
				String para = rs.getString(3);
				String func = rs.getString(4);
				bean.setId(id);
				bean.setCid(cid);
				bean.setPara(para);
				bean.setFunc(func);
				beans.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return beans;
	}

}
