package com.bigdataB.space;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bigdataB.space.dto.MemberDTO;
import com.bigdataB.space.dto.ReserveDTO;
import com.bigdataB.space.dto.ReserveListDTO;
import com.bigdataB.space.dto.ReviewDTO;
import com.bigdataB.space.dto.ReviewMyListDTO;
import com.bigdataB.space.dto.SpaceDTO;
import com.bigdataB.space.dto.SpaceDibsDTO;
import com.bigdataB.space.dto.SpaceRoomDTO;
import com.bigdataB.space.dto.SpaceTypeDTO;
import com.bigdataB.space.dto.GuestMyDibsDTO;
import com.bigdataB.space.service.GuestMapper;


/**
 * Handles requests for the application home page.
 */
@Controller
public class GuestController {

	@Autowired
	GuestMapper guestMapper;
	
	@Autowired
	BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();

	@RequestMapping(value = "index.do")
	public String main() {

		return "main";
	}
	//guest메인화면
	@RequestMapping(value = "/guest_main.do")
	public String guest_main(HttpServletRequest req,HttpSession session) {
		if ((MemberDTO) session.getAttribute("memberdto") == null) {
		} else if (((MemberDTO) session.getAttribute("memberdto")).getMember_grade() != 0) {
			session.invalidate();
		}
		List<SpaceTypeDTO> list = guestMapper.ListSpaceType();
		List<SpaceRoomDTO> srlist = guestMapper.ListSpaceRoom();
		if(srlist.size()>5) {
		Random random = new Random();
		int ransu[] = new int [5];
		List<SpaceRoomDTO> rdlist = new ArrayList<>();
		for(int i=0; i<ransu.length;i++) {
			int srnum = random.nextInt(srlist.size());
			int num = (srlist.get(srnum)).getRoom_no();
			ransu[i]=num;
			for(int j=0; j<i; j++) {
				if(ransu[i] == ransu[j]) {
					i--;
					break;
				}
			}
		}
		
		for(int k=0; k<ransu.length; k++) {
			req.setAttribute("ransu[k]",ransu[k]);
			SpaceRoomDTO rdDTO = guestMapper.getSpaceRoom(ransu[k]);
			rdlist.add(rdDTO);
			
		}
		req.setAttribute("rdlist", rdlist);
		}
		req.setAttribute("listSpaceType", list);
		req.removeAttribute("searchString");
		return "guest/guest_main";
	}
	
	//내 정보 이동
	@RequestMapping(value = "guest_my_info.do")
	public String guest_my_info(HttpServletRequest req, HttpSession session) {
		return "guest/guest_my_info";
	}
	//닉네임 전화번호 변경
	@RequestMapping(value="member_nm_edit.do")
	public String member_nm_edit(HttpServletRequest req, HttpSession session, @RequestParam Map<String,String> map) {
		System.out.println("member_pw = " + map.get("member_pw"));
		MemberDTO mdto = (MemberDTO) session.getAttribute("memberdto");
		boolean pwdMatch = false;
		String inputpw = null; 
		if(map.get("mode").equals("nick")) {
			inputpw = map.get("nickMember_pw");
		}else {
			inputpw = map.get("telMember_pw");
		}
		pwdMatch = pwdEncoder.matches(inputpw, mdto.getMember_pw());
		if (pwdMatch) {
			if(map.get("mode").equals("nick")) {
				mdto.setMember_nm(map.get("member_nm"));
				int res = guestMapper.member_nm_edit(mdto);
				if(res >0) {
					req.setAttribute("msg", "닉네임 변경 완료.");
				}else {
					req.setAttribute("msg", "닉네임 변경 실패.");
				}
			}else if (map.get("mode").equals("tel")){
				mdto.setMember_pno(map.get("member_pno"));
				int res = guestMapper.member_pno_edit(mdto);
				if(res >0) {
					req.setAttribute("msg", "전화번호 변경 완료.");
				}else {
					req.setAttribute("msg", "전화번호 변경 실패.");
				}
			}
			session.setAttribute("memberdto", mdto);
		} else {
			req.setAttribute("msg", "패스워드가 틀렸습니다.");
		}
		req.setAttribute("url", "guest_my_info.do");
		return "/message";
	}
	
