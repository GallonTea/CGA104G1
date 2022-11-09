package com.group_buy.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;



public class Group_BuyJDBCDAO implements Group_BuyDAO_interface{

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/ba_rei?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "password";
	
	
	private static final String INSERT_STMT = 
			"INSERT INTO GROUP_BUY (MEM_ID, GBITEM_ID, GB_MIN, GB_AMOUNT, GBSTART_DATE, GBEND_DATE,GB_STATUS) VALUES (?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = 
			"SELECT GB_ID, MEM_ID, GBITEM_ID, GB_MIN, GB_AMOUNT, GBSTART_DATE, GBEND_DATE,GB_STATUS FROM GROUP_BUY order by GB_ID";
	private static final String GET_ONE_STMT = 
			"SELECT GB_ID, MEM_ID, GBITEM_ID, GB_MIN, GB_AMOUNT, GBSTART_DATE, GBEND_DATE,GB_STATUS FROM GROUP_BUY where GB_ID = ?";
	private static final String DELETE = 
			"DELETE FROM GROUP_BUY where GB_ID = ?";
	private static final String UPDATE = 
			"UPDATE GROUP_BUY set MEM_ID=?, GBITEM_ID=?, GB_MIN=?, GB_AMOUNT=?, GBSTART_DATE=?, GBEND_DATE=?, GB_STATUS=? where GB_ID = ?";
	
	
	
	@Override
	public void insert(Group_BuyVO Group_BuyVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, Group_BuyVO.getMem_id());
			pstmt.setInt(2, Group_BuyVO.getGbitem_id());
			pstmt.setInt(3, Group_BuyVO.getGb_min());
			pstmt.setInt(4, Group_BuyVO.getGb_amount());
			pstmt.setTimestamp(5, Group_BuyVO.getGbstart_date());
			pstmt.setTimestamp(6, Group_BuyVO.getGbend_date());
			pstmt.setInt(7, Group_BuyVO.getGb_status());

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
	public void update(Group_BuyVO Group_BuyVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, Group_BuyVO.getMem_id());
			pstmt.setInt(2, Group_BuyVO.getGbitem_id());
			pstmt.setInt(3, Group_BuyVO.getGb_min());
			pstmt.setInt(4, Group_BuyVO.getGb_amount());
			pstmt.setTimestamp(5, Group_BuyVO.getGbstart_date());
			pstmt.setTimestamp(6, Group_BuyVO.getGbend_date());
			pstmt.setInt(7, Group_BuyVO.getGb_status());
			pstmt.setInt(8, Group_BuyVO.getGb_id());

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
	public void delete(Integer gb_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, gb_id);

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
	public Group_BuyVO findByPrimaryKey(Integer gb_id) {
		Group_BuyVO Group_BuyVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, gb_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Group_BuyVO = new Group_BuyVO();
				Group_BuyVO.setGb_id(rs.getInt("gb_id"));
				Group_BuyVO.setMem_id(rs.getInt("mem_id"));
				Group_BuyVO.setGbitem_id(rs.getInt("gbitem_id"));
				Group_BuyVO.setGb_min(rs.getInt("gb_min"));
				Group_BuyVO.setGb_amount(rs.getInt("gb_amount"));
				Group_BuyVO.setGbstart_date(rs.getTimestamp("gbstart_date"));
				Group_BuyVO.setGbend_date(rs.getTimestamp("gbend_date"));
				Group_BuyVO.setGb_status(rs.getInt("gb_status"));
			}

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
		return Group_BuyVO;
	}

	@Override
	public List<Group_BuyVO> getAll() {
		List<Group_BuyVO> list = new ArrayList<Group_BuyVO>();
		Group_BuyVO Group_BuyVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Group_BuyVO = new Group_BuyVO();
				Group_BuyVO.setGb_id(rs.getInt("gb_id"));
				Group_BuyVO.setMem_id(rs.getInt("mem_id"));
				Group_BuyVO.setGbitem_id(rs.getInt("gbitem_id"));
				Group_BuyVO.setGb_min(rs.getInt("gb_min"));
				Group_BuyVO.setGb_amount(rs.getInt("gb_amount"));
				Group_BuyVO.setGbstart_date(rs.getTimestamp("gbstart_date"));
				Group_BuyVO.setGbend_date(rs.getTimestamp("gbend_date"));
				Group_BuyVO.setGb_status(rs.getInt("gb_status"));
				list.add(Group_BuyVO); 
			}

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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

		Group_BuyJDBCDAO dao = new Group_BuyJDBCDAO();

		// 新增
//		Group_BuyVO gbVO1 = new Group_BuyVO();
//		gbVO1.setMem_id(3);
//		gbVO1.setGbitem_id(4);
//		gbVO1.setGb_min(4);
//		gbVO1.setGb_amount(90);
//		gbVO1.setGbstart_date(Timestamp.valueOf("2022-10-16 00:00:00.0"));
//		gbVO1.setGbend_date(Timestamp.valueOf("2023-12-30 23:59:59"));
//		gbVO1.setGb_status(1);
//		dao.insert(gbVO1);

		// 修改
		Group_BuyVO gbVO2 = new Group_BuyVO();
		gbVO2.setMem_id(1);
		gbVO2.setGbitem_id(4);
		gbVO2.setGb_min(4);
		gbVO2.setGb_amount(200180);
		gbVO2.setGbstart_date(Timestamp.valueOf("2022-10-17 00:00:00.0"));
		gbVO2.setGbend_date(Timestamp.valueOf("2023-12-29 23:59:59"));
		gbVO2.setGb_status(1);
		gbVO2.setGb_id(7);
		dao.update(gbVO2);

//		// 刪除
//		dao.delete(6);
//
//		// 查詢
//		Group_BuyVO gbVO3 = dao.findByPrimaryKey(6);
//		System.out.print(gbVO3.getGb_id() + ",");
//		System.out.print(gbVO3.getMem_id() + ",");
//		System.out.print(gbVO3.getGbitem_id() + ",");
//		System.out.print(gbVO3.getGb_min() + ",");
//		System.out.print(gbVO3.getGb_amount() + ",");
//		System.out.print(gbVO3.getGbstart_date() + ",");
//		System.out.print(gbVO3.getGbend_date() + ",");
//		System.out.println(gbVO3.getGb_status());
//		System.out.println("---------------------");

		// 查詢
		List<Group_BuyVO> list = dao.getAll();
		for (Group_BuyVO aGb : list) {
			System.out.print(aGb.getGb_id() + ",");
			System.out.print(aGb.getMem_id() + ",");
			System.out.print(aGb.getGbitem_id() + ",");
			System.out.print(aGb.getGb_min() + ",");
			System.out.print(aGb.getGb_amount() + ",");
			System.out.print(aGb.getGbstart_date() + ",");
			System.out.print(aGb.getGbend_date() + ",");
			System.out.print(aGb.getGb_status());
			System.out.println();
		}
	}

}
