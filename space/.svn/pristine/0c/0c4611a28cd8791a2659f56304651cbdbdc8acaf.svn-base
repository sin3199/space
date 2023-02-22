package com.bigdataB.space;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bigdataB.space.dto.HostListDTO;
import com.bigdataB.space.dto.MemberDTO;
import com.bigdataB.space.dto.ReservedRoomDTO;
import com.bigdataB.space.dto.RoomListDTO;
import com.bigdataB.space.dto.SpaceDTO;
import com.bigdataB.space.dto.SpaceTypeDTO;
import com.bigdataB.space.service.AdminMapper;

@Controller
public class AdminController {

	@Autowired
	private AdminMapper adminMapper;

	@RequestMapping(value = "main.do")
	public String main() { // 전체메인으로 이동
		return "main";
	}

	@RequestMapping(value = { "admin_main.do" })
	public String adminMain(HttpServletRequest req) { // admin 메인으로 이동

		String space_room = "space_room where room_st = 0";
		String reserve = "reserve where res_st != 1 and res_st != 4";
		String member = "member where member_grade != 3 and member_grade != 4";

		int roomCount = adminMapper.getCount(space_room);
		int resCount = adminMapper.getCount(reserve);
		int memCount = adminMapper.getCount(member);
		List<HostListDTO> list = adminMapper.mainData();
		req.setAttribute("mainData", list);
		req.setAttribute("roomCount", roomCount);
		req.setAttribute("resCount", resCount);
		req.setAttribute("memCount", memCount);

		return "admin/admin_main";
	}

	@RequestMapping(value = "/admin_insertCategory.do", method = RequestMethod.GET)
	public String admin_insertCategory() { // 카테고리 입력 페이지로 이동
		return "admin/admin_insertCategory";
	}

	@RequestMapping("/admin_listCategory.do")
	public String admin_listCategory(HttpServletRequest req, @RequestParam Map<String, Object> map, String pageNum,String sort) {
		if (!map.containsKey("sort")) { // 카테고리 목록 불러오기
			map.put("sort", "desc");
		}

		if(sort != null) {
			map.put("sort", sort);
		}
		if (pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 10;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		String space_type = "space_type where cate_st = 0";
		int countRow = adminMapper.getCount(space_type);
		if (endRow > countRow)
			endRow = countRow;

		map.put("startRow", startRow);
		map.put("endRow", endRow);

		List<SpaceTypeDTO> list = adminMapper.listCate(map);
		
		int num = countRow - (startRow - 1);
		req.setAttribute("listCate", list);
		req.setAttribute("num", num);
		
		int pageCount = countRow / pageSize + (countRow % pageSize == 0 ? 0 : 1);
		int pageBlock = 5;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("pageBlock", pageBlock);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);

		return "admin/admin_listCategory";
	}
	
	@RequestMapping("catedel.do")
	public String catedel(HttpServletRequest req, @RequestParam int cate_no) {
		int del = adminMapper.deleteCate(cate_no);
		if(del==1) {
			req.setAttribute("url", "admin_listCategory.do");
			req.setAttribute("msg", "카테고리 삭제 성공");
		}else {
			req.setAttribute("url", "admin_listCategory.do");
			req.setAttribute("msg", "카테고리 삭제 실패");
		}
		
		return "message";
	}

	@RequestMapping("/category_sort.do") // 카테고리 목록에서 데이터 정렬 시키기
	public @ResponseBody Map<String, Object> SpaceTypeSort(HttpServletRequest req, @RequestParam Map<String, Object> map, String pageNum, String sort) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		if (pageNum == null) {
			pageNum = "1";
		}
		if(sort!=null) {
			map.put("sort", sort);
		}
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 10;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		String space_type = "space_type where cate_st = 0";
		int countRow = adminMapper.getCount(space_type);
		
		if (endRow > countRow)
			endRow = countRow;

		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		
		List<SpaceTypeDTO> list = adminMapper.listCate(map);
		
		int num = countRow - (startRow - 1);
		