	//비밀번호 변경 이동
	@RequestMapping(value="guest_my_passwd_edit.do")
	public String guest_my_passwd_edit() {
		return "guest/guest_my_passwd_edit";
	}
	//비밀번호 변경 ok
	@RequestMapping(value="pwEdit.do")
	public @ResponseBody Map<String, Object> guest_my_passwd_edit_ok(HttpServletRequest req, HttpSession session, @RequestParam Map<String, String> map) {
		System.out.println("member_pw =" + map.get("member_pw"));
		MemberDTO mdto = (MemberDTO) session.getAttribute("memberdto");
		System.out.println("mdto.pw =" + mdto.getMember_pw());
		boolean pwdMatch = false;
		pwdMatch = pwdEncoder.matches(map.get("current_pw"), mdto.getMember_pw());
		Map<String, Object> resMap = new HashMap<String, Object>();
		if(pwdMatch) {
			String inputpwd = map.get("member_pw");
			String pwd = pwdEncoder.encode(inputpwd);
			mdto.setMember_pw(pwd); 
			int res = guestMapper.passwdUpdate(mdto);
			resMap.put("res", res);
			session.setAttribute("memberdto", mdto);
		}else {
			int res = 3;
			resMap.put("res", res);
		}
		return resMap;
	}
	
	
	//리뷰쓰기 페이지 이동
	@RequestMapping(value="guest_review_write.do")
	public String guest_review_write() {
		return "guest/guest_review_write";
	}
	//리뷰쓰기 OK 페이지 이동
		@RequestMapping(value="guest_review_write_ok.do" )
		public String guest_review_write_ok(HttpServletRequest req, @ModelAttribute ReviewDTO dto, BindingResult result) {
//			if (result.hasErrors()) {
//				dto.setRes_img("");
//			}
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
			MultipartFile mf = mr.getFile("res_img");
			String filename = mf.getOriginalFilename();
			if(filename == null || filename.equals("")) {
				dto.setRes_img("");
			}else {
				HttpSession session = req.getSession();
				String upPath = session.getServletContext().getRealPath("/resources/img");
				File file = new File(upPath, filename);
				try {
					mf.transferTo(file);
				}catch(IOException e) {
					e.printStackTrace();
					req.setAttribute("msg", "이미지를 업로드시 오류발생!! 다시 입력해 주세요");
					req.setAttribute("url", "guest_reservelist.do");
					return "/message";
				}
				dto.setRes_img(filename);
			}
//			System.out.println("res_like = " + dto.getRes_like());
//			System.out.println("res_no = " + dto.getRes_no());
//			System.out.println("rev_content = " + dto.getRev_content());
//			System.out.println("res_img = " + dto.getRes_img());
			int res = guestMapper.reviewInsert(dto);
			if (res > 0) {
				req.setAttribute("msg", "리뷰 등록 완료!! 내 리뷰 페이지로 이동");
				req.setAttribute("url", "guest_my_review.do");
			} else {
				req.setAttribute("msg", "리뷰 등록 실패!! 내 예약리스트로 이동");
				req.setAttribute("url", "guest_reservelist.do");
			}
			return "/message";
		}
	//내 리뷰 페이지 이동
	@RequestMapping(value="guest_my_review.do")
	public String  guest_my_review(HttpServletRequest req, HttpSession session) {
		MemberDTO mdto = (MemberDTO) session.getAttribute("memberdto");
		int member_no = mdto.getMember_no();
		List<ReviewMyListDTO> list = guestMapper.reviewList(member_no); 
		req.setAttribute("reviewList", list);
		return "guest/guest_my_review";
	}
	//내 리뷰 수정 페이지
	@RequestMapping(value="guest_review_edit.do")
	public String guest_review_edit(HttpServletRequest req, @RequestParam int rev_no) {
		ReviewDTO dto = guestMapper.myReview(rev_no);
		req.setAttribute("reviewDTO", dto);
		return "guest/guest_review_edit";
	}
	//내 리뷰 수정 ok 페이지
	@RequestMapping(value="guest_review_edit_ok.do")
	public String guest_review_edit_ok(HttpServletRequest req, @ModelAttribute ReviewDTO dto, BindingResult result) {
//		if (result.hasErrors()) {
//		dto.setRes_img("req.getParameter("res_img2")");
//	}
		System.out.println("res_img = " + dto.getRes_img());
		
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile mf = mr.getFile("res_img");
		String filename = mf.getOriginalFilename();
		if(filename == null || filename.equals("")) {
			dto.setRes_img(req.getParameter("res_img2"));
		}else {
			HttpSession session = req.getSession();
			String upPath = session.getServletContext().getRealPath("/resources/img");
			File file = new File(upPath, filename);
			try {
				mf.transferTo(file);
			}catch(IOException e) {
				e.printStackTrace();
				req.setAttribute("msg", "이미지를 업로드시 오류발생!! 다시 입력해 주세요");
				req.setAttribute("url", "guest_reservelist.do");
				return "/message";
			}
			dto.setRes_img(filename);
		}
		
		
		System.out.println("res_like = " + dto.getRes_like());
		System.out.println("res_no = " + dto.getRes_no());
		System.out.println("rev_content = " + dto.getRev_content());
		System.out.println("res_img = " + dto.getRes_img());
		int res = guestMapper.reviewEdit(dto);
		if (res > 0) {
			req.setAttribute("msg", "리뷰 수정 완료!! 내 리뷰 페이지로 이동");
			req.setAttribute("url", "guest_my_review.do");
		} else {
			req.setAttribute("msg", "리뷰 수정 실패!! 내 리뷰 페이지로 이동");
			req.setAttribute("url", "guest_my_review.do");
		}
		return "/message";
	}
	//리뷰 삭제
		@RequestMapping(value="guest_review_delete.do")
		public String guest_review_delete(HttpServletRequest req, @RequestParam int rev_no, String res_img) {
			int res = guestMapper.reviewDelete(rev_no);
			if (res > 0) {
				HttpSession session = req.getSession();
				String upPath = session.getServletContext().getRealPath("/resources/img");
				File file = new File(upPath, res_img);
				if (file.exists()) {
					file.delete();
					req.setAttribute("msg", "리뷰 삭제(이미지도 삭제) 성공!! 내 리뷰 페이지로 이동.");
				}else {
					req.setAttribute("msg", "리뷰 삭제(이미지 삭제 실패) 성공!! 내 리뷰 페이지로 이동.");
				}
			} else {
				req.setAttribute("msg", "리뷰 삭제 실패!! 내 리뷰 페이지로 이동");
			}
			req.setAttribute("url", "guest_my_review.do");
			return "/message";
		}
	
