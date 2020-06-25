package pkg1;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
    public ListBL() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		Connection connect=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int listCnt=0;
		String SelectQuery="INSERT INTO jyusyoroku (id,name,address,tel)VALUES('"+ name + "','" + address + "','" + tel + "','" + "0')";;
		//取得対象全件数を取得するクエリ
		String CntQuery="SELECT COUNT(*) FROM jyusyoroku";
		String nowPage="";
		String SerchName=(String) request.getAttribute(null);



		//pageがnullの場合はnowPageに初期値1を設定、null以外の場合はnowPageにリクエスト("page")を設定
		if("page"==null) {
			nowPage="1";
		}else {
			nowPage=request.getParameter("page");
		}
		//limitStaに(nowPage-1)*10の値を設定
		int limitSta=(nowPage - 1) * 10;

		//文字コードの設定
		request.setCharacterEncoding("UTF-8");


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
