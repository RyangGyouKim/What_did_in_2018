//package member;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//
//import javax.naming.Context;
//import javax.naming.InitialContext;
//import javax.sql.DataSource;
//
//public class MemberDao {
//	// 회원 인증 값 상수 선언
//	public static final int MEMBER_NONEXISTENT = 0;
//	public static final int MEMBER_EXISTENT = 1;
//	public static final int MEMBER_JOIN_FAIL = 0;
//	public static final int MEMBER_JOIN_SUCCESS = 1;
//	public static final int MEMBER_LOGIN_PW_NO_GOOD = 0;
//	public static final int MEMBER_LOGIN_SUCCESS = 1;
//	public static final int MEMBER_LOGIN_IS_NOT = -1;
//	
//	
//	/*
//	 * 객체를 한개만 생성한다 = 싱글턴 패턴
//	 */
//	
//	// 싱글턴 패턴 사용
//	private static MemberDao instance = new MemberDao();
//	
//	//싱글턴 패턴 사용 -- 생성자가 private 이다.
//	private MemberDao() {
//		
//	}
//
//	//	대신 static 메소드를 정의해서 
//	//객체를 생성하지 않고 만들어진 객체를 리턴한다.
//	public static MemberDao getInstance() {
//		return instance;
//	}
//	
//	public int insertMember(MemberDto dto) {
//		int ri = 0;
//		
//		Connection connection = null;
//		PreparedStatement pstmt = null;
//		String query = "insert into members values (?,?,?,?)";
//
//		try {
//			connection = getConnection();
//			pstmt = connection.prepareStatement(query);
//			pstmt.setString(1, dto.getId());
//			pstmt.setString(2, dto.getPw());
//			pstmt.setString(3, dto.getName());
//			pstmt.setTimestamp(4, dto.getrDate());
//	
//			pstmt.executeUpdate();
//			ri = MemberDao.MEMBER_JOIN_SUCCESS;
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if(pstmt != null) pstmt.close();
//				if(connection != null) connection.close();
//			} catch (Exception e2) {
//				e2.printStackTrace();
//			}
//		}
//		
//		return ri;
//	}
//	public int confirmId(String id) {
//		int ri = 0;
//		
//		Connection connection = null;
//		PreparedStatement pstmt = null;
//		ResultSet set = null;
//		String query = "select id from members where id = ?";
//		
//		try {
//			connection = getConnection();
//			pstmt = connection.prepareStatement(query);
//			pstmt.setString(1, id);
//			set = pstmt.executeQuery();
//			if(set.next()){
//				ri = MemberDao.MEMBER_EXISTENT;
//			} else {
//				ri = MemberDao.MEMBER_NONEXISTENT;
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				set.close();
//				pstmt.close();
//				connection.close();
//			} catch (Exception e2) {
//				e2.printStackTrace();
//			}
//		}
//		
//		return ri;
//	}
//	
//	public int userCheck( String id, String pw) {
//		int ri = 0;
//		String dbPw;
//		
//		Connection connection = null;
//		PreparedStatement pstmt = null;
//		ResultSet set = null;
//		String query = "select pw from members where id = ?";
//		
//		try {
//			connection = getConnection();
//			pstmt = connection.prepareStatement(query);
//			pstmt.setString(1, id);
//			set = pstmt.executeQuery();
//			
//			if(set.next()) {
//				dbPw = set.getString("pw");
//				if(dbPw.equals(pw)) {
//					ri = MemberDao.MEMBER_LOGIN_SUCCESS;// 로그인 Ok
//				} else {
//					ri = MemberDao.MEMBER_LOGIN_PW_NO_GOOD; // 비번 X
//				}
//			} else {
//				ri = MemberDao.MEMBER_LOGIN_IS_NOT; // 회원 X	
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				set.close();
//				pstmt.close();
//				connection.close();
//			} catch (Exception e2) {
//				e2.printStackTrace();
//			}
//		}
//		return ri;
//	}
//	
//	public MemberDto getMember(String id) {
//		Connection connection = null;
//		PreparedStatement pstmt = null;
//		ResultSet set = null;
//		String query = "select * from members where id = ?";
//		MemberDto dto = null;
//		
//		try {
//			connection = getConnection();
//			pstmt = connection.prepareStatement(query);
//			pstmt.setString(1, id);
//			set = pstmt.executeQuery();
//			
//			if(set.next()) {
//				dto = new MemberDto();
//				dto.setId(set.getString("id"));
//				dto.setPw(set.getString("pw"));
//				dto.setName(set.getString("name"));
//				dto.setrDate(set.getTimestamp("rDate"));
//			
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				set.close();
//				pstmt.close();
//				connection.close();
//			} catch (Exception e2) {
//				e2.printStackTrace();
//			}
//		}
//		
//		return dto;
//		
//	}
//	
//	public int updateMember(MemberDto dto) {
//		int ri = 0;
//		
//		Connection connection = null;
//		PreparedStatement pstmt = null;
//		String query = "update members set pw=? where id=?";
//		
//		try {
//			connection = getConnection();
//			pstmt = connection.prepareStatement(query);
//			pstmt.setString(1, dto.getPw());
//			pstmt.setString(2, dto.getId());
//			ri = pstmt.executeUpdate();
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				pstmt.close();
//				connection.close();
//			} catch (Exception e2) {
//				e2.printStackTrace();
//			}
//		}
//		
//		return ri;
//	}
//	
//	private Connection getConnection() {
//		
//		
//		DataSource dataSource = null;
//		Connection connection = null;
//		try {
//			 Context initContext = new InitialContext();
//			 Context envContext =(Context)initContext.lookup("java:/comp/env");
//			 dataSource = (DataSource) envContext.lookup("jdbc/mysql");
//			 connection = dataSource.getConnection();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		return connection;
//	}
//	
//	
//}
