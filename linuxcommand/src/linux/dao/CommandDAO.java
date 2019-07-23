package linux.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import linux.bean.Command;
import linux.util.DBUtil;

public class CommandDAO {
	
	public void add(Command bean) {
		String sql = "insert into command values(null, ?, ?)";
		try(Connection c = DBUtil.getConnection();
				PreparedStatement ps = c.prepareStatement(sql)) {
			ps.setString(1, bean.getName());
			ps.setString(2, bean.getFunc());
			
			ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void delete(Command bean) {
		String sql = "delete from command where id = ?";
		try(Connection c = DBUtil.getConnection();
				PreparedStatement ps = c.prepareStatement(sql)) {
			ps.setInt(1, bean.getId());
			
			ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void update(Command bean) {
		String sql = "update command set name = ?, func = ? where id = ?";
		try(Connection c = DBUtil.getConnection();
				PreparedStatement ps = c.prepareStatement(sql)) {
			ps.setString(1, bean.getName());
			ps.setString(2, bean.getFunc());
			ps.setInt(3, bean.getId());
			
			ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<Command> list() {
		List<Command> beans = new ArrayList<Command>();
		String sql = "select * from command order by id desc";
		try (Connection c = DBUtil.getConnection();
				PreparedStatement ps = c.prepareStatement(sql)) {
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Command bean = new Command();
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String func = rs.getString(3);
				bean.setId(id);
				bean.setName(name);
				bean.setFunc(func);
				beans.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return beans;
	}
	
}
