package kr.gudi.app;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	SqlSession session;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		logger.info("HomeController.home()");
		return "home";
	}
	
	@RequestMapping(value = "/select", method = RequestMethod.POST)
	public String select(Model model, HttpServletRequest req) {
		logger.info("HomeController.select()");
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		boolean check = true;
		
		String name = req.getParameter("name");
		String ip = req.getParameter("ip");
		
		if(null == name || ("").equals(name)) {
			logger.info("학생 이름이 없습니다.");
			check = false;
		} else {
			paramMap.put("name", name);
		}
		
		if(null == ip || ("").equals(ip)) {
			logger.info("ip 정보가 없습니다.");
			check = false;
		} else {
			paramMap.put("ip", ip);
		}
		
		if(check) {
			List<HashMap<String, Object>> resultList = new ArrayList<HashMap<String, Object>>();		
			int status = session.insert("db.insert", paramMap);
			if(status > 0) {
				resultList = session.selectList("db.select");
			}		
			logger.info("Count : {}", resultList.size());
			model.addAttribute("db", resultList);
			return "result";
		} else {
			logger.info("파라메터 값이 부족하여 HOME 화면으로 이동합니다.");
			return "redirect:/";
		}
		
	}
	
}
