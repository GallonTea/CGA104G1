package com.group_buy_order.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class Group_Buy_OrderDAO implements Group_Buy_OrderDAO_interface {

	
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
			"insert into GROUP_BUY_ORDER (GBITEM_ID, GB_ID, GBITEM_AMOUNT, GBORIGINAL_PRICE, DISCOUNT_ID, GB_ENDPRICE, GBORDER_DATE, GBORDER_PAYING, GBORDER_SEND, GBORDER_STATUS, GBORDER_OTHER, TRACKING_NUM, RECEIVER_NAME, RECEIVER_ADDRESS, RECEIVER_PHONE, PICKUP_TIME) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = 
			"SELECT GBORDER_ID, GBITEM_ID, GB_ID, GBITEM_AMOUNT, GBORIGINAL_PRICE, DISCOUNT_ID, GB_ENDPRICE, GBORDER_DATE, GBORDER_PAYING, GBORDER_SEND, GBORDER_STATUS, GBORDER_OTHER, TRACKING_NUM, RECEIVER_NAME, RECEIVER_ADDRESS, RECEIVER_PHONE, PICKUP_TIME FROM GROUP_BUY_ORDER order by GBORDER_ID";
	private static final String GET_ONE_STMT = 
			"SELECT GBORDER_ID, GBITEM_ID, GB_ID, GBITEM_AMOUNT, GBORIGINAL_PRICE, DISCOUNT_ID, GB_ENDPRICE, GBORDER_DATE, GBORDER_PAYING, GBORDER_SEND, GBORDER_STATUS, GBORDER_OTHER, TRACKING_NUM, RECEIVER_NAME, RECEIVER_ADDRESS, RECEIVER_PHONE, PICKUP_TIME FROM GROUP_BUY_ORDER where GBORDER_ID = ?";
	private static final String DELETE = 
			"DELETE FROM GROUP_BUY_ORDER where GBORDER_ID = ?";
	private static final String UPDATE = 
			"UPDATE GROUP_BUY_ORDER set  GBITEM_ID=?, GB_ID=?, GBITEM_AMOUNT=?, GBORIGINAL_PRICE=?, DISCOUNT_ID=?, GB_ENDPRICE=?, GBORDER_DATE=?, GBORDER_PAYING=?, GBORDER_SEND=?, GBORDER_STATUS=?, GBORDER_OTHER=?, TRACKING_NUM=?, RECEIVER_NAME=?, RECEIVER_ADDRESS=?, RECEIVER_PHONE=?, PICKUP_TIME=? where GBORDER_ID = ?";
	
	@Override
	public void insert(Group_Buy_OrderVO Group_Buy_OrderVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, Group_Buy_OrderVO.getGbitem_id());
			pstmt.setInt(2, Group_Buy_OrderVO.getGb_id());
			pstmt.setInt(3, Group_Buy_OrderVO.getGbitem_amount());
			pstmt.setInt(4, Group_Buy_OrderVO.getGboriginal_price());
			pstmt.setInt(5, Group_Buy_OrderVO.getDiscount_id());
			pstmt.setInt(6, Group_Buy_OrderVO.getGb_endprice());
			pstmt.setTimestamp(7, Group_Buy_OrderVO.getGborder_date());
			pstmt.setInt(8, Group_Buy_OrderVO.getGborder_paying());
			pstmt.setInt(9, Group_Buy_OrderVO.getGborder_send());
			pstmt.setInt(10, Group_Buy_OrderVO.getGborder_status());
			pstmt.setString(11, Group_Buy_OrderVO.getGborder_other());
			pstmt.setString(12, Group_Buy_OrderVO.getTracking_num());
			pstmt.setString(13, Group_Buy_OrderVO.getReceiver_name());
			pstmt.setString(14, Group_Buy_OrderVO.getReceiver_address());
			pstmt.setString(15, Group_Buy_OrderVO.getReceiver_phone());
			pstmt.setTimestamp(16, Group_Buy_OrderVO.getPickup_time());
			pstmt.setInt(17, Group_Buy_OrderVO.getGborder_id());
			pstmt.executeUpdate();

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
	public void update(Group_Buy_OrderVO Group_Buy_OrderVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, Group_Buy_OrderVO.getGbitem_id());
			pstmt.setInt(2, Group_Buy_OrderVO.getGb_id());
			pstmt.setInt(3, Group_Buy_OrderVO.getGbitem_amount());
			pstmt.setInt(4, Group_Buy_OrderVO.getGboriginal_price());
			pstmt.setInt(5, Group_Buy_OrderVO.getDiscount_id());
			pstmt.setInt(6, Group_Buy_OrderVO.getGb_endprice());
			pstmt.setTimestamp(7, Group_Buy_OrderVO.getGborder_date());
			pstmt.setInt(8, Group_Buy_OrderVO.getGborder_paying());
			pstmt.setInt(9, Group_Buy_OrderVO.getGborder_send());
			pstmt.setInt(10, Group_Buy_OrderVO.getGborder_status());
			pstmt.setString(11, Group_Buy_OrderVO.getGborder_other());
			pstmt.setString(12, Group_Buy_OrderVO.getTracking_num());
			pstmt.setString(13, Group_Buy_OrderVO.getReceiver_name());
			pstmt.setString(14, Group_Buy_OrderVO.getReceiver_address());
			pstmt.setString(15, Group_Buy_OrderVO.getReceiver_phone());
			pstmt.setTimestamp(16, Group_Buy_OrderVO.getPickup_time());
			pstmt.setInt(17, Group_Buy_OrderVO.getGborder_id());
			pstmt.executeUpdate();

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
	public void delete(Integer gborder_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, gborder_id);

			pstmt.executeUpdate();

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
	public Group_Buy_OrderVO findByPrimaryKey(Integer gborder_id) {
		Group_Buy_OrderVO Group_Buy_OrderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, gborder_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Group_Buy_OrderVO = new Group_Buy_OrderVO();
				Group_Buy_OrderVO.setGborder_id(rs.getInt("gborder_id"));
				Group_Buy_OrderVO.setGbitem_id(rs.getInt("gbitem_id"));
				Group_Buy_OrderVO.setGb_id(rs.getInt("gb_id"));
				Group_Buy_OrderVO.setGbitem_amount(rs.getInt("gbitem_amount"));
				Group_Buy_OrderVO.setGboriginal_price(rs.getInt("gboriginal_price"));
				Group_Buy_OrderVO.setDiscount_id(rs.getInt("discount_id"));
				Group_Buy_OrderVO.setGb_endprice(rs.getInt("gb_endprice"));
				
				Group_Buy_OrderVO.setGborder_date(rs.getTimestamp("gborder_date"));
				
				Group_Buy_OrderVO.setGborder_paying(rs.getInt("gborder_paying"));
				Group_Buy_OrderVO.setGborder_send(rs.getInt("gborder_send"));
				Group_Buy_OrderVO.setGborder_status(rs.getInt("gborder_status"));
				
				Group_Buy_OrderVO.setGborder_other(rs.getString("gborder_other"));
				Group_Buy_OrderVO.setTracking_num(rs.getString("tracking_num"));
				Group_Buy_OrderVO.setReceiver_name(rs.getString("receiver_name"));
				Group_Buy_OrderVO.setReceiver_address(rs.getString("receiver_address"));
				Group_Buy_OrderVO.setReceiver_phone(rs.getString("receiver_phone"));
				
				Group_Buy_OrderVO.setPickup_time(rs.getTimestamp("pickup_time"));
				
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
		return Group_Buy_OrderVO;
	}

	@Override
	public List<Group_Buy_OrderVO> getAll() {
		List<Group_Buy_OrderVO> list = new ArrayList<Group_Buy_OrderVO>();
		Group_Buy_OrderVO Group_Buy_OrderVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Group_Buy_OrderVO = new Group_Buy_OrderVO();
				Group_Buy_OrderVO.setGborder_id(rs.getInt("gborder_id"));
				Group_Buy_OrderVO.setGbitem_id(rs.getInt("gbitem_id"));
				Group_Buy_OrderVO.setGb_id(rs.getInt("gb_id"));
				Group_Buy_OrderVO.setGbitem_amount(rs.getInt("gbitem_amount"));
				Group_Buy_OrderVO.setGboriginal_price(rs.getInt("gboriginal_price"));
				Group_Buy_OrderVO.setDiscount_id(rs.getInt("discount_id"));
				Group_Buy_OrderVO.setGb_endprice(rs.getInt("gb_endprice"));
				
				Group_Buy_OrderVO.setGborder_date(rs.getTimestamp("gborder_date"));
				
				Group_Buy_OrderVO.setGborder_paying(rs.getInt("gborder_paying"));
				Group_Buy_OrderVO.setGborder_send(rs.getInt("gborder_send"));
				Group_Buy_OrderVO.setGborder_status(rs.getInt("gborder_status"));
				
				Group_Buy_OrderVO.setGborder_other(rs.getString("gborder_other"));
				Group_Buy_OrderVO.setTracking_num(rs.getString("tracking_num"));
				Group_Buy_OrderVO.setReceiver_name(rs.getString("receiver_name"));
				Group_Buy_OrderVO.setReceiver_address(rs.getString("receiver_address"));
				Group_Buy_OrderVO.setReceiver_phone(rs.getString("receiver_phone"));
				
				Group_Buy_OrderVO.setPickup_time(rs.getTimestamp("pickup_time"));
				list.add(Group_Buy_OrderVO); 
			}

			// Handle any driver errors
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

}