	//host페이지 이동
	@RequestMapping(value = "host_home.do")
	public String HostHome() {
		return "host/host_home";
	}
	//login페이지 이동
	@RequestMapping(value = "g_guestLogin.do", method=RequestMethod.GET)
	public String guest_Login() {
		return "login/guestLogin";
	}

	// guest_main에서 카테고리를 선택해서 넘어올 때
	@RequestMapping(value = "guest_categoryView.do")
	public String guest_categoryView(HttpServletRequest req, @RequestParam int cate_no) {
		List<SpaceRoomDTO> list = guestMapper.listSapceRoom(cate_no);
		SpaceTypeDTO stdto = guestMapper.getCate(cate_no);
		req.setAttribute("getSpaceRoom", list);
		req.setAttribute("mode", stdto);
		return "guest/guest_categoryView";
	}
	// top의 search를 통해서 넘어올 떄	
	 @RequestMapping(value="search.do",method=RequestMethod.POST)
	 public String searchList(HttpServletRequest req,@RequestParam String searchString) {
		 String q = searchString;
		 List<SpaceRoomDTO> list = guestMapper.listCategory(q);
		 req.setAttribute("getSpaceRoom", list);
		 req.setAttribute("search", q);
	 return "guest/guest_categoryView";
		 }
	 
