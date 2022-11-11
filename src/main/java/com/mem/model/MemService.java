package com.mem.model;


	
	import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;



	public class MemService {
	private MemDAO_interface dao;

		public MemService() {
			dao = new MemJDBCDAO();

		}

		
		//新增會員
		public MemVO addMem(String mem_account ,String mem_password,String mem_name, String mem_address, String mem_phone,
				String mem_uid, String mem_email, String mem_sex,Date mem_dob) {

			MemVO memVO = new MemVO();
			
			memVO.setMem_account(mem_account);
			memVO.setMem_password(mem_password);
			memVO.setMem_name(mem_name);
			memVO.setMem_address(mem_address);
			memVO.setMem_phone(mem_phone);
			memVO.setMem_uid(mem_uid);
			memVO.setMem_email(mem_email);
			memVO.setMem_sex(mem_sex);
			memVO.setMem_dob(mem_dob);
			dao.insert(memVO);

			return memVO;
		}
		
//		//新增會員
//		public MemVO addVC(Integer Vc_id, Integer Mem_id, String Vc_code,Timestamp Vc_time ) {
//
//			MemVO memVO = new MemVO();
//			
//			memVO.setMem_account(mem_account);
//			memVO.setMem_password(mem_password);
//			memVO.setMem_name(mem_name);
//
//			dao.insert(memVO);
//
//			return memVO;
//		}
		

		//預留給 Struts 2 或 Spring MVC 用
		public void addMem(MemVO memVO) {
			dao.insert(memVO);
		}
		
		
		//修改所有會員資料
		public MemVO updateMem(Integer mem_id, String mem_password,String mem_name, String mem_address,
				String mem_phone, String mem_uid, String mem_email, String mem_sex,Date mem_dob,Integer mem_status) {

			MemVO memVO = new MemVO();

			memVO.setMem_id(mem_id);
			memVO.setMem_password(mem_password);
			memVO.setMem_name(mem_name);
			memVO.setMem_address(mem_address);
			memVO.setMem_phone(mem_phone);
			memVO.setMem_uid(mem_uid);
			memVO.setMem_email(mem_email);
			memVO.setMem_sex(mem_sex);
			memVO.setMem_dob(mem_dob);
			memVO.setMem_status(mem_status);
			dao.update(memVO);

			return dao.findByPrimaryKey(mem_id);
		}
		
		//預留給 Struts 2 用的
		public void updateMem(MemVO memVO) {
			dao.update(memVO);
		}
		
		//修改會員基本資料
		public MemVO update(Integer mem_id, String mem_password,String mem_name, String mem_address,
				String mem_phone, String mem_uid, String mem_email, String mem_sex,Date mem_dob,Integer mem_status) {

			MemVO memVO = new MemVO();

			memVO.setMem_id(mem_id);
			memVO.setMem_password(mem_password);
			memVO.setMem_name(mem_name);
			memVO.setMem_address(mem_address);
			memVO.setMem_phone(mem_phone);
			memVO.setMem_uid(mem_uid);
			memVO.setMem_email(mem_email);
			memVO.setMem_sex(mem_sex);
			memVO.setMem_dob(mem_dob);
			dao.update(memVO);

			return dao.findByPrimaryKey(mem_id);
		}
		
		
		//會員註冊
		public MemVO register(String mem_account ,String mem_password,String mem_name, String mem_address, String mem_phone,
				String mem_uid, String mem_email, String mem_sex,Date mem_dob) {

			MemVO memVO = new MemVO();
			
			memVO.setMem_account(mem_account);
			memVO.setMem_password(mem_password);
			memVO.setMem_name(mem_name);
			memVO.setMem_address(mem_address);
			memVO.setMem_phone(mem_phone);
			memVO.setMem_uid(mem_uid);
			memVO.setMem_email(mem_email);
			memVO.setMem_sex(mem_sex);
			memVO.setMem_dob(mem_dob);
			dao.insert(memVO);

			return memVO;
		}


		//刪除會員
		public void deleteMem(Integer mem_id) {
			dao.delete(mem_id);
		}

		//查詢會員
		public MemVO getOneMem(Integer mem_id) {
			return dao.findByPrimaryKey(mem_id);
		}
		
		//查詢帳號密碼
		public MemVO getMemUser(String mem_account,String mem_password) {
			return dao.findByMemUser(mem_account,mem_password);
		}

		//查詢所有會員
		public List<MemVO> getAll() {
			return dao.getAll();
		}
		
		//寄送驗證信
		public void sendMail(String to, String subject, String messageText) {
			
			   try {

				   Properties props = new Properties();
				   props.put("mail.smtp.host", "smtp.gmail.com");
				   props.put("mail.smtp.socketFactory.port", "465");
				   props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
				   props.put("mail.smtp.auth", "true");
				   props.put("mail.smtp.port", "465");


			     final String myGmail = "nbailove3@gmail.com";
			     final String myGmail_password = "ymglzydcuwscoijo";
				   Session session = Session.getInstance(props, new Authenticator() {
					   protected PasswordAuthentication getPasswordAuthentication() {
						   return new PasswordAuthentication(myGmail, myGmail_password);
					   }
				   });

				   Message message = new MimeMessage(session);
				   message.setFrom(new InternetAddress(myGmail));
				   message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
				  
				   //設定信中的主旨  
				   message.setSubject(subject);
				   //設定信中的內容 
				   message.setText(messageText);

				   Transport.send(message);
				   System.out.println("傳送成功!");
		     }catch (MessagingException e){
			     System.out.println("傳送失敗!");
			     e.printStackTrace();
		     }
		   }
	
		// 取得驗證亂碼
		public String getAuthCode() {
			StringBuilder s = new StringBuilder(8);

			for (int i = 1; i <= 8; i++) {
				int num = (int) (Math.random() * 3);
				if (num == 0) {
					s.append((char) ('A' + (int) (Math.random() * 26)));
				} else if (num == 1) {
					s.append((char) ('a' + (int) (Math.random() * 26)));
				} else {
					s.append((0 + (int) (Math.random() * 10)));
				}

			}
			return s.toString();
		}
	}

