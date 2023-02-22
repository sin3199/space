package com.bigdataB.space.util;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;

import com.bigdataB.space.dto.MemberDTO;

public class LoginInterceptor implements HandlerInterceptor {
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	String[] hostarr = { "/host_buildingDelete.do", "/host_buildingAdd.do", "/host_info_update.do",
			"/host_buildingAdd.do", "/host_buildingFix.do", "/host_buildingList.do", "/host_buildingCheck.do",
			"/room_list.do", "room_input.do", "/room_update.do", "/room_delete.do","/host_guestList.do" };
	List<String> hostList = new ArrayList<>(Arrays.asList(hostarr));

	String[] guestarr = { "/guest_my_info.do", "/guest_my_passwd_edit.do", "/guest_review_write.do",
			"/guest_my_review.do", "/guest_reserve.do", "/guest_checkout.do", "/guest_reserve_view.do",
			"/guest_dibs.do", "/guest_like.do" };
	List<String> guestList = new ArrayList<>(Arrays.asList(guestarr));
	
	String[] adminarr = {"/admin_main.do", "/admin_insertCategory.do", "/admin_listCategory.do", "/admin_listGuest.do"
			,"/admin_listHost.do", "/admin_listReserve.do", "/admin_listRoom.do"};
	
	List<String> adminList	= new ArrayList<>(Arrays.asList(adminarr));

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception {

		logger.info("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		logger.info("LoginInterceptor 진입");
		logger.info(req.getServletPath() + " --- 진입");
		
		if (req.getSession().getAttribute("memberdto") == null) {// grade가 0이아닐때 grade 0=게스트
			if (guestList.contains(req.getServletPath())) {
				res.sendRedirect("/guestLogin.do");// guest login page로 보냄
			
				return false;
			} else if (hostList.contains(req.getServletPath())) {
				res.sendRedirect("/hostLogin.do");// host page로 보냄
				
				return false;
			} else if (adminList.contains(req.getServletPath())) {
				res.sendRedirect("/guest_main.do");
				return false;
			}
		}else {
			HttpSession session = req.getSession();
			MemberDTO dto = (MemberDTO) req.getSession().getAttribute("memberdto");
			logger.info("세션 확인! ---" + dto.getMember_grade());
			if(dto.getMember_grade()==1) {
				if(guestList.contains(req.getServletPath())||adminList.contains(req.getServletPath())) {
					logger.info("guest 페이지 인! ---");
					session.invalidate();
					logger.info("세션 아웃! ---");
					res.sendRedirect("/guestLogin.do");
					return false;
				}
			}else if(dto.getMember_grade() == 0){
				if(hostList.contains(req.getServletPath())||adminList.contains(req.getServletPath())) {
					session.invalidate();
					res.sendRedirect("/hostLogin.do");
					return false;
				}
			}
		}
	
		logger.info("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		
		return true;
	}
}
