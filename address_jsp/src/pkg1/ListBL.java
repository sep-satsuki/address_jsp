package pkg1;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ListBL
 */
@WebServlet("/ListBL")
public class ListBL extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    //public ListBL() {
    //    super();
        // TODO Auto-generated constructor stub
   // }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	response.getWriter().append("Served at: ").append(request.getContextPath());

		Connection connect=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int listCnt = 0;
		String SelectQuery="";
		//取得対象全件数を取得するクエリ
		String CntQuery="SELECT COUNT(*) count FROM jyusyoroku";
		String nowPage="";
		String SerchName=(String) request.getParameter("SerchName");



		//pageがnullの場合はnowPageに初期値1を設定、null以外の場合はnowPageにリクエスト("page")を設定
		if(request.getParameter("page")==null) {
			nowPage="1";
		}else {
			nowPage=request.getParameter("page");
		}
		//limitStaに(nowPage-1)*10の値を設定
		int limitSta=(Integer.parseInt(nowPage) -1) * 10;

		//文字コードの設定
		request.setCharacterEncoding("UTF-8");


		final String URL
	    = "jdbc:mysql://localhost:3306/abe?serverTimezone=JST";
	    final String USER = "root";
	    final String PASS = "";
	    //final String SQL = "select * from jyusyoroku;";

	    try {
	    	//Mysqlに繋げている（道順）
			Class.forName("com.mysql.cj.jdbc.Driver");



		} catch (ClassNotFoundException e1) {
			// TODO 自動生成された catch ブロック
			e1.printStackTrace();
		}

	    // DBに接続
	    try {
			connect = DriverManager.getConnection(URL, USER, PASS);
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}


	    //6を実施し、結果をlistCntに設定↓
	    //引数のSQLを設定したものがps（変数）に入ってる、sqlの実行準備ができた
	    try {
			ps= connect.prepareStatement(CntQuery);
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
	    //excuteQuery(クエリを実行してくれる)が実行したものがrsに入る、rsにはSQL文の結果が入ってる
	    try {
			rs= ps.executeQuery();
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
	    //listCntにフィールド(count)の値を取得して、返却している
	    try {
	    	rs.next();
			listCnt= rs.getInt("count");
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}




		//リクエスト(Serchname）がnullの時に・・
		if (SerchName == null) {
			//SELECT文（取得クエリ）で取得し、where（条件）を指定、パラメーターでLIMIT句を指定している(limitStaから10行目まで limtStaは変数
			SelectQuery="SELECT id,name,address,tel from jyusyoroku where delete_flg='0' Limit " + limitSta + ",10";
		}else{
		//リクエスト(Serchname）がnullじゃない時
			///SELECT文（取得クエリ）で取得し、where（条件）を指定、SerchNameは変数なので""の外に出して+をつける 文字列は''で囲む、%%は部分一致
			SelectQuery="SELECT id,name,address,tel from jyusyoroku where delete_flg='0' and  address Like '%" + SerchName + "%' Limit " + limitSta + ",10";
		}

	    //SelectQueryの準備をしている、引数のSQLを設定したものがps（変数）に入ってる、sqlの実行準備ができた
	    try {
			ps= connect.prepareStatement(SelectQuery);
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
	    //rs（変数）にSelectQueryのSQLの実行結果を代入
	    try {
			rs= ps.executeQuery();
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
	    //List.jspに値を渡している
	    request.setAttribute("listCnt",listCnt);
		request.setAttribute("Result",rs);
		request.setAttribute("page",nowPage);


		
		


		//List.jspへ画面遷移
		getServletContext().getRequestDispatcher("/List.jsp").forward(request,response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