	//카테고리 상세목록에서 건물 상세보기로 이동.
	@RequestMapping(value = "guest_spaceview.do")
	public String spaceview(HttpServletRequest req,HttpSession session,@RequestParam int sn) {
		int room_no = sn;
		List<ReviewDTO> rvlist = guestMapper.getRoomReviewList(room_no);
		session.removeAttribute("sp");
		session.removeAttribute("sdto");
		SpaceRoomDTO srdto = guestMapper.getSpaceRoom(room_no);
		Map<String, Integer> map = new HashMap<>();
		map.put("room_no", room_no);
		int space_no = srdto.getSpace_no();
		SpaceDTO sdto = guestMapper.getSpace(space_no);
		List<SpaceDibsDTO> list = new ArrayList<>();
		MemberDTO mdto = (MemberDTO) session.getAttribute("memberdto");
		if(mdto == null) {
			map.put("member_no", 0);
			list = guestMapper.findLike(map);
		}else {
			int member_no = mdto.getMember_no();
			map.put("member_no",member_no);
			list = guestMapper.findLike(map);
		}
		int res = 0;
		if(list.size()>0) {
			System.out.println("찜목록 있음");
			res = 1;
		}else {
			res=0;
			System.out.println("찜목록 없음");
		}
		System.out.println(srdto.getRoom_time_e());
		System.out.println(srdto.getRoom_time_s());
		
//		Date date_e = srdto.getRoom_time_e();
//		//Date로 가져오기
//		Calendar cal = GregorianCalendar.getInstance();
//		cal.setTime(date_e);
//		System.out.println(cal.get(Calendar.HOUR_OF_DAY));
//		
//		//Date to String 후 가져오기
//		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmm");
//		String strDate_e = format.format(date_e);
//		System.out.println(strDate_e.substring(8, 10));
		
		//Service 이용하기
		String strDate_e = guestMapper.Calendar2String(srdto.getRoom_time_e(), "yyyyMMddHHmm");
		String strDate_s = guestMapper.Calendar2String(srdto.getRoom_time_s(), "yyyyMMddHHmm");
		System.out.println("service이용한거"+strDate_e.substring(8, 10));
		System.out.println("service"+strDate_s.substring(8,10));
		Map<String, Object> resMap = new HashMap<String,Object>();
		resMap.put("strDate_s", strDate_s.substring(8,10));
		resMap.put("strDate_e", strDate_e.substring(8,10));
		req.setAttribute("resMap",resMap);
		req.setAttribute("rvlist", rvlist);
		req.setAttribute("sp", srdto);//SpaceRoom
		req.setAttribute("like", res);//찜 여부
		req.setAttribute("sdto", sdto);//Space
		return "guest/guest_spaceview";
	}
	//예약화면에서 예약하기를 누른 후 보여지는 확인 페이지.
	//예약 내용 확인 페이지.
	@RequestMapping(value = "guest_reserveok.do", method = RequestMethod.POST)
	public String guest_checkout(HttpServletRequest req,HttpSession session, @ModelAttribute ReserveDTO rdto, BindingResult result) {
		if (rdto.getRes_req().equals("")) {
			rdto.setRes_req("요구사항없음");
		}
		String sTime = rdto.getUse_dt();
		String eTime = rdto.getUse_time();
		int totP = rdto.getTotalPrice();
		String res_email = rdto.getRes_email();
		System.out.println("sTime="+sTime);
		System.out.println("eTime="+eTime);
		System.out.println("totP="+totP);
		System.out.println("res_email="+res_email);
		int member_no = Integer.parseInt(req.getParameter("member_no"));
		int room_no = rdto.getRoom_no();
		System.out.println("room_no="+room_no);
		int res = guestMapper.insertReserve(rdto);
		System.out.println("member_no="+member_no);
		Map<String,Object> rmap= new HashMap<String, Object>();
		rmap.put("member_no",member_no);
		rmap.put("room_no",room_no);
		rmap.put("sTime",sTime);
		ReserveDTO rdto1 = guestMapper.getRes_no(rmap);
		Map<String, Integer> paymap = new HashMap<String, Integer>();
		paymap.put("res_no",rdto1.getRes_no());
		paymap.put("pay_m",rdto.getPay_m());
		paymap.put("totPrice",rdto.getTotalPrice());

		int res2 = guestMapper.insertPayment(paymap);;
		if (res > 0) {
			if(res2>0) {
			session.removeAttribute("map");
			session.removeAttribute("sdto");
			session.removeAttribute("srdto");
			req.setAttribute("rdto", rdto);
			req.setAttribute("msg", "예약 성공! 예약리스트로 이동합니다.");
			req.setAttribute("url", "guest_reservelist.do");
			}else {
				req.setAttribute("msg", "결제 입력 정보 실패");
				req.setAttribute("url", "guest_reserve_form.do");
			}
		} else {
			req.setAttribute("msg", "예약실패! 방 상세보기화면으로 이동합니다.");
			req.setAttribute("url", "guest_space.do?room_no=" + rdto.getRoom_no());
		}
	return "/message";
	}	

	//회원 별 예약 리스트 페이지 이동
	@RequestMapping(value = "guest_reservelist.do")
	public String g_reserve_list(HttpServletRequest req,HttpSession session) {
		MemberDTO mdto = (MemberDTO) session.getAttribute("memberdto");
		int member_no = mdto.getMember_no();
		List<ReserveListDTO> reserveList = guestMapper.reserveList(member_no);
		req.setAttribute("reserveList", reserveList);
		return "guest/guest_reserveList";
	}
	//예약 상세 보기 이동
	@RequestMapping(value="guest_reserve_view.do")
	public String guset_reserve_view(HttpServletRequest req, @RequestParam Map<String,String> map) {
		ReserveListDTO reserveView = guestMapper.reserveView(map);
		req.setAttribute("reserveView", reserveView);
		return "guest/guest_reserve_view";
	}
	//찜목록 이동
	@RequestMapping(value="guest_dibs.do")
	public String guest_dibs(HttpServletRequest req, HttpSession session) {
		MemberDTO mdto = (MemberDTO) session.getAttribute("memberdto");
		System.out.println("mdto.getMember_no = " + mdto.getMember_no());
		List<GuestMyDibsDTO> myLikeList = guestMapper.myLikeList(mdto.getMember_no());
		req.setAttribute("myLikeList", myLikeList);
		return "guest/guest_my_dibs";
	}
	//찜하기
	@RequestMapping(value = "guest_like.do")
	public  @ResponseBody int guest_like(HttpSession session,@RequestParam Map<String,Integer> map) {
		MemberDTO mdto = (MemberDTO) session.getAttribute("memberdto");
		int member_no = mdto.getMember_no();
		System.out.println("aaa"+member_no);
		map.put("member_no", member_no);
		List<SpaceDibsDTO> list = guestMapper.findLike(map);
		int res=0;
		if(list.size()<1) {
			res = guestMapper.AddLike(map);
			res = 1;
		}else{
			res = guestMapper.RemoveLike(map);
			res = 0;
		}
		
		return res;
	}
	
