package com.bigdataB.space;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bigdataB.space.dto.MemberDTO;
import com.bigdataB.space.dto.RefineDTO;
import com.bigdataB.space.dto.ReserveDTO;
import com.bigdataB.space.dto.SpaceRoomDTO;
import com.bigdataB.space.service.GuestMapper;
import com.bigdataB.space.service.LoginMapper;

@Controller
public class LoginController {
	@Autowired
	LoginMapper loginMapper;

	@Autowired
	GuestMapper guestMapper;

	@Autowired
	BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();

	@RequestMapping(value = "hostLogin.do")
	public String host_login() {// 호스트 로그인페이지이동
		return "login/hostLogin";
	}

	@RequestMapping(value = "guestLogin.do", method = RequestMethod.GET)
	public String guest_Login() { // 게스트 로그인페이지 이동
		return "login/guestLogin";
	}

	@RequestMapping(value = "host_ssn.do")
	public String host_ssn() { // 호스트 회원가입페이지 이동
		return "login/host_ssn";
	}

	@RequestMapping(value = "guest_ssn.do")
	public String guest_ssn() { // 게스트 회원가입페이지 이동
		return "login/guest_ssn";
	}

	@RequestMapping(value = "emailCheck.do") // 이메일중복체크 main.js에서 왔습니다.
	public @ResponseBody Map<String, Object> emailCheck(@ModelAttribute MemberDTO dto) {
		MemberDTO result = loginMapper.emailCheck(dto);
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("result", result);
		return resMap;
	}

	@RequestMapping(value = "member_ssn.do") // 회원가입성공 HOST,GUEST둘다 여기로 왔습니다.
	public String member_ssn(HttpServletRequest req, @ModelAttribute MemberDTO dto) {
		try {
			String inputpwd = dto.getMember_pw();
			String pwd = pwdEncoder.encode(inputpwd);
			dto.setMember_pw(pwd);

		} catch (Exception e) {
			e.printStackTrace();
		}
		int res = loginMapper.insertMember(dto);
		if (res > 0) {
			if (dto.getMember_grade() == 1) {
				req.setAttribute("msg", "회원가입성공");
				req.setAttribute("url", "host_home.do");// 호스트main
				return "message";
			} else {
				req.setAttribute("msg", "회원가입성공");
				req.setAttribute("url", "guest_main.do");// guest main
				return "message";
			}
		} else {
			req.setAttribute("msg", "회원가입실패");
			req.setAttribute("url", req.getServletPath());
			return "message";
		}

	}

	@RequestMapping(value = "guestLogin.do", method = RequestMethod.POST) // 게스트 로그인
	public String guest_Login(HttpServletRequest req, @RequestParam Map<String, String> map, HttpServletResponse resp) {

		MemberDTO admindto = loginMapper.adminMeb(map);
		MemberDTO dto = loginMapper.getMember(map);
		if (admindto != null) {
			boolean pwdMatch = false;
			pwdMatch = pwdEncoder.matches(map.get("member_pw"), admindto.getMember_pw());
			if (pwdMatch) {
				req.setAttribute("msg", admindto.getMember_nm() + "님 환영합니다.");
				req.setAttribute("url", "admin_main.do");
				HttpSession session = req.getSession();
				session.setAttribute("memberdto", admindto);
			} else {
				req.setAttribute("msg", "이메일, 패스워드를 확인해주세요");
				req.setAttribute("url", "guestLogin.do");
			}
		} else {
			if (dto == null) {
				req.setAttribute("msg", "회원이 아니십니다.");
				req.setAttribute("url", "guestLogin.do");
			} else {
				boolean pwdMatch = false;
				pwdMatch = pwdEncoder.matches(map.get("member_pw"), dto.getMember_pw());
				if (pwdMatch) {
					req.setAttribute("msg", dto.getMember_nm() + "님 환영합니다.");
					req.setAttribute("url", "guest_main.do");
					HttpSession session = req.getSession();
					session.setAttribute("memberdto", dto);
					session.setAttribute("member_grade", dto.getMember_grade());
					System.out.println("===============" + dto.getMember_grade());
					Cookie ck = new Cookie("saveEmail", map.get("member_email"));
					if (map.containsKey("saveEmail"))
						ck.setMaxAge(24 * 60 * 60);
					else
						ck.setMaxAge(0);
					resp.addCookie(ck);
				} else {
					req.setAttribute("msg", "이메일, 패스워드를 확인해주세요");
					req.setAttribute("url", "guestLogin.do");
				}
			}
		}
		return "message";
	}

	@RequestMapping(value = "hostLogin.do", method = RequestMethod.POST) // 호스트 로그인
	public String host_Login(HttpServletRequest req, @RequestParam Map<String, String> map, HttpServletResponse resp) {
		MemberDTO admindto = loginMapper.adminMeb(map);
		MemberDTO dto = loginMapper.getMember(map);
		if (admindto != null) {
			boolean pwdMatch = false;
			pwdMatch = pwdEncoder.matches(map.get("member_pw"), admindto.getMember_pw());
			if (pwdMatch) {
				req.setAttribute("msg", admindto.getMember_nm() + "님 환영합니다.");
				req.setAttribute("url", "admin_main.do");
				HttpSession session = req.getSession();
				session.setAttribute("memberdto", admindto);
			} else {
				req.setAttribute("msg", "이메일, 패스워드를 확인해주세요");
				req.setAttribute("url", "hostLogin.do");
			}
		} else {
			if (dto == null) {
				req.setAttribute("msg", "회원이 아니십니다.");
				req.setAttribute("url", "guestLogin.do");
			} else {
				boolean pwdMatch = false;
				pwdMatch = pwdEncoder.matches(map.get("member_pw"), dto.getMember_pw());
				if (pwdMatch) {
					req.setAttribute("msg", dto.getMember_nm() + "님 환영합니다.");
					req.setAttribute("url", "host_home.do");
					HttpSession session = req.getSession();
					session.setAttribute("memberdto", dto);
					Cookie ck = new Cookie("saveEmail", map.get("member_email"));
					if (map.containsKey("saveEmail"))
						ck.setMaxAge(24 * 60 * 60);
					else
						ck.setMaxAge(0);
					resp.addCookie(ck);
				} else {
					req.setAttribute("msg", "이메일, 패스워드를 확인해주세요");
					req.setAttribute("url", "hostLogin.do");
				}
			}
		}
		return "message";
	}