		int pageCount = countRow / pageSize + (countRow % pageSize == 0 ? 0 : 1);
		int pageBlock = 5;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		
		resMap.put("list", list);
		resMap.put("pageCount", pageCount);
		resMap.put("pageBlock", pageBlock);
		resMap.put("startPage", startPage);
		resMap.put("endPage", endPage);
		resMap.put("sort",sort);
		
		return resMap;
	}

	@RequestMapping("/search_cate.do") // 카테고리 목록에서 검색 하고 데이터 정렬 시키기
	public @ResponseBody Map<String,Object> search_cate(@RequestParam Map<String, Object> map,String pageNum, String column, String sort) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		if (column==null) {
			map.put("column", "cate_nm");
		}
		if (pageNum == null) {
			pageNum = "1";
		}
		if(!map.containsKey("column")) {
			map.put("column", column);
			map.put("sort", sort);
		}
		
		
		map.put("table", "member");
		
		
		
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 15;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		
		int countRow = adminMapper.getCountSearchCate(map);
		
		if (endRow > countRow)
			endRow = countRow;

		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<SpaceTypeDTO> list = adminMapper.searchCate(map);
		
		
		int pageCount = countRow / pageSize + (countRow % pageSize == 0 ? 0 : 1);
		int pageBlock = 5;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		
		resMap.put("list", list);
		resMap.put("pageCount", pageCount);
		resMap.put("pageBlock", pageBlock);
		resMap.put("startPage", startPage);
		resMap.put("endPage", endPage);
		resMap.put("column", column);
		resMap.put("sort", sort);
		resMap.put("select",map.get("select"));
		resMap.put("search",map.get("search"));
		return resMap;
	}

	@RequestMapping("/admin_listGuest.do") // 게스트 목록 불러오기
	public String admin_listGuest(HttpServletRequest req, @RequestParam Map<String, Object> map,String pageNum) {
		if (!map.containsKey("column")) {
			map.put("column", "member_nm");
			map.put("sort", "desc");
		}
		
		if (pageNum == null) {
			pageNum = "1";
		}
		
		
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 15;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		String member = "member where member_grade = 1";
		int countRow = adminMapper.getCount(member);
		if (endRow > countRow)
			endRow = countRow;

		map.put("startRow", startRow);
		map.put("endRow", endRow);

		List<MemberDTO> list = adminMapper.listGuest(map);
		
		int num = countRow - (startRow - 1);
		req.setAttribute("listGuest", list);
		req.setAttribute("num", num);
		
		int pageCount = countRow / pageSize + (countRow % pageSize == 0 ? 0 : 1);
		int pageBlock = 5;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("pageBlock", pageBlock);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);

		
		
		return "admin/admin_listGuest";
	}

	@RequestMapping("/guest_sort.do") // 게스트 목록에서 데이터 정렬 시키기
	public @ResponseBody Map<String,Object> guest_sort(@RequestParam Map<String, Object> map,String pageNum, String column, String sort) {
		Map<String, Object> resMap = new HashMap<String, Object>();

		if (!map.containsKey("column")) {
			map.put("column", "member_nm");
			map.put("sort", "desc");
		}
		
		if (pageNum == null) {
			pageNum = "1";
		}
		
		if(column != null) {
			map.put("column", column);
			map.put("sort", sort);
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 15;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		String member = "member where member_grade = 1";
		int countRow = adminMapper.getCount(member);
		
		if (endRow > countRow)
			endRow = countRow;

		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		
		List<MemberDTO> list = adminMapper.listGuest(map);
		
		
		int pageCount = countRow / pageSize + (countRow % pageSize == 0 ? 0 : 1);
		int pageBlock = 5;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		
		resMap.put("list", list);
		resMap.put("pageCount", pageCount);
		resMap.put("pageBlock", pageBlock);
		resMap.put("startPage", startPage);
		resMap.put("endPage", endPage);
		resMap.put("column", column);
		resMap.put("sort", sort);
		
		return resMap;
	}

	@RequestMapping("/search_guest.do") // 게스트 목록에서 검색하고 데이터 정렬 시키기
	public @ResponseBody Map<String,Object> search_guest(@RequestParam Map<String, Object> map, String pageNum,String sort, String column) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		if (map.get("column")==null) {
			map.put("column", "member_nm");
			map.put("sort", "desc");
		}
		if (pageNum == null) {
			pageNum = "1";
		}
		if(!map.containsKey("column")) {
			map.put("column", column);
			map.put("sort", sort);
		}
		
		
		map.put("table", "member");
		
		
		
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 15;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		
		int countRow = adminMapper.getCountSearchGuest(map);
		
		if (endRow > countRow)
			endRow = countRow;

		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<MemberDTO> list = adminMapper.searchGuest(map);
		
		
		int pageCount = countRow / pageSize + (countRow % pageSize == 0 ? 0 : 1);
		int pageBlock = 5;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		
		resMap.put("list", list);
		resMap.put("pageCount", pageCount);
		resMap.put("pageBlock", pageBlock);
		resMap.put("startPage", startPage);
		resMap.put("endPage", endPage);
		resMap.put("column", column);
		resMap.put("sort", sort);
		resMap.put("select",map.get("select"));
		resMap.put("search",map.get("search"));
		return resMap;
		
	}

	@RequestMapping("/admin_listHost.do") // 호스트 목록 불러오기
	public String admin_listHost(HttpServletRequest req, @RequestParam Map<String, Object> map,String pageNum) {
		
		if (!map.containsKey("column")) {
			map.put("column", "member_nm");
			map.put("sort", "desc");
		}
		
		if (pageNum == null) {
			pageNum = "1";
		}
		
		
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 15;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		
		int countRow = adminMapper.getCountHost();
		if (endRow > countRow)
			endRow = countRow;

		map.put("startRow", startRow);
		map.put("endRow", endRow);

		List<HostListDTO> list = adminMapper.listHost(map);
		
		int num = countRow - (startRow - 1);
		req.setAttribute("listHost", list);
		req.setAttribute("num", num);
		
		int pageCount = countRow / pageSize + (countRow % pageSize == 0 ? 0 : 1);
		int pageBlock = 5;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("pageBlock", pageBlock);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		
		return "admin/admin_listHost";
	}

	@RequestMapping("/host_sort.do") // 호스트 목록에서 데이터 정렬 시키기
	public @ResponseBody Map<String,Object> host_sort(@RequestParam Map<String, Object> map,String pageNum, String sort, String column) {
		Map<String, Object> resMap = new HashMap<String, Object>();

		if (!map.containsKey("column")) {
			map.put("column", "member_nm");
			map.put("sort", "desc");
		}
		
		if (pageNum == null) {
			pageNum = "1";
		}
		
		if(column != null) {
			map.put("column", column);
			map.put("sort", sort);
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 15;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int countRow = adminMapper.getCountHost();
		
		if (endRow > countRow)
			endRow = countRow;

		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		
		List<HostListDTO> list = adminMapper.listHost(map);
		
		
		int pageCount = countRow / pageSize + (countRow % pageSize == 0 ? 0 : 1);
		int pageBlock = 5;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		
		resMap.put("list", list);
		resMap.put("pageCount", pageCount);
		resMap.put("pageBlock", pageBlock);
		resMap.put("startPage", startPage);
		resMap.put("endPage", endPage);
		resMap.put("column", column);
		resMap.put("sort", sort);
		
		return resMap;
	}

	@RequestMapping("/search_host.do") // 호스트 목록에서 검색하고 데이터 정렬 시키기
	public @ResponseBody Map<String,Object> search_host(@RequestParam Map<String, Object> map,String pageNum, String sort, String column) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		if (map.get("column")==null) {
			map.put("column", "member_nm");
			map.put("sort", "desc");
		}
		if (pageNum == null) {
			pageNum = "1";
		}
		if(column != null) {
			map.put("column", column);
			map.put("sort", sort);
		}
		
		
		map.put("table", "member");
		
		
		
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 15;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		
		int countRow = adminMapper.getCountSearchHost(map);
		
		if (endRow > countRow)
			endRow = countRow;

		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<HostListDTO> list = adminMapper.searchHost(map);
		
		
		int pageCount = countRow / pageSize + (countRow % pageSize == 0 ? 0 : 1);
		int pageBlock = 5;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		
		resMap.put("list", list);
		resMap.put("pageCount", pageCount);
		resMap.put("pageBlock", pageBlock);
		resMap.put("startPage", startPage);
		resMap.put("endPage", endPage);
		resMap.put("column", column);
		resMap.put("sort", sort);
		resMap.put("select",map.get("select"));
		resMap.put("search",map.get("search"));
		return resMap;
	}

	@RequestMapping(value = "/admin_insertCategory.do", method = RequestMethod.POST) // 카테고리 입력
	public String cate_insert(HttpServletRequest req, @ModelAttribute SpaceTypeDTO dto, BindingResult result) {

		if (result.hasErrors()) {
			dto.setCate_img("");
		}

		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
		MultipartFile file = mr.getFile("cate_img");
		HttpSession session = req.getSession();

		String upPath = session.getServletContext().getRealPath("/resources/img/cateIcon");

		File target = new File(upPath, file.getOriginalFilename());

		try {
			file.transferTo(target);
		} catch (IOException e) {
			e.printStackTrace();
		}

		dto.setCate_img(file.getOriginalFilename());

		int res = adminMapper.insertCate(dto);
		if (res > 0) {
			req.setAttribute("msg", "카테고리 등록 성공!");
			req.setAttribute("url", "admin_listCategory.do");
		} else {
			req.setAttribute("msg", "카테고리 등록 실패!!");
			req.setAttribute("url", "admin_insertCategory.do");
		}
		return "message";
	}

	@RequestMapping("/admin_listRoom.do") // 호스트 공간관리 목록 불러오기
	public String admin_listRoom(HttpServletRequest req, @RequestParam Map<String, Object> map,
			@RequestParam(defaultValue = "0") int hola, String pageNum) {
		if (!map.containsKey("column")) {
			map.put("column", "room_st");
			map.put("sort", "desc");
		}
		if (pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 15;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		String space_room = "space_room where room_st != 4";
		int countRow = adminMapper.getCount(space_room);
		if (endRow > countRow)
			endRow = countRow;
		
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		if (hola == 0) {
			List<RoomListDTO> list = adminMapper.listRoom(map);
			req.setAttribute("listSpaceRoom", list);
		
		} else { // hostList 에서 건물이름을 클릭했을시 건물이 있으면 hola값(space_no값 get방식이라 아무말 hola로 썼디)
					// 을 받아서 검색결과를 listRoom 에서 출력
			map.put("select", "m.member_no");
			map.put("search", hola);
			List<RoomListDTO> list = adminMapper.searchRoom(map);
			req.setAttribute("searchRoom", list);
		}
		int num = countRow - (startRow - 1);
		req.setAttribute("num", num);
		req.setAttribute("hola", hola);
		int pageCount = countRow / pageSize + (countRow % pageSize == 0 ? 0 : 1);
		int pageBlock = 5;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("pageBlock", pageBlock);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);

		return "admin/admin_listRoom";
	}

	@RequestMapping("/roomList_sort.do") // 호스트 공간관리 목록에서 데이터 정렬시키기
	public @ResponseBody Map<String,Object> roomList_sort(@RequestParam Map<String, Object> map, String pageNum, String sort, String column) {
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		if (!map.containsKey("column")) {
			map.put("column", "member_nm");
			map.put("sort", "desc");
		}
		if (pageNum == null) {
			pageNum = "1";
		}
		if(column != null) {
			map.put("column", column);
			map.put("sort", sort);
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 15;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		String space_room = "space_room where room_st != 4";
		int countRow = adminMapper.getCount(space_room);
		
		if (endRow > countRow)
			endRow = countRow;

		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		
		List<RoomListDTO> list = adminMapper.listRoom(map);
		
		
		int pageCount = countRow / pageSize + (countRow % pageSize == 0 ? 0 : 1);
		int pageBlock = 5;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		
		resMap.put("list", list);
		resMap.put("pageCount", pageCount);
		resMap.put("pageBlock", pageBlock);
		resMap.put("startPage", startPage);
		resMap.put("endPage", endPage);
		resMap.put("column", column);
		resMap.put("sort", sort);
		
		return resMap;
		
	}

	@RequestMapping("/search_listRoom.do") // 호스트 공간관리 목록에서 데이터 검색하고 정렬시키기
	public @ResponseBody Map<String,Object> roomList_search(HttpServletRequest req,
			@RequestParam Map<String, Object> map, String pageNum, String column, String sort) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		if (map.get("column")==null) {
			map.put("column", "member_nm");
			map.put("sort", "desc");
		}

		if (column == null) {
			map.put("column", column);
			map.put("sort", sort);
		}
		
		if (pageNum == null) {
			pageNum = "1";
		}
		
		
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 15;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		
		int countRow = adminMapper.getCountSearchRoom(map);
		if (endRow > countRow)
			endRow = countRow;

		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<RoomListDTO> list = adminMapper.searchRoom(map);
		
		
		int pageCount = countRow / pageSize + (countRow % pageSize == 0 ? 0 : 1);
		int pageBlock = 5;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		
		resMap.put("list", list);
		resMap.put("pageCount", pageCount);
		resMap.put("pageBlock", pageBlock);
		resMap.put("startPage", startPage);
		resMap.put("endPage", endPage);
		resMap.put("column", column);
		resMap.put("sort", sort);
		resMap.put("select",map.get("select"));
		resMap.put("search",map.get("search"));
		return resMap;
	}

	@RequestMapping("/admin_listReserve.do") // 룸예약리스트 목록 불러오기
	public String admin_listReserve(HttpServletRequest req, @RequestParam Map<String, Object> map,
			@RequestParam(defaultValue = "0") int RR, String pageNum) {
		
		if (!map.containsKey("column")) {
			map.put("column", "res_nm");
			map.put("sort", "desc");
		}
		if (pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 15;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int countRow;
		
		if (RR == 0) {
			String reserve = "reserve";
			countRow = adminMapper.getCount(reserve);
			if (endRow > countRow)
				endRow = countRow;
			
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			List<ReservedRoomDTO> list = adminMapper.listReserve(map);
			int num = countRow - (startRow - 1);
			req.setAttribute("listReserve", list);	
			req.setAttribute("num", num);
		
		} else {
			map.put("select", "sr.room_no");
			map.put("search", RR);
			countRow = adminMapper.getCountSearchReserve(map);
			if (endRow > countRow)
				endRow = countRow;
			
			map.put("startRow", startRow);
			map.put("endRow", endRow);

			List<ReservedRoomDTO> list = adminMapper.searchReserve(map);
			int res = adminMapper.ifHasReservation(RR);
			req.setAttribute("remainedReservation", res);
			req.setAttribute("searchReserve", list);
		}
		req.setAttribute("RR", RR);
		
		
		int pageCount = countRow / pageSize + (countRow % pageSize == 0 ? 0 : 1);
		int pageBlock = 5;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("pageBlock", pageBlock);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		
		return "admin/admin_listReserve";
	}

	@RequestMapping("/listReserve_sort.do") // 룸예약리스트 목록에서 데이터 정렬시키기
	public @ResponseBody Map<String,Object> listReserve_sort(@RequestParam Map<String, Object> map, String pageNum, String sort, String column) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		if (!map.containsKey("column")) {
			map.put("column", "res_nm");
			map.put("sort", "desc");
		}
		
		if (pageNum == null) {
			pageNum = "1";
		}
		
		if(column != null) {
			map.put("column", column);
			map.put("sort", sort);
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 15;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		String reserve = "reserve";
		int countRow = adminMapper.getCount(reserve);
		
		if (endRow > countRow)
			endRow = countRow;

		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		
		List<ReservedRoomDTO> list = adminMapper.listReserve(map);
		
		
		int pageCount = countRow / pageSize + (countRow % pageSize == 0 ? 0 : 1);
		int pageBlock = 5;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		
		resMap.put("list", list);
		resMap.put("pageCount", pageCount);
		resMap.put("pageBlock", pageBlock);
		resMap.put("startPage", startPage);
		resMap.put("endPage", endPage);
		resMap.put("column", column);
		resMap.put("sort", sort);
		
		return resMap;
	}

	@RequestMapping("/search_listReserve.do") // 룸예약리스트 목록에서 데이터 검색하고 정렬시키기
	public @ResponseBody Map<String,Object> listReserve_search(@RequestParam Map<String, Object> map,String pageNum, String column, String sort) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		if (!map.containsKey("column")) {
			map.put("column", "res_nm");
			map.put("sort", "desc");
		}
		
		if (pageNum == null) {
			pageNum = "1";
		}
		
		if(column != null) {
			map.put("column", column);
			map.put("sort", sort);
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 15;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int countRow = adminMapper.getCountSearchReserve(map);
		
		if (endRow > countRow)
			endRow = countRow;

		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		
		List<ReservedRoomDTO> list = adminMapper.searchReserve(map);
		
		
		int pageCount = countRow / pageSize + (countRow % pageSize == 0 ? 0 : 1);
		int pageBlock = 5;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		
		resMap.put("list", list);
		resMap.put("pageCount", pageCount);
		resMap.put("pageBlock", pageBlock);
		resMap.put("startPage", startPage);
		resMap.put("endPage", endPage);
		resMap.put("column", column);
		resMap.put("sort", sort);
		resMap.put("select",map.get("select"));
		resMap.put("search",map.get("search"));
		
		return resMap;
	}

	@RequestMapping("/memberDelete.do") // 회원 삭제 호스트 게스트 일단 한번에 쿼리문도 하나로 합치기 고려중
	public String deleteMember(HttpServletRequest req, @RequestParam int member_no) {
		int ifHasBuilding = adminMapper.ifHasBuilding(member_no); // 회원번호로 건물이 있는지
		MemberDTO dto = adminMapper.getMemberNm(member_no); // 회원번호로 건물이름 받아오기

		if (ifHasBuilding == 0) {
			int res = adminMapper.deleteMember(member_no); // 건물이 없다면 회원 삭제
			if (res > 0) {
				req.setAttribute("msg", "회원 삭제 성공");
				req.setAttribute("url", "javascript:window.location.replace(document.referrer);");
			} else {
				req.setAttribute("msg", "회원 삭제 실패 메인 페이지로 이동합니다.");
				req.setAttribute("url", "admin_main.do");
			}
		} else { // 건물이 있다면 건물지우고 오게 돌려 보내기
			req.setAttribute("msg", "회원번호 : " + member_no + " 닉네임 : " + dto.getMember_nm() + " 회원을 삭제 하시려면 "
					+ "\\n 해당 회원의 건물을 먼저 삭제 하셔야 합니다.");
			req.setAttribute("url", "javascript:window.location.replace(document.referrer);");
		}
		return "message";
	}

	@RequestMapping("/buildingDetail.do") // 건물 상세
	public String detailBuilding(RedirectAttributes ra, HttpServletRequest req, @RequestParam int space_no) {
		int ifHasRoom = adminMapper.ifHasRoom(space_no); // 건물번호로 방이 있는지
		SpaceDTO dto = adminMapper.getSpaceNm(space_no); // 건물번호로 방 이름 받아오기
		if (ifHasRoom == 0) {
			req.setAttribute("msg", "해당 공간에 등록된 룸이 없습니다.");
			req.setAttribute("url", "javascript:window.location.replace(document.referrer);");
		} else { // 방이 있다면 방을 검색해서 listRoom페이지로 이동해 띄워주기
			ra.addAttribute("hola", dto.getMember_no()); // sort 정보담은 데이터
			return "redirect:/admin_listRoom.do";
		}
		return "message";
	}

	@RequestMapping("/roomDelete.do") // 방 삭제
	public String roomDelete(RedirectAttributes ra, HttpServletRequest req, @RequestParam int room_no) {
		int ifHasReservation = adminMapper.ifHasReservation(room_no);
		// 방 번호를 넘겨줘서 예약 리스트 뽑아오기
		if (ifHasReservation == 0) {
			// 삭제 구현 해야함.
			int res = adminMapper.deleteSpaceRoom(room_no);
			if (res == 0) {
				req.setAttribute("msg", "남아있는 예약건이 확인되지 않습니다. 확인후 다시 시도해 주세요");
				req.setAttribute("url", "javascript:window.location.replace(document.referrer);");
			} else {
				req.setAttribute("msg", "방 삭제를 완료했습니다.");
				req.setAttribute("url", "javascript:window.location.replace(document.referrer);");
			}
		} else { // 남아있는 예약건이 있다면 예약을 검색해서 listReserve 페이지로 이동헤 띄워주기
			ra.addAttribute("RR", room_no);
			return "redirect:/admin_listReserve.do";
		}
		return "message";

	}

	@RequestMapping("/reserveDelete.do") // 예약목록 삭제
	public String reserveDelete(HttpServletRequest req, @RequestParam int res_no) {
		int isFinished = adminMapper.isFinished(res_no); // 예약번호를 가지고 가서 예약완료된 건 이면서 날짜가 지나지 않은 예약인지 확인
		if (isFinished == 0) {
			// isFinished 에 부합 하면 0을 반환 예약날짜가 도래하지 않은 건 이기때문에
			// 바로 삭제 하지 않고 예약취소를 하거나 예약건 완료 후 삭제 하게 유도.
			req.setAttribute("msg", "예약 날짜가 남아있는 예약건입니다. \\n예약 취소를 먼저 진행하고 삭제 해 주세요");
			req.setAttribute("url", "javascript:window.location.replace(document.referrer);");
		} else { // 그 외의 건이면 예약 상태를 4번으로 돌려 리스트에서 보이지 않게 해 삭제된것처럼 구현
			int res = adminMapper.deleteReservation(res_no);
			if (res == 0) {
				req.setAttribute("msg", "예약 삭제 실패!!");
				req.setAttribute("url", "javascript:window.location.replace(document.referrer);");
			} else {
				req.setAttribute("msg", "예약 삭제 성공!!");
				req.setAttribute("url", "javascript:window.location.replace(document.referrer);");
			}
		}
		return "message";
	}
	
	@RequestMapping("/approveRoom.do") //호스트가 신청한 방등록 승인
	public String approveRoom(HttpServletRequest req, @RequestParam int room_no) {
		int res = adminMapper.approveRoom(room_no);
		if (res == 0) {
			req.setAttribute("msg", "방 승인에 실패 했습니다. 다시 시도해 주세요.");
			req.setAttribute("url", "javascript:window.location.replace(document.referrer);");
		} else {
			req.setAttribute("msg", "방 등록 승인을 완료했습니다.");
			req.setAttribute("url", "javascript:window.location.replace(document.referrer);");
		}
		
		return "message";
	}
	
	@RequestMapping("/cancelReserve.do")
	public String cancelReserve(HttpServletRequest req, @RequestParam int res_no) {
		int res = adminMapper.cancelReserve(res_no);
		if (res == 0) {
			req.setAttribute("msg", "예약취소에 실패 했습니다. 다시 시도해 주세요.");
			req.setAttribute("url", "javascript:window.location.replace(document.referrer);");
		} else {
			req.setAttribute("msg", "예약취소로 상태변경 완료 되었습니다.");
			req.setAttribute("url", "javascript:window.location.replace(document.referrer);");
		}		
		return "message";
	}

}