	//찜목록 취소(삭제)
	@RequestMapping(value="guest_unLike.do")
	public @ResponseBody Map<String, Object> guest_unLike(HttpServletRequest req, HttpSession session, @RequestParam Map<String,Integer> map) {
		int res = guestMapper.RemoveLike(map);
		Map<String, Object> resMap = new HashMap<String, Object>();
//		if(res>0) {
//			req.setAttribute("msg", "찜목록 삭제! 내 찜목록으로 이동합니다.");
//			System.out.println("찜목록 삭제 성공");
//		}else {
//			req.setAttribute("msg", "찜목록 삭제 실패! 내 찜목록으로 이동합니다.");
//			System.out.println("찜목록 삭제 실패");
//		}
		resMap.put("res", res);
		return resMap;
	}
	
	//예약페이지 이동(ver.ajax)
	@RequestMapping(value = "guest_reserve.do")
	public @ResponseBody Map<String, String> guest_reserve_t(HttpServletRequest req ,HttpSession session,@RequestParam Map<String, String> map) {
		System.out.println("member_no="+map.get("member_no"));
		System.out.println("room_no="+map.get("room_no"));
		System.out.println("space_no="+map.get("space_no"));
		System.out.println("selectedDate="+map.get("selectedDate"));
		System.out.println("selectedTime="+map.get("selectedTime"));
		System.out.println("totalPrice="+map.get("totalPrice"));
		String selectedTime = ((String) map.get("selectedTime")).replace(" ", "");
		String[] stime = selectedTime.split("~");
		System.out.println("strim[0]="+stime[0]);
		System.out.println("strim[1]="+stime[1]);
		String sTime = stime[0];
		String eTime = stime[1];
		map.put("sTime",map.get("selectedDate")+" "+sTime);
		map.put("eTime",map.get("selectedDate")+" "+eTime);
		int space_no = Integer.parseInt((String)map.get("space_no"));
		int room_no = Integer.parseInt((String)map.get("room_no"));
		SpaceDTO sdto = guestMapper.getSpace(space_no);
		SpaceRoomDTO srdto = guestMapper.getSpaceRoom(room_no);
		session.setAttribute("map", map);
		session.setAttribute("sdto", sdto);
		session.setAttribute("srdto", srdto);
		return map;
	}
	@RequestMapping(value="guest_reserve_form.do")
	public String guest_reserve_form(HttpServletRequest req,HttpSession session, @RequestParam Map<String, String>map) {
		SpaceDTO sdto = (SpaceDTO) session.getAttribute("sdto");
		String space_nm = sdto.getSpace_nm();
		String sTime = map.get("sTime");
		Map<String,String>resmap = (Map<String, String>) session.getAttribute("map");
		String eTime = resmap.get("eTime");
		System.out.println("sTime="+sTime);
		System.out.println("eTime="+eTime);
		System.out.println("space_nm="+space_nm);
		return "guest/guest_reserve";
	}
	//예약취소
	@RequestMapping("cancleReserve.do")
	public String cancleReserve(HttpServletRequest req, @ModelAttribute ReserveListDTO rdto) {
		int res = guestMapper.cancleReserve(rdto.getRes_no());
		if (res > 0) {
			req.setAttribute("msg", "취소 성공!! 예약 리스트 페이지로 이동합니다.");
			req.setAttribute("url", "guest_reservelist.do");
		} else {
			req.setAttribute("msg", "오류발생!! 예약 리스트 페이지로 이동합니다.");
			req.setAttribute("url", "guest_reservelist.do");
		}
		return "/message";
	}
	
	

}