	@RequestMapping(value = "guest_logout.do") // 게스트 로그아웃
	public String guest_logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		req.setAttribute("msg", "로그아웃 되었습니다.");
		req.setAttribute("url", "guest_main.do");
		return "message";
	}

	@RequestMapping(value = "host_logout.do") // 호스트 로그아웃
	public String host_logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		req.setAttribute("msg", "로그아웃 되었습니다.");
		req.setAttribute("url", "host_home.do");
		return "message";
	}

	@ResponseBody
	@RequestMapping(value = "sendmail.do") // main.js에서 확인 인증메일 발송
	public Map<String, Object> sendMail(@ModelAttribute MemberDTO dto) {
		Map<String, Object> resMap = new HashMap<String, Object>();

		int checkNum = loginMapper.sendCertiMail(dto);

		try {
			String key = "secretkeyspace12";
			String encryptNumber = loginMapper.encryptText(String.valueOf(checkNum), key);
			System.out.println("##### original number result : " + checkNum);
			System.out.println("##### encrypt number result : " + encryptNumber);
//			String decryptNumber = loginMapper.decAES(encryptNumber, key);
//			System.out.println("##### decrypt number result : " + decryptNumber);
			resMap.put("checkNum", encryptNumber);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return resMap;
	}

	@RequestMapping(value = "guest_search.do", method = RequestMethod.GET) // 게스트 이메일찾기페이지 이동
	public String guest_search() {
		return "login/guest_search";
	}

	@RequestMapping(value = "host_search.do", method = RequestMethod.GET) // 호스트 이메일찾기페이지 이동
	public String host_search() {
		return "login/host_search";
	}

	@RequestMapping(value = "findEmail.do") // main.js에서 확인 이메일 찾기
	public @ResponseBody Map<String, Object> findEmail(@ModelAttribute MemberDTO dto) {
		MemberDTO MemberDTO = loginMapper.emailFind(dto);
		if (MemberDTO != null) {
			String[] mail = MemberDTO.getMember_email().split("@");
			mail[0] = mail[0].substring(0, mail[0].length() - 4) + "****";
			String mailFull = String.join("@", mail);
			MemberDTO.setMember_email(mailFull);
			System.out.println("#############" + mailFull);
		}
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("MemberDTO", MemberDTO);
		return resMap;
	}

	@RequestMapping(value = "guest_Pwfind.do") // 게스트 pw찾기페이지이동
	public String guest_Pwfind() {
		return "login/guest_Pwfind";
	}

	@RequestMapping(value = "host_Pwfind.do") // 호스트 pw찾기페이지이동
	public String host_Pwfind() {
		return "login/host_Pwfind";
	}

	@RequestMapping(value = "changePw.do") // main.js에서 확인 pw변경
	public @ResponseBody Map<String, Object> change_Pw(@ModelAttribute MemberDTO dto) {
		try {
			String inputpwd = dto.getMember_pw();
			String pwd = pwdEncoder.encode(inputpwd);
			dto.setMember_pw(pwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		int res = loginMapper.passUpdate(dto);
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("res", res);
		return resMap;
	}

	@RequestMapping(value = "infopwChange.do")
	public @ResponseBody Map<String, Object> infoChange(@ModelAttribute MemberDTO dto) {
		try {
			String inputpwd = dto.getMember_pw();
			String pwd = pwdEncoder.encode(inputpwd);
			dto.setMember_pw(pwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		int res = loginMapper.passUpdate(dto);
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("res", res);
		return resMap;
	}

	@RequestMapping(value = "daycheck.do")
	public @ResponseBody Map<String, Object> dayCheck(@ModelAttribute SpaceRoomDTO dto) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		SpaceRoomDTO sroomdto = loginMapper.daycheck(dto);
		resMap.put("SRoom", sroomdto);
		return resMap;
	}

	@RequestMapping(value = "selectday.do")
	public @ResponseBody Map<String, Object> selectday(@ModelAttribute ReserveDTO dto) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		List<RefineDTO> reDTO = loginMapper.chechDay(dto);
		List<ReserveDTO> RDTO = new ArrayList<ReserveDTO> ();
		System.out.println(reDTO.toString());
		for(int i=0;i<reDTO.size();i++) {
			int start = Integer.parseInt(guestMapper.Calendar2String(reDTO.get(i).getUse_dt(), "yyyyMMddHHmm").substring(8,10));
			int end = Integer.parseInt(guestMapper.Calendar2String(reDTO.get(i).getUse_time(), "yyyyMMddHHmm").substring(8,10));
			int TotalTime = end - start;
			System.out.println(start+"11111111111111111111111111===================");
			ReserveDTO dto2 = new ReserveDTO();
			dto2.setStartday(start);
			dto2.setTotalTime(TotalTime);
			dto2.setDay(dto.getDay());
			dto2.setRoom_no(dto.getRoom_no());
			
			RDTO.add(dto2);
			resMap.put("RDTO", RDTO);
		}
		
	
		return resMap;
	}

}
