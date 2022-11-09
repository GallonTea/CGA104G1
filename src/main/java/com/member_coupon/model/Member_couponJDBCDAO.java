package com.member_coupon.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.notification.mode.NotificationJDBCDAO;
import com.notification.mode.NotificationVO;


public class Member_couponJDBCDAO implements Member_couponDAO_interface {
	
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/Ba-Rei?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "password";

	private static final String INSERT_STMT = 
		"INSERT INTO member_coupon (coupon_id,mem_id,mcpn_use) VALUES (?, ?, ?)";
	private static final String GET_ALL_STMT = 
		"SELECT coupon_id,mem_id,mcpn_gettime,mcpn_use FROM member_coupon order by coupon_id";
	private static final String GET_ONE_STMT = 
		"SELECT coupon_id,mem_id,mcpn_gettime,mcpn_use FROM member_coupon where coupon_id = ?";
	private static final String DELETE = 
		"DELETE FROM member_coupon where coupon_id = ?";
	private static final String UPDATE = 
		"UPDATE member_coupon set coupon_id=?, mem_id=?, mcpn_use=?  where coupon_id = ?";


	@Override
	public void insert(Member_couponVO member_couponVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, member_couponVO.getCoupon_id());
			pstmt.setInt(2, member_couponVO.getMem_id());
			pstmt.setInt(3, member_couponVO.getMcpn_use());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
	}

	@Override
	public void update(Member_couponVO member_couponVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, member_couponVO.getCoupon_id());
			pstmt.setInt(2, member_couponVO.getMem_id());
			pstmt.setInt(3, member_couponVO.getMcpn_use());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
	}
		
	

	@Override
	public void delete(Integer coupon_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, coupon_id);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
	}

		
	

	@Override
	public Member_couponVO findByPrimaryKey(Integer coupon_id) {
		Member_couponVO member_couponVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, coupon_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				member_couponVO = new Member_couponVO();
				member_couponVO.setCoupon_id(rs.getInt("coupon_id"));
				member_couponVO.setMem_id(rs.getInt("mem_id"));
				member_couponVO.setMcpn_gettime(rs.getTimestamp("mcpn_gettime"));
				member_couponVO.setMcpn_use(rs.getInt("mcpn_use"));

			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return member_couponVO;
	}
	

	@Override
	public List<Member_couponVO> getAll() {
		List<Member_couponVO> list = new ArrayList<Member_couponVO>();
		Member_couponVO member_couponVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				member_couponVO = new Member_couponVO();
				member_couponVO.setCoupon_id(rs.getInt("coupon_id"));
				member_couponVO.setMem_id(rs.getInt("mem_id"));
				member_couponVO.setMcpn_gettime(rs.getTimestamp("mcpn_gettime"));
				member_couponVO.setMcpn_use(rs.getInt("mcpn_use"));

				list.add(member_couponVO); // Store the row in the list
			}
			
			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;

	}
	public static void main(String[] args) {
		Member_couponJDBCDAO dao = new Member_couponJDBCDAO();

		
		// 新增
		Member_couponVO member_couponVO1 = new Member_couponVO();
		member_couponVO1.setCoupon_id(1);
		member_couponVO1.setMem_id(3);
		member_couponVO1.setMcpn_use(0);

		dao.insert(member_couponVO1);

		// 修改
		Member_couponVO member_couponVO2 = new Member_couponVO();
		member_couponVO2.setCoupon_id(1);
		member_couponVO2.setMem_id(2);
		member_couponVO2.setMcpn_use(0);
		dao.update(member_couponVO2);

		// 刪除
		dao.delete(1);

		// 查詢
		Member_couponVO member_couponVO3 = dao.findByPrimaryKey(1);
		System.out.print(member_couponVO3.getCoupon_id() + ",");
		System.out.print(member_couponVO3.getMem_id() + ",");
		System.out.print(member_couponVO3.getMcpn_use() + ",");
		System.out.print(member_couponVO3.getMcpn_gettime() + ",");


		System.out.println("---------------------");

		// 查詢
		List<Member_couponVO> list = dao.getAll();
		for (Member_couponVO amember_couponVO : list) {
			System.out.print(amember_couponVO.getCoupon_id() + ",");
			System.out.print(amember_couponVO.getMem_id() + ",");
			System.out.print(amember_couponVO.getMcpn_use() + ",");
			System.out.print(amember_couponVO.getMcpn_gettime() + ",");
			System.out.println();
		}
	}
	
	
}
