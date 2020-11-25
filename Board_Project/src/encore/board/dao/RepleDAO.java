package encore.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import encore.board.common.DBUtil;
import encore.board.vo.RepleVO;


public class RepleDAO {
	public boolean addReple(RepleVO reple) {
		Connection conn = null;
		PreparedStatement ps = null;
		boolean resultFlag = false;
		String sql = "insert into reple (board_no, userID, content) values(?,?,?)";

		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, reple.getBoardNo());
			ps.setString(2, reple.getUserId());
			ps.setString(3, reple.getContent());

			int count = ps.executeUpdate();
			if (count == 1) {
				resultFlag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, ps);
		}
		return resultFlag;
	}
	
	public RepleVO getReple(int no) {
		RepleVO reple = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select no, board_no, userID, content from reple where no=?";

		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();

			if (rs.next()) {
				reple = new RepleVO();
				reple.setNo(rs.getInt(1));
				reple.setBoardNo(rs.getInt(2));
				reple.setUserId(rs.getString(3));
				reple.setContent(rs.getString(4));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, ps, rs);
		}
		return reple;
	}
	
	public List<RepleVO> getRepleList() {
		List<RepleVO> repleList = new ArrayList<RepleVO>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select no, board_no, userID, content from reple";

		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				RepleVO repleVO = new RepleVO();
				repleVO.setNo(rs.getInt(1));
				repleVO.setBoardNo(rs.getInt(2));
				repleVO.setUserId(rs.getString(3));
				repleVO.setContent(rs.getString(4));
				repleList.add(repleVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, ps, rs);
		}
		return repleList;
	}
	
	public boolean updateReple(RepleVO reple) {
		Connection conn = null;
		PreparedStatement ps = null;
		boolean resultFlag = false;
		String sql = "update reple set content=? where no=?";

		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, reple.getContent());
			ps.setInt(2, reple.getNo());

			int count = ps.executeUpdate();
			if (count == 1) {
				resultFlag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, ps);
		}
		return resultFlag;
	}
	
	public boolean deleteReple(int no) {
		Connection conn = null;
		PreparedStatement ps = null;
		boolean resultFlag = false;
		String sql = "delete from reple where no=?";

		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);

			int count = ps.executeUpdate();
			if (count == 1) {
				resultFlag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, ps);
		}
		return resultFlag;
	}
	
}
