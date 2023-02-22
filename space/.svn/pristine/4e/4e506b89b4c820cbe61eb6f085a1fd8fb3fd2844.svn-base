package com.bigdataB.space;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.IOException;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bigdataB.space.dto.SpaceRoomDTO;
import com.bigdataB.space.service.SpaceRoomMapper;

@Controller
public class SpaceRoomController {
	
	@Autowired
	private SpaceRoomMapper spaceRoomMapper;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		return "main";
	}
	
	//방 관리 목록
	@RequestMapping(value = "/room_list.do") 
	public String listRoom(HttpServletRequest req, @RequestParam(required = false) String pageNum, @ModelAttribute SpaceRoomDTO srdto, HttpSession session) {

		// 처음에는 값이 넘어오는데 페이징시 값이 안넘어와서 세션에 따로 저장해주는 거
		if(srdto.getSpace_no() != 0) {
			session.setAttribute("space_nono", srdto.getSpace_no());
		}
		
		int a = (int)session.getAttribute("space_nono");

		if (pageNum == null) {
			pageNum = "1";
		}
		
		String space_nm = spaceRoomMapper.getSpace_nm(a);
		req.setAttribute("space_nm", space_nm);
		
		

		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 5;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int countRow = spaceRoomMapper.getRoomCount(a);
		if (endRow > countRow) {
			endRow = countRow;
		}
		
		List<SpaceRoomDTO> srlist = spaceRoomMapper.listRoom(startRow, endRow, a);
		
		int page_num = countRow - (startRow - 1);
		req.setAttribute("listRoom", srlist);
		req.setAttribute("page_num", page_num);
		int pageCount = countRow / pageSize + (countRow % pageSize == 0 ? 0 : 1);
		int pageBlock = 3;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("pageBlock", pageBlock);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		return "room/room_list";	
	}

	//방 등록
	@GetMapping("room_input.do")
	public String room_Input(@ModelAttribute SpaceRoomDTO srdto) {
	return "room/room_input";
	}
	
	@PostMapping("room_input.do")
	public String room_InputPro(MultipartHttpServletRequest req,HttpSession session,@RequestParam Map<String, String> map, @ModelAttribute SpaceRoomDTO srdto,
			BindingResult result) {
		if (result.hasErrors()) {
			srdto.setRoom_img1("");
			srdto.setRoom_img2("");
			srdto.setRoom_img3("");
			srdto.setRoom_img4("");
			srdto.setRoom_img5("");
		}
		
		
		
		
		System.out.println(srdto.getRoom_week());
		String[] imgNumber = { "room_img1", "room_img2", "room_img3", "room_img4", "room_img5" };
		String[] fileNames = { "", "", "", "", "" };
		for (int i = 0; i < imgNumber.length; i++) {

			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
			MultipartFile mf = mr.getFile(imgNumber[i]);
			// 파일 업로드
			String filename = mf.getOriginalFilename();
			fileNames[i] = filename;
		
			if (fileNames[i] == null || fileNames[i].equals("")) {
				fileNames[i] = "";
			}else {
				String upPath = session.getServletContext().getRealPath("/resources/img");
				File file = new File(upPath, filename);
				try {
					mf.transferTo(file);
				}catch(IOException e) {
					e.printStackTrace();
					req.setAttribute("msg", "이미지를 업로드시 오류발생!! 다시 입력해 주세요");
				req.setAttribute("url", "room_input.do");
				return "/message";
				}
			}
		
		}
	
		srdto.setRoom_img1(fileNames[0]);
		srdto.setRoom_img2(fileNames[1]);
		srdto.setRoom_img3(fileNames[2]);
		srdto.setRoom_img4(fileNames[3]);
		srdto.setRoom_img5(fileNames[4]);
		
		if (result.hasErrors()) {
			srdto.setRoom_no(0);
		}
		int res = spaceRoomMapper.insertRoom(srdto);
		
		if (res > 0) {
			req.setAttribute("msg", "방등록 성공, 방관리목록페이지로 이동합니다.");
			req.setAttribute("url", "room_list.do");
		} else {
			req.setAttribute("msg", "방등록 실패. 방 등록 페이지로 이동합니다.");
			req.setAttribute("url", "room_input.do");
		}
		return "/message";
	}
	
	//방 수정
	@RequestMapping(value = "/room_update.do")
	public String room_update(HttpServletRequest req, @ModelAttribute SpaceRoomDTO srdto) {
		srdto = spaceRoomMapper.getRoom(srdto.getRoom_no());
		req.setAttribute("getRoom", srdto);
		HttpSession session = req.getSession();
		String upPath = session.getServletContext().getRealPath("/resources/img");//이미지업로드 경로
		req.setAttribute("upPath", upPath);
		return "room/room_update";
	} 

	@RequestMapping(value = "/room_update_ok.do")
	public String room_updatePro(HttpServletRequest request,HttpSession session, MultipartHttpServletRequest req, @ModelAttribute SpaceRoomDTO srdto,
			BindingResult result) {
		if (result.hasErrors()) {
			srdto.setRoom_img1("");
			srdto.setRoom_img2("");
			srdto.setRoom_img3("");
			srdto.setRoom_img4("");
			srdto.setRoom_img5("");
		}
		System.out.println("srdto.getRoom_no="+srdto.getRoom_no());
		String[] imgNumber = { "room_img1", "room_img2", "room_img3", "room_img4", "room_img5" };
		String[] fileNames = { "", "", "", "", "" };

		for (int i = 0; i < imgNumber.length; i++) {
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
			MultipartFile mf = mr.getFile(imgNumber[i]);
			System.out.println("mf : " + mf);
			System.out.println("filename : " + mf.getOriginalFilename());
			String filename = mf.getOriginalFilename();
			

			fileNames[i] = filename;
			if (fileNames[i] == null || fileNames[i].equals("")) {
				fileNames[i] = "";
			}else {
				String upPath = session.getServletContext().getRealPath("/resources/img");
				File file = new File(upPath, filename);
				try {
					mf.transferTo(file);
				}catch(IOException e) {
					e.printStackTrace();
					req.setAttribute("msg", "이미지를 업로드시 오류발생!! 다시 입력해 주세요");
					req.setAttribute("url", "room_list.do");
					return "/message";
				}
				}
		}
				srdto.setRoom_img1(fileNames[0]);
				srdto.setRoom_img2(fileNames[1]);
				srdto.setRoom_img3(fileNames[2]);
				srdto.setRoom_img4(fileNames[3]);
				srdto.setRoom_img5(fileNames[4]);
				
			int res = spaceRoomMapper.updateRoom(srdto);
			if (res > 0) {
				req.setAttribute("msg", "방정보 수정 성공! 방관리 리스트로 이동합니다.");
				req.setAttribute("url", "room_list.do");
			} else {
				req.setAttribute("msg", "방정보 수정 실패! 예약 상세페이지로 이동합니다.");
				req.setAttribute("url", "guest_reserve_view.do?room_no=" + srdto.getRoom_no());
			}

		return "/message";
	}
	//방정보 삭제
	@RequestMapping("/room_delete.do")
	public String deleteRoom(HttpServletRequest req, @RequestParam Map<String, String> map) {
		int res = spaceRoomMapper.deleteRoom(Integer.parseInt(map.get("room_no")));
		if (res > 0) {
			String[] fn = { "room_img1", "room_img2", "room_img3", "room_img4", "room_img5" };

			HttpSession session = req.getSession();
			String upPath = (String) session.getAttribute("upPath");
			for (int i = 0; i < fn.length; ++i) {
				map.put("filename", fn[i]);
				File file = new File(upPath, map.get("filename"));
				file.delete();
				if (!file.exists()) {
					req.setAttribute("msg", "삭제 실패!! 방 관리목록페이지로 이동합니다.");
					req.setAttribute("url", "room_list.do");
				}
			}
			
			req.setAttribute("msg", "방정보 삭제(이미지도 삭제) 성공!! 방 관리목록페이지로 이동합니다.");
			req.setAttribute("url", "room_list.do");
		}
		return "/message";
	}
}