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
 * Servlet implementation class EditCommitBL
 */
@WebServlet("/EditCommitBL")
public class EditCommitBL extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditCommitBL() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());

		Connection connect=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String UpdQuery="";
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String address=request.getParameter("address");
		String tel=request.getParameter("tel");

		// telの‐を無くし、一部を切り出ししている
		String tel1=tel.substring(0,3);
	    String tel2=tel.substring(4,8);
		String tel3=tel.substring(9,13);
		tel=tel1 + tel2 + tel3;


		//DB取得用のクエリを作成しUpdQueryへ設定している
		UpdQuery="SELECT name,address,tel from jyusyoroku where ID=id" + name + address + tel + id;


		getServletContext().getRequestDispatcher("/ListBL").forward(request, response);


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
