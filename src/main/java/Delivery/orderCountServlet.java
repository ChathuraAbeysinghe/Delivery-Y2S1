/*package Delivery;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/orderCountServlet")
public class orderCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
		deliverDBUtil order = new deliverDBUtil();

        int inProgressCount = order.getCountByStatus("inprogress");
        int pendingCount = order.getCountByStatus("pending");
        int completeCount = order.getCountByStatus("complete");

        request.setAttribute("inprogress", inProgressCount);
        request.setAttribute("pending", pendingCount);
        request.setAttribute("complete", completeCount);

        RequestDispatcher dispatcher = request.getRequestDispatcher("deliver_profile.jsp");
        dispatcher.forward(request, response);	
	}
}
*/