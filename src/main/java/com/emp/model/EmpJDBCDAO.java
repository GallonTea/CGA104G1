package com.emp.model;

import java.sql.*;
import java.util.*;

import com.emp_effect.model.*;
import com.effect.model.*;

public class EmpJDBCDAO implements EmpDAO_interface {
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/Ba_Rei?serverTimezone=Asia/Taipei";
	String userid = "root";
	String password = "password";


	private static final String INSERT_STMT = "INSERT INTO emp (emp_name,account,password,onjob_date,emp_status) VALUES(?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT emp_id,emp_name,account,password,onjob_date,emp_status FROM emp order by emp_id";
	private static final String GET_ONE_STMT = "SELECT emp_id,emp_name,account,password,onjob_date,emp_status FROM emp where emp_id = ?";
	private static final String DELETE = "DELETE FROM emp where emp_id = ?";
	private static final String UPDATE = "UPDATE emp set emp_name=? ,account=? ,password=? ,onjob_date=? ,emp_status=? where emp_id = ?";
	
	private static final String LOGIN = "SELECT e.emp_id,emp_name,account,password,onjob_date,emp_status,ef.effect_id,f.effect_name  FROM (emp e join emp_effect ef on e.emp_id = ef.emp_id  )  join effect f on  ef.effect_id = f.effect_id where account = ? and password = ?;";
	
	private static final String GET_EFFECT = "SELECT ef.effect_id, f.effect_name FROM  (emp e  join  emp_effect ef  on e.emp_id = ?)  join effect f on  ef.effect_id = f.effect_id group by effect_id;"; 
	
	@Override
	public void insert(EmpVO empVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(INSERT_STMT);
//			5
			pstmt.setString(1, empVO.getEmp_name());
			pstmt.setString(2, empVO.getAccount());
			pstmt.setString(3, empVO.getPassword());
			pstmt.setDate(4, empVO.getOnjob_date());
			pstmt.setInt(5, empVO.getEmp_status());

			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (pstmt != null || con != null) {
				try {
					pstmt.close();
					con.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public void update(EmpVO empVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, empVO.getEmp_name());
			pstmt.setString(2, empVO.getAccount());
			pstmt.setString(3, empVO.getPassword());
			pstmt.setDate(4, empVO.getOnjob_date());
			pstmt.setInt(5, empVO.getEmp_status());
			pstmt.setInt(6, empVO.getEmp_id());

			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured." + se.getMessage());
		} finally {
			if (pstmt != null || con != null) {
				try {
					pstmt.close();
					con.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public void delete(Integer emp_id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, emp_id);
			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver." + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (pstmt != null || con != null) {
				try {
					pstmt.close();
					con.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public EmpVO findBypk(Integer emp_id) {

		EmpVO empVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, emp_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				empVO = new EmpVO();
				empVO.setEmp_id(rs.getInt("emp_id"));
				empVO.setEmp_name(rs.getString("emp_name"));
				empVO.setAccount(rs.getString("account"));
				empVO.setPassword(rs.getString("password"));
				empVO.setOnjob_date(rs.getDate("onjob_date"));
				empVO.setEmp_status(rs.getInt("emp_status"));
			}
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (rs != null || pstmt != null || con != null) {
				try {
					rs.close();
					pstmt.close();
					con.close();
					
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
		}
		return empVO;
	}
	//登入

public List<EmpVO> login(String account , String password) {
	List<EmpVO> list = new ArrayList<EmpVO>();
	
	
	EmpVO empVO = null;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,this.password);
			pstmt = con.prepareStatement(LOGIN);
			
			
			pstmt.setString(1, account);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			
		

				while (rs.next()) {
					empVO = new EmpVO();
					empVO.setEmp_id(rs.getInt("emp_id"));
					empVO.setEmp_name(rs.getString("emp_name"));
					empVO.setAccount(rs.getString("account"));
					empVO.setPassword(rs.getString("password"));
					empVO.setOnjob_date(rs.getDate("onjob_date"));
					empVO.setEmp_status(rs.getInt("emp_status"));
					empVO.setEffect_id(rs.getInt("effect_id"));
					empVO.setEffect(rs.getString("effect_name"));
					list.add(empVO);				
				}
	            
//	            while (rs.next()) {
//	            	emp_effectVO = new Emp_effectVO();
//	            	effectVO = new EffectVO();
//	            	
//	            	emp_effectVO.setEffect_id(rs.getInt("effect_id"));
//	            	effectVO.setEffect_name(rs.getString("effect_name"));
//	            }
				
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (pstmt != null || con != null) {
				try {
					pstmt.close();
					con.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	@Override
	public List<EmpVO> getAll() {

		List<EmpVO> list = new ArrayList<EmpVO>();
		EmpVO empVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				empVO = new EmpVO();
				empVO.setEmp_id(rs.getInt("emp_id"));
				empVO.setEmp_name(rs.getString("emp_name"));
				empVO.setAccount(rs.getString("account"));
				empVO.setPassword(rs.getString("password"));
				empVO.setOnjob_date(rs.getDate("onjob_date"));
				empVO.setEmp_status(rs.getInt("emp_status"));
				list.add(empVO);
			}
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (rs != null || pstmt != null || con != null) {
				try {
					rs.close();
					pstmt.close();
					con.close();
					
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
	
	
	
	
   //權限回傳
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	



	public static void main(String[] args) {

		EmpJDBCDAO dao = new EmpJDBCDAO();
	

		//登入
		List<EmpVO> list = dao.login("c003", "c003");
		for (EmpVO aEmp : list) {
		System.out.println(aEmp.getAccount());
		System.out.println(aEmp.getPassword());
		System.out.println(aEmp.getEffect_id());
		System.out.println(aEmp.getEffect());
		}
//		
//		// 新增
//		EmpVO empVO1 = new EmpVO();
//		empVO1.setEmp_name("呂華");
//		empVO1.setAccount("b0099");
//		empVO1.setPassword("b0099");
//		empVO1.setOnjob_date(java.sql.Date.valueOf("2011-10-04"));
//		empVO1.setEmp_status(1);
//		dao.insert(empVO1);
//
//		// 修改
//		EmpVO empVO2 = new EmpVO();
//		empVO2.setEmp_id(1);
//		empVO2.setEmp_name("吳麗華");
//		empVO2.setAccount("c003");
//		empVO2.setPassword("c003");
//		empVO2.setOnjob_date(java.sql.Date.valueOf("2001-03-03"));
//		empVO2.setEmp_status(1);
//		dao.update(empVO2);
//
//		// 刪除
//		dao.delete(7);
//
//		// 查詢
//		EmpVO empVO3 = dao.findBypk(2);
//		System.out.print(empVO3.getEmp_id() + ",");
//		System.out.print(empVO3.getEmp_name() + ",");
//		System.out.print(empVO3.getAccount() + ",");
//		System.out.print(empVO3.getPassword() + ",");
//		System.out.print(empVO3.getOnjob_date() + ",");
//		System.out.println(empVO3.getEmp_status());
//		System.out.println("=====================");
//
//		// 查詢
//		List<EmpVO> list = dao.getAll();
//		for (EmpVO aEmp : list) {
//			System.out.print(aEmp.getEmp_id() + ",");
//			System.out.print(aEmp.getEmp_name() + ",");
//			System.out.print(aEmp.getAccount() + ",");
//			System.out.print(aEmp.getPassword() + ",");
//			System.out.print(aEmp.getOnjob_date() + ",");
//			System.out.print(aEmp.getEmp_status());
//			System.out.println();
//		
//		}		
	}
}
