package com.group_buy_order.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.group_buy_item.model.Group_Buy_ItemVO;

public class Group_Buy_OrderJDBCDAO implements Group_Buy_OrderDAO_interface {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/ba_rei?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "password";

	private static final String INSERT_STMT = "insert into GROUP_BUY_ORDER (GBITEM_ID, GB_ID, GBITEM_AMOUNT, GBORIGINAL_PRICE, DISCOUNT_ID, GB_ENDPRICE, GBORDER_DATE, GBORDER_PAYING, GBORDER_SEND, GBORDER_STATUS, GBORDER_OTHER, TRACKING_NUM, RECEIVER_NAME, RECEIVER_ADDRESS, RECEIVER_PHONE, PICKUP_TIME) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT GBORDER_ID, GBITEM_ID, GB_ID, GBITEM_AMOUNT, GBORIGINAL_PRICE, DISCOUNT_ID, GB_ENDPRICE, GBORDER_DATE, GBORDER_PAYING, GBORDER_SEND, GBORDER_STATUS, GBORDER_OTHER, TRACKING_NUM, RECEIVER_NAME, RECEIVER_ADDRESS, RECEIVER_PHONE, PICKUP_TIME FROM GROUP_BUY_ORDER order by GBORDER_ID";
	private static final String GET_ONE_STMT = "SELECT GBORDER_ID, GBITEM_ID, GB_ID, GBITEM_AMOUNT, GBORIGINAL_PRICE, DISCOUNT_ID, GB_ENDPRICE, GBORDER_DATE, GBORDER_PAYING, GBORDER_SEND, GBORDER_STATUS, GBORDER_OTHER, TRACKING_NUM, RECEIVER_NAME, RECEIVER_ADDRESS, RECEIVER_PHONE, PICKUP_TIME FROM GROUP_BUY_ORDER where GBORDER_ID = ?";
	private static final String DELETE = "DELETE FROM GROUP_BUY_ORDER where GBORDER_ID = ?";
	private static final String UPDATE = "UPDATE GROUP_BUY_ORDER set GBITEM_ID=?, GB_ID=?, GBITEM_AMOUNT=?, GBORIGINAL_PRICE=?, DISCOUNT_ID=?, GB_ENDPRICE=?, GBORDER_DATE=?, GBORDER_PAYING=?, GBORDER_SEND=?, GBORDER_STATUS=?, GBORDER_OTHER=?, TRACKING_NUM=?, RECEIVER_NAME=?, RECEIVER_ADDRESS=?, RECEIVER_PHONE=?, PICKUP_TIME=? where GBORDER_ID = ?";

	@Override
	public void insert(Group_Buy_OrderVO Group_Buy_OrderVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

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
//			pstmt.setInt(17, Group_Buy_OrderVO.getGborder_id());

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
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

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	public void delete(Integer gborder_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, gborder_id);

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
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

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
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

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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

		Group_Buy_OrderJDBCDAO dao = new Group_Buy_OrderJDBCDAO();

		// 新增
//		Group_Buy_OrderVO gboVO1 = new Group_Buy_OrderVO();
//		gboVO1.setGbitem_id(2);
//		gboVO1.setGb_id(2);
//		gboVO1.setGbitem_amount(50);
//		gboVO1.setGboriginal_price(129000);
//		gboVO1.setDiscount_id(1);
//		gboVO1.setGb_endprice(90300);
//		
//		gboVO1.setGborder_date(Timestamp.valueOf(LocalDateTime.now()));
//		
//		gboVO1.setGborder_paying(0);
//		gboVO1.setGborder_send(1);
//		gboVO1.setGborder_status(0);
//		
//		gboVO1.setGborder_other("無");
//		gboVO1.setTracking_num("test00002");
//		gboVO1.setReceiver_name("灰醬");
//		gboVO1.setReceiver_address("桃園市桃園區田園路10號7樓");
//		gboVO1.setReceiver_phone("0988511511");
//		gboVO1.setPickup_time(Timestamp.valueOf(LocalDateTime.now()));
//		gboVO1.setGborder_id(null);  //PK
//		
//		dao.insert(gboVO1);

		// 修改
		Group_Buy_OrderVO gboVO2 = new Group_Buy_OrderVO();
		gboVO2.setGbitem_id(2);
		gboVO2.setGb_id(2);
		gboVO2.setGbitem_amount(100);
		gboVO2.setGboriginal_price(78000);
		gboVO2.setDiscount_id(1);
		gboVO2.setGb_endprice(54600);

		gboVO2.setGborder_date(Timestamp.valueOf(LocalDateTime.now()));

		gboVO2.setGborder_paying(0);
		gboVO2.setGborder_send(1);
		gboVO2.setGborder_status(0);

		gboVO2.setGborder_other("無");
		gboVO2.setTracking_num("test00002");
		gboVO2.setReceiver_name("桃太郎");
		gboVO2.setReceiver_address("水濂洞");
		gboVO2.setReceiver_phone("0978591591");

		gboVO2.setPickup_time(Timestamp.valueOf(LocalDateTime.now()));
		gboVO2.setGborder_id(9); // PK
		dao.update(gboVO2);

		// 刪除
//		dao.delete(5);

		// 查詢
//		Group_Buy_OrderVO gboVO3 = dao.findByPrimaryKey(2);
//		System.out.print(gboVO3.getGborder_id() + ",");
//		System.out.print(gboVO3.getGbitem_id() + ",");
//		System.out.print(gboVO3.getGb_id() + ",");
//		System.out.print(gboVO3.getGbitem_amount() + ",");
//		System.out.print(gboVO3.getGboriginal_price() + ",");
//		System.out.print(gboVO3.getDiscount_id() + ",");
//		System.out.print(gboVO3.getGb_endprice() + ",");
//		System.out.print(gboVO3.getGborder_date() + ",");
//		System.out.print(gboVO3.getGborder_paying() + ",");
//		System.out.print(gboVO3.getGborder_send() + ",");
//		System.out.print(gboVO3.getGborder_status() + ",");
//		System.out.print(gboVO3.getGborder_other() + ",");
//		System.out.print(gboVO3.getTracking_num() + ",");
//		System.out.print(gboVO3.getReceiver_name() + ",");
//		System.out.print(gboVO3.getReceiver_address() + ",");
//		System.out.print(gboVO3.getReceiver_phone() + ",");
//		System.out.println(gboVO3.getPickup_time());
//		System.out.println("---------------------");

		// 查詢
		List<Group_Buy_OrderVO> list = dao.getAll();
		for (Group_Buy_OrderVO aGbo : list) {
			System.out.print(aGbo.getGborder_id() + ",");
			System.out.print(aGbo.getGbitem_id() + ",");
			System.out.print(aGbo.getGb_id() + ",");
			System.out.print(aGbo.getGbitem_amount() + ",");
			System.out.print(aGbo.getGboriginal_price() + ",");
			System.out.print(aGbo.getDiscount_id() + ",");
			System.out.print(aGbo.getGb_endprice() + ",");
			System.out.print(aGbo.getGborder_date() + ",");
			System.out.print(aGbo.getGborder_paying() + ",");
			System.out.print(aGbo.getGborder_send() + ",");
			System.out.print(aGbo.getGborder_status() + ",");
			System.out.print(aGbo.getGborder_other() + ",");
			System.out.print(aGbo.getTracking_num() + ",");
			System.out.print(aGbo.getReceiver_name() + ",");
			System.out.print(aGbo.getReceiver_address() + ",");
			System.out.print(aGbo.getReceiver_phone() + ",");
			System.out.print(aGbo.getPickup_time());
			System.out.println();
		}
	}

}
