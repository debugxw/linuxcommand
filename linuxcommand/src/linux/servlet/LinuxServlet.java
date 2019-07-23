package linux.servlet;

import java.lang.reflect.Method;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import linux.bean.Command;
import linux.bean.CommandDetail;
import linux.dao.CommandDAO;
import linux.dao.CommandDetailDAO;

public class LinuxServlet extends HttpServlet {

	public static CommandDAO commandDAO = new CommandDAO();
	public static CommandDetailDAO commandDetailDAO = new CommandDetailDAO();
	
	public void service(HttpServletRequest request, HttpServletResponse response) {
		String method = (String)request.getAttribute("method");
		try {
			Method m = this.getClass().getMethod(method, HttpServletRequest.class,
					HttpServletResponse.class);
			String redirect = m.invoke(this, request, response).toString();
			if(redirect.startsWith("@"))
				response.sendRedirect(redirect.substring(1));
			else
				request.getRequestDispatcher(redirect).forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String add(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("inputCommand");
		String func = request.getParameter("inputFunction");
		
		Command c = new Command();
		c.setName(name);
		c.setFunc(func);
		
		commandDAO.add(c);
		return "@command_list";
	}
	
	public String delete(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		Command c = new Command();
		c.setId(id);
		commandDAO.delete(c);
		
		return "@command_list";
	}

	public String list(HttpServletRequest request, HttpServletResponse response) {
		List<Command> cs = commandDAO.list();
		request.setAttribute("cs", cs);
		return "commandHome.jsp";
	}

	public String addDetail(HttpServletRequest request, HttpServletResponse response) {
		int cid = Integer.parseInt(request.getParameter("inputCid"));
		String para = request.getParameter("inputPara");
		String func = request.getParameter("inputFunction");
		
		CommandDetail bean = new CommandDetail();
		bean.setCid(cid);
		bean.setPara(para);
		bean.setFunc(func);
		commandDetailDAO.add(bean);
		
		return "@command_listDetail?cid="+cid;
	}
	
	public String deleteDetail(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		int cid = Integer.parseInt(request.getParameter("cid"));
		CommandDetail bean = new CommandDetail();
		bean.setId(id);
		commandDetailDAO.delete(bean);
		
		return "@command_listDetail?cid="+cid;
	}
	
	public String listDetail(HttpServletRequest request, HttpServletResponse response) {
		int cid = Integer.parseInt(request.getParameter("cid"));
		List<CommandDetail> cds = commandDetailDAO.list(cid);
		request.setAttribute("cds", cds);
		request.setAttribute("cid", cid);
		
		return "commandDetail.jsp";
	}
	
}
