package encore.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import encore.board.common.DBUtil;
import encore.board.vo.UserVO;

public class UserDAO {
	static final String url = "jdbc:mysql://localhost:3306/board?serverTimezone=UTC";
	static final String user = "root";
	static final String password = "1234";
	
	//회원정보 얻기
		public UserVO getUserInfo(String userID) {
			Connection conn = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			UserVO user = null;
			
			try {
				conn = DBUtil.getConnection();
				String SQL = "SELECT userID, userPassword, userName, userGender, userEmail FROM USER WHERE userID = ?";
				ps = conn.prepareStatement(SQL);
				ps.setString(1, userID);
				rs = ps.executeQuery();

				if(rs.next()) {
					user = new UserVO();
					user.setUserID(rs.getString(1));
					user.setUserPassword(rs.getString(2));
					user.setUserName(rs.getString(3));
					user.setUserGender(rs.getString(4));
					user.setUserEmail(rs.getString(5));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBUtil.close(conn, ps, rs);
			}
			
			return user;
		}
		
	// 회원가입
	public int addUser(UserVO user) {
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = DBUtil.getConnection();
			String SQL = "INSERT INTO USER (userID, userPassword, userName, userGender, userEmail) VALUES (?,?,?,?,?)";
			ps = conn.prepareStatement(SQL);
			ps.setString(1, user.getUserID());
			ps.setString(2, user.getUserPassword());
			ps.setString(3, user.getUserName());
			ps.setString(4, user.getUserGender());
			ps.setString(5, user.getUserEmail());
			return ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB 오류
	}
	
	// 회원정보 수정
	public int updateUser(UserVO user) {
		Connection conn = null;
		PreparedStatement ps = null;
		String SQL = "UPDATE USER SET userPassword = ?, userName = ?, userGender = ?, userEmail = ? WHERE userID = ?";

		try {
			conn = DBUtil.getConnection();
						
			ps = conn.prepareStatement(SQL);
			ps.setString(1, user.getUserPassword());
			ps.setString(2, user.getUserName());
			ps.setString(3, user.getUserGender());
			ps.setString(4, user.getUserEmail());
			ps.setString(5, user.getUserID());
			return ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB오류
	}
	
	// 회원삭제
	public int deleteUser(UserVO user) {
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = DBUtil.getConnection();
			String SQL = "DELETE FROM USER WHERE userID = ?";
			ps = conn.prepareStatement(SQL);
			ps.setString(1, user.getUserID());
			return ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB 오류
	}
	
	// 로그인
	public int getUser(String userID, String userPassword) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = DBUtil.getConnection();
			String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
			ps = conn.prepareStatement(SQL);
			ps.setString(1, userID);
			rs = ps.executeQuery();

			if (rs.next()) {
				// 패스워드 일치한다면 실행
				if (rs.getString(1).equals(userPassword)) {
					return 1; // 로그인 성공
				} else
					return 0; // 비밀번호 불일치
			}
			return -1; // 아이디가 없음 오류
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(conn, ps, rs);
		}
		return -2; // DB 오류
	}
	
	public String findUserIdByEmail(String email) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String id = null;
		
		String sql = "select userId from user where userEmail = ?";
		
		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				id = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}
	
	public String findUserPasswordById(String id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String password = null;
		
		String sql = "select userPassword from user where userId = ?";
		
		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				password = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return password;
	}
}
