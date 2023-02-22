package com.bigdataB.space.service;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bigdataB.space.dto.HostListDTO;
import com.bigdataB.space.dto.MemberDTO;
import com.bigdataB.space.dto.ReserveDTO;
import com.bigdataB.space.dto.ReservedRoomDTO;
import com.bigdataB.space.dto.RoomListDTO;
import com.bigdataB.space.dto.SpaceDTO;
import com.bigdataB.space.dto.SpaceTypeDTO;



@Service
public class AdminMapper {
	@Autowired
	private SqlSession sqlSession;
	
	public List<HostListDTO> mainData(){
		return sqlSession.selectList("mainData");
	}
	
	public int getCount(String value) {
		return sqlSession.selectOne("getCount",value);
	}
	public int getCountHost() {
		return sqlSession.selectOne("getCountHost");
	}
	public int getCountSearch(Map<String,Object> map) {
		return sqlSession.selectOne("getCountSearch",map);
	}
	public int getCountSearchHost(Map<String,Object> map) {
		return sqlSession.selectOne("getCountSearchHost",map);
	}
	public int getCountSearchGuest(Map<String,Object> map) {
		return sqlSession.selectOne("getCountSearchGuest",map);
	}
	public int getCountSearchRoom(Map<String,Object> map) {
		return sqlSession.selectOne("getCountSearchRoom",map);
	}
	public int getCountSearchReserve(Map<String,Object> map) {
		return sqlSession.selectOne("getCountSearchReserve",map);
	}
	public int getCountSearchCate(Map<String,Object> map) {
		return sqlSession.selectOne("getCountSearchCate",map);
	}
	
	
	
	 
	public int insertCate(SpaceTypeDTO dto) {
		return sqlSession.insert("insertCate",dto); 
	}

	
	public List<SpaceTypeDTO> listCate(Map<String,Object> map){
		return sqlSession.selectList("listCate",map);
	}
	public List<SpaceTypeDTO> searchCate(Map<String,Object> map){
		return sqlSession.selectList("searchCate",map);
	}

	
	
	public List<MemberDTO> listGuest(Map<String,Object> map){
		return sqlSession.selectList("listGuest",map);
	}
	public List<MemberDTO> searchGuest(Map<String,Object> map){
		return sqlSession.selectList("searchGuest",map);
	}
	
	
	
	public List<HostListDTO> listHost(Map<String,Object> map){ 
		return sqlSession.selectList("listHost",map);
	}
	public List<HostListDTO> searchHost(Map<String,Object> map){
		return sqlSession.selectList("searchHost",map);
	}


	
	public List<RoomListDTO> listRoom(Map<String,Object> map){
		return sqlSession.selectList("listSpaceRoom",map);
	}
	public List<RoomListDTO> searchRoom(Map<String,Object> map){
		return sqlSession.selectList("searchRoom",map);
	}

	
	
	public List<ReservedRoomDTO>listReserve(Map<String,Object> map){
		return sqlSession.selectList("listReserve",map);
	}
	public List<ReservedRoomDTO>searchReserve(Map<String,Object> map){
		return sqlSession.selectList("searchReserve",map);
	}
	
	
	
	public int deleteMember(int member_no) {
		return sqlSession.update("deleteMember",member_no);
	}
	public int ifHasBuilding(int member_no) {
		return sqlSession.selectOne("ifHasBuilding",member_no);
	}
	public MemberDTO getMemberNm(int member_no) {
		return sqlSession.selectOne("getMemberNm", member_no);
	}
	
	
	
	public int deleteBuilding(int space_no) {
		return sqlSession.delete("deleteBuilding", space_no);
	}
	
	 
	
	public int ifHasRoom(int space_no) {
		return sqlSession.selectOne("ifHasRoom",space_no);
	}
	public SpaceDTO getSpaceNm(int space_no) {
		return sqlSession.selectOne("getSpaceNm", space_no);
	}
	
	
	
	public int ifHasReservation(int room_no) {
		return sqlSession.selectOne("ifHasReservation",room_no);
	}
	public int deleteSpaceRoom(int room_no) {
		return sqlSession.update("deleteSpaceRoom",room_no);
	}
	
	
	
	
	public int isFinished(int res_no) {
		return sqlSession.selectOne("isFinished",res_no);
	}
	public int deleteReservation(int res_no) {
		return sqlSession.update("deleteReservation",res_no);
	}
	
	public List<ReserveDTO> reservedDateNTime(int room_no){
		return sqlSession.selectList("reservedDateNTime",room_no);		
	}

	public int deleteCate(int cate_no) {
		return sqlSession.update("CateDel",cate_no);
	}
	
	
	public int approveRoom(int room_no) {
		return sqlSession.update("approveRoom",room_no);
	}
	
	public int cancelReserve(int res_no) {
		return sqlSession.update("cancelReserve",res_no);
	}
	
}
























