package com.group_join.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class Group_JoinDAO implements Group_JoinDAO_interface{

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB2");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String INSERT_STMT = 
			"INSERT INTO GROUP_JOIN (GB_ID, MEM_ID, GBPAY_STATUS, PICKUP_STATUS, DELIVER_STATUS) VALUES (?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = 
			"SELECT GB_ID, MEM_ID, GBPAY_STATUS, PICKUP_STATUS, DELIVER_STATUS FROM GROUP_JOIN order by GB_ID";
	private static final String GET_ONE_STMT = 
			"SELECT GB_ID, MEM_ID, GBPAY_STATUS, PICKUP_STATUS, DELIVER_STATUS FROM GROUP_JOIN where GB_ID = ?";
	private static final String DELETE = 
			"DELETE FROM GROUP_JOIN where GB_ID = ?";
	private static final String UPDATE = 
			"UPDATE GROUP_JOIN set  GBPAY_STATUS=?, PICKUP_STATUS=?, DELIVER_STATUS=? where (GB_ID = ?) and (MEM_ID = ?)";


	
	
	@Override
	public void insert(Group_JoinVO Group_JoinVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setInt(1, Group_JoinVO.getGb_id());
			pstmt.setInt(2, Group_JoinVO.getMem_id());
			pstmt.setInt(3, Group_JoinVO.getGbpay_status());
			pstmt.setInt(4, Group_JoinVO.getPickup_status());
			pstmt.setInt(5, Group_JoinVO.getDeliver_status());

			pstmt.executeUpdate();

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
	public void update(Group_JoinVO Group_JoinVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, Group_JoinVO.getGbpay_status());
			pstmt.setInt(2, Group_JoinVO.getPickup_status());
			pstmt.setInt(3, Group_JoinVO.getDeliver_status());
			pstmt.setInt(4, Group_JoinVO.getGb_id());
			pstmt.setInt(5, Group_JoinVO.getMem_id());

			pstmt.executeUpdate();

			// Handle any driver errors
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
	public void delete(Integer gb_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, gb_id);

			pstmt.executeUpdate();

			// Handle any driver errors
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
	public Group_JoinVO findByPrimaryKey(Integer gb_id) {
		Group_JoinVO Group_JoinVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, gb_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Group_JoinVO = new Group_JoinVO();
				Group_JoinVO.setGb_id(rs.getInt("gb_id"));
				Group_JoinVO.setMem_id(rs.getInt("mem_id"));
				Group_JoinVO.setGbpay_status(rs.getInt("gbpay_status"));
				Group_JoinVO.setPickup_status(rs.getInt("pickup_status"));
				Group_JoinVO.setDeliver_status(rs.getInt("deliver_status"));
			}

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
		return Group_JoinVO;
	}

	@Override
	public List<Group_JoinVO> getAll() {
		List<Group_JoinVO> list = new ArrayList<Group_JoinVO>();
		Group_JoinVO Group_JoinVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Group_JoinVO = new Group_JoinVO();
				Group_JoinVO.setGb_id(rs.getInt("gb_id"));
				Group_JoinVO.setMem_id(rs.getInt("mem_id"));
				Group_JoinVO.setGbpay_status(rs.getInt("gbpay_status"));
				Group_JoinVO.setPickup_status(rs.getInt("pickup_status"));
				Group_JoinVO.setDeliver_status(rs.getInt("deliver_status"));
				list.add(Group_JoinVO); 
			}

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

}
