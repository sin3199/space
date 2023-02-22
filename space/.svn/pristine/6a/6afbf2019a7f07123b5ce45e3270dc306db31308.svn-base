
$(document).ready(function() {
  $('.form-control').change(function() {
    var result = $('.form-control option:selected').val();
    if (result == 'member_reg_dt') {
	$(".form-search").attr("placeholder","22/12/25, 12/25, 12, 25 형식으로 검색하세요");
    } else if(result == 'use_dt'){
	$(".form-search").attr("placeholder","22/12/25, 12/25, 12, 25 형식으로 검색하세요");
    } else {
    $(".form-search").attr("placeholder"," ");
    }
  }); 
}); 


$("#file").on('change',function(){
	  var fileName = $("#file").val();
	  $(".upload-name").val(fileName);
});

function approveCheck(){
	return confirm('방 등록을 승인 하시겠습니까?');
}

function removeCheck(){
	return confirm('정말로 삭제 하시겠습니까?');
}

function cancelCheck(){
	return confirm('정말로 해당 예약건을 취소 하시겠습니까?');
}

$(".deleteMember").on("click",function(){
	var str = "";
	var tdArr = new Array();
	var deleteBtn = $(this);
	var tr = deleteBtn.parent();
	var td = tr.children();
	console.log("클릭한 row의 모든 데이터 :" + tr.text());
	
	var nm = td.eq(0).text();
	var email = td.eq(1).text();
	var pw = td.eq(2).text();
	var reg_dt = td.eq(3).text(); 
	var pno = td.eq(4).text();
	
	console.log("닉네임 :" +nm+"이메일 :" +email+ "비밀번호 :"+pw+ "가입일자 :" +reg_dt+ "연락처 :" +pno);
}); 
	
	
	//<!-- 정렬 아이콘 토글 클릭 할때마다 변경 -->


	$(document).on("click", "#member_reg_dt, #member_nm, #member_email, #member_pno", function(){
		$(this).toggleClass("uil-sort-amount-down uil-sort-amount-up");
	});
	
	$("#cate_nm").on("click",function(){
		$(this).toggleClass("uil-sort-amount-down uil-sort-amount-up");
	});

	$(document).on("click", "#host_nm, #host_email, #host_reg_dt, #host_pno, #space_nm, #space_comnum", function(){
		$(this).toggleClass("uil-sort-amount-down uil-sort-amount-up");
	});

	$(document).on("click", "#room_host_nm, #room_cate_nm, #room_nm, #room_price, #room_fit, #room_desc, #room_img1, #room_time, #room_date, #room_st", function(){
		$(this).toggleClass("uil-sort-amount-down uil-sort-amount-up");
	});
	
	
	$(document).on("click", "#res_nm, #res_room_nm, #res_use_dt, #res_use_time, #res_space_pno, #res_pno, #res_email, #res_personnel, #res_st", function(){
		$(this).toggleClass("uil-sort-amount-down uil-sort-amount-up");
	});
	
	
	
	//<!-- 추가된 정렬아이콘 클릭 토글  검색후 불러온 데이터에 대한 sort 버튼 토글 -->
	
	$(document).on("click","#search_host_nm, #search_host_email, #search_host_reg_dt, #search_host_pno, #search_space_nm, #search_space_comnum",function(){
		$(this).toggleClass("uil-sort-amount-down uil-sort-amount-up");
	});
	
	$(document).on("click", "#search_guest_nm, #search_guest_email, #search_guest_reg_dt, #search_guest_pno", function(){
		$(this).toggleClass("uil-sort-amount-down uil-sort-amount-up");
	});
	
	$(document).on("click", "#search_cate_nm", function(){
		$(this).toggleClass("uil-sort-amount-down uil-sort-amount-up");
	});

	$(document).on("click", "#search_room_host_nm, #search_room_cate_nm, #search_room_nm, #search_room_price, #search_room_fit, #search_room_desc, #search_room_img1, #search_room_time, #search_room_date, #search_room_st", function(){
		$(this).toggleClass("uil-sort-amount-down uil-sort-amount-up");
	});
	
	$(document).on("click", "#search_res_nm, #search_res_room_nm, #search_res_use_dt, #search_res_use_time, #search_res_space_pno, #search_res_pno, #search_res_email, #search_res_personnel, #search_res_st", function(){
		$(this).toggleClass("uil-sort-amount-down uil-sort-amount-up");	
	});
	

//<!-- ajax로 DB에 넣어줄 정렬데이터 넘겨주기 -->
//<!--검색 후 처리 ajax 전체 코드가 길어져서 우선 host,guest,cate,room,reserve 순으로 각각 정렬,검색,검색후정렬 순으로 작성함 -->
//<!--listHost 정렬 -->
 
function sortHost(data){
	$.ajax({
		type:'POST'
		, url:'host_sort.do'
		,dataType: "json"
		, data: data
		, success: function(data) {
		console.log(data);
		$(".table-body").empty();	
		 	var str = '<TR>';
			$.each(data.list, function(i){
				 str += '<TD>' + this.member_nm + '</TD>';
				 str += '<TD>' + this.member_email + '</TD>';
				 str += '<TD>' + this.member_reg_dt + '</TD>';
				 str += '<TD>' + this.member_pno + '</TD>';
				 str += '<td class="detailBuilding"><a href="buildingDetail.do?space_no='+this.space_no+'">'+this.space_nm +'</a></TD>';
				 str += '<TD>' + this.space_comnum + '</TD>';
				 str += '<td class="deleteMember"><a href="memberDelete.do?member_no='+this.member_no+'" onclick="return removeCheck();">삭제</a></td>';
				 str += '</TR>';
			});
	    $(".table-body").append(str);
	    
	    var sort = data.sort;
	    var column = data.column;
	    
	    var startPage = data.startPage;
		var endPage = data.endPage;
		var pageBlock = data.pageBlock;
		var pageCount = data.pageCount;
		var list = data.list;
	    
	    
	    $(".paging").empty();
		
		
		if(list.length > 0 && list != null && list != undefined){
			var page = '';
			if(startPage > pageBlock){
				page += "[<a href='javascript:sortHost({pageNum: "+(startPage-1)+", sort: \"" + sort +"\", column: \"" + column + "\"})'>이전</a>] "
			} 
			
			
			for(var i=startPage; i<= endPage; i++){
				page += "[<a href='javascript:sortHost({pageNum: "+i+", sort: \"" + sort +"\", column: \"" + column + "\"})'>" + i + "</a>] "
			}
	
			if(pageCount > endPage){
				page += "[<a href='javascript:sortHost({pageNum: "+(endPage+1)+", sort: \"" + sort +"\", column: \"" + column + "\"})'>다음</a>] "
			}
		}

		$(".paging").append(page);
	    
	    
	    
	    
	    
   	 	}
		,error: function(err) {
			console.log("에러"+err);
		}
	})
}




//<!--HostList 버튼눌러 검색 후 List -->

$("#hostSearchButton").on("click",function(){
	hostSearch(
	{
			select : $(".form-control").val(),
			search : $(".form-search").val(),
			column : "member_nm",
			sort : "asc"
		}
	);
	
});

$("#hostSearch").on("keyup",function(key){
        if(key.keyCode==13) {
           hostSearch(
           {
			select : $(".form-control").val(),
			search : $(".form-search").val(),
			column : "member_nm",
			sort : "asc"
		}
           );
        }
});

function hostSearch(data){
	$.ajax({
		type: 'POST'
		, url: 'search_host.do'
		, dataType: "json"
		, data : data
		,success: function(data){
		console.log(data);
			$(".table-head").empty();
			$(".table-body").empty();
			
				var hds = '<tr>';
				hds +=	'<th>닉네임<i id="search_host_nm" class="uil uil-sort-amount-down"></i></th>'
				hds +=	'<th>이메일<i id="search_host_email" class="uil uil-sort-amount-down"></i></th>'
				hds +=	'<th>가입일자<i id="search_host_reg_dt" class="uil uil-sort-amount-down"></i></th>'
				hds +=	'<th>연락처<i id="search_host_pno" class="uil uil-sort-amount-down"></i></th>'
				hds +=	'<th>건물이름<i id="search_space_nm" class="uil uil-sort-amount-down"></i></th>'
				hds +=	'<th>사업자번호<i id="search_space_comnum" class="uil uil-sort-amount-down"></i></th>'
				hds +=	'<th class="textPosition">삭제</th>'
				hds +=	'</tr>'
			$(".table-head").append(hds);
			
			
			
		 	var str = '<TR>';
			$.each(data.list, function(i){
				 str += '<TD>' + this.member_nm + '</TD>';
				 str += '<TD>' + this.member_email + '</TD>';
				 str += '<TD>' + this.member_reg_dt + '</TD>';
				 str += '<TD>' + this.member_pno + '</TD>';
				 str += '<td class="detailBuilding"><a href="buildingDetail.do?space_no='+this.space_no+'">'+this.space_nm +'</a></TD>';
				 str += '<TD>' + this.space_comnum + '</TD>';
				 str += '<td class="deleteMember"><a href="memberDelete.do?member_no='+this.member_no+'" onclick="return removeCheck();">삭제</a></td>';
				 str += '</TR>';
			});
		    $(".table-body").append(str);
		    
		    var sort = data.sort;
	   		var column = data.column;
	    
		    var startPage = data.startPage;
			var endPage = data.endPage;
			var pageBlock = data.pageBlock;
			var pageCount = data.pageCount;
			var list = data.list;
			
			var search = data.search;
			var select = data.select;
	   	 
	    
	   		$(".paging").empty();
		
		
			if(list.length > 0 && list != null && list != undefined){
				var page = '';
				if(startPage > pageBlock){
					page += "[<a href='javascript:hostSearch({pageNum: "+(startPage-1)+", sort: \"" + sort +"\", column: \"" + column + "\", select: \"" + select + "\", search: \"" + search + "\"})'>이전</a>] "
				} 
				for(var i=startPage; i<= endPage; i++){
					page += "[<a href='javascript:hostSearch({pageNum: "+i+", sort: \"" + sort +"\", column: \"" + column + "\", select: \"" + select + "\", search: \"" + search + "\"})'>" + i + "</a>] "
				}
	
				if(pageCount > endPage){
					page += "[<a href='javascript:hostSearch({pageNum: "+(endPage+1)+", sort: \"" + sort +"\", column: \"" + column + "\", select: \"" + select + "\", search: \"" + search + "\"})'>다음</a>] "
				}
			}

			$(".paging").append(page);
   	 	
   	 	}
		,error:function(request,status,error){
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}		
		})
}



//<!-- HostList 검색 후 정렬용 함수 밑에서 클릭시 data 받음-->
function searchHostSort(data){
    $.ajax({
    type: 'POST'
    , url: 'search_host.do'
    , dataType: "json"
    , data : data
    ,success: function(data){
    console.log(data);
        $(".table-body").empty();
         var str = '<TR>';
        $.each(data.list, function(i){
             str += '<TD>' + this.member_nm + '</TD>';
             str += '<TD>' + this.member_email + '</TD>';
             str += '<TD>' + this.member_reg_dt + '</TD>';
             str += '<TD>' + this.member_pno + '</TD>';
             str += '<td class="detailBuilding"><a href="buildingDetail.do?space_no='+this.space_no+'">'+this.space_nm +'</a></TD>';
             str += '<TD>' + this.space_comnum + '</TD>';
             str += '<td class="deleteMember"><a href="memberDelete.do?member_no='+this.member_no+'" onclick="return removeCheck();">삭제</a></td>';
             str += '</TR>';
        });
        $(".table-body").append(str);
        
        var sort = data.sort;
          var column = data.column;
          
        var startPage = data.startPage;
        var endPage = data.endPage;
        var pageBlock = data.pageBlock;
        var pageCount = data.pageCount;
        var list = data.list;
        
        var select = data.select;
        var search = data.search;
    
    
        $(".paging").empty();
    
    
    if(list.length > 0 && list != null && list != undefined){
        var page = '';
        if(startPage > pageBlock){
            page += "[<a href='javascript:searchHostSort({pageNum: "+(startPage-1)+", sort: \"" + sort +"\", column: \"" + column + "\", select: \"" + select + "\", search: \"" + search + "\"})'>이전</a>] "
        } 
        
        
        for(var i=startPage; i<= endPage; i++){
            page += "[<a href='javascript:searchHostSort({pageNum: "+i+", sort: \"" + sort +"\", column: \"" + column + "\", select: \"" + select + "\", search: \"" + search + "\"})'>" + i + "</a>] "
        }

        if(pageCount > endPage){
            page += "[<a href='javascript:searchHostSort({pageNum: "+(endPage+1)+", sort: \"" + sort +"\", column: \"" + column + "\", select: \"" + select + "\", search: \"" + search + "\"})'>다음</a>] "
        }
    }

    $(".paging").append(page);
        
        
            }
    ,error:function(request,status,error){
        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    }		
    })
}



//<!--listGuest 정렬-->
function sortGuest(data){
	$.ajax({
		type:'POST'
		, url:'guest_sort.do'
		,dataType: "json"
		, data: data
		, success: function(data) {
		console.log(data);
		$(".table-body").empty();	
		 	var str = '<TR>';
			$.each(data.list, function(i){
				 str += '<TD>' + this.member_nm + '</TD><TD>' +this.member_email + '</TD><TD>' + this.member_reg_dt + '</TD><TD>' + this.member_pno + '<td class="deleteMember"><a href="memberDelete.do?member_no='+this.member_no+'" onclick="return removeCheck();">' + '삭제' + '</a></td>';
				 str += '</TR>';
			});
	    $(".table-body").append(str);
	    
	    var sort = data.sort;
	    var column = data.column;
	    
	    var startPage = data.startPage;
		var endPage = data.endPage;
		var pageBlock = data.pageBlock;
		var pageCount = data.pageCount;
		var list = data.list;
		
		$(".paging").empty();
		
		
		if(list.length > 0 && list != null && list != undefined){
			var page = '';
			if(startPage > pageBlock){
				page += "[<a href='javascript:sortGuest({pageNum: "+(startPage-1)+", sort: \"" + sort +"\", column: \"" + column + "\"})'>이전</a>] "
			} 
			
			
			for(var i=startPage; i<= endPage; i++){
				page += "[<a href='javascript:sortGuest({pageNum: "+i+", sort: \"" + sort +"\", column: \"" + column + "\"})'>" + i + "</a>] "
			}
	
			if(pageCount > endPage){
				page += "[<a href='javascript:sortGuest({pageNum: "+(endPage+1)+", sort: \"" + sort +"\", column: \"" + column + "\"})'>다음</a>] "
			}
		}

		$(".paging").append(page);
	    
	    
	    
   	 	}
		,error: function(err) {
			console.log("에러"+err);
		}
	})
}





//<!--GuestList 버튼눌러 검색 후 List-->
$("#guestSearchButton").on("click",function(){
	guestSearch(
	{
			select : $(".form-control").val(),
			search : $(".form-search").val(),
			column : "member_nm",
			sort : "asc"
		}
	);
});

$("#guestSearch").on("keyup",function(key){
        if(key.keyCode==13) {
           guestSearch(
           {
			select : $(".form-control").val(),
			search : $(".form-search").val(),
			column : "member_nm",
			sort : "asc"
		}
           );
        }
});


function guestSearch(data){
	$.ajax({
		type: 'POST'
		, url: 'search_guest.do'
		, dataType: "json"
		, data : data
		,success: function(data){
			$(".table-head").empty();
			$(".table-body").empty();
			
			var hds = '<tr>';
				hds +=	'<th>닉네임<i id="search_guest_nm" class="uil uil-sort-amount-down"></i></th>'
				hds +=	'<th>이메일<i id="search_guest_email" class="uil uil-sort-amount-down"></i></th>'
				hds +=	'<th>가입일자<i id="search_guest_reg_dt" class="uil uil-sort-amount-down"></i></th>'
				hds +=	'<th>연락처<i id="search_guest_pno" class="uil uil-sort-amount-down"></i></th>'
				hds +=	'<th class="textPosition">삭제</th>'
				hds +=	'</tr>'
			$(".table-head").append(hds);
			
		 	var str = '<TR>';
			$.each(data.list, function(i){
				 str += '<TD>' + this.member_nm + '</TD>';
				 str += '<TD>' + this.member_email + '</TD>';
				 str += '<TD>' + this.member_reg_dt + '</TD>';
				 str += '<TD>' + this.member_pno + '</TD>';
				 str += '<TD class="deleteMember"><A href="memberDelete.do?member_no='+this.member_no+'" onclick="return removeCheck();">삭제</A></TD>';
				 str += '</TR>';
			});
		    $(".table-body").append(str);
		    
		    
		    var sort = data.sort;
	   		var column = data.column;
	    
		    var startPage = data.startPage;
			var endPage = data.endPage;
			var pageBlock = data.pageBlock;
			var pageCount = data.pageCount;
			var list = data.list;
			
			var search = data.search;
			var select = data.select;
	   	 
	    
	   		$(".paging").empty();
		
		
			if(list.length > 0 && list != null && list != undefined){
				var page = '';
				if(startPage > pageBlock){
					page += "[<a href='javascript:guestSearch({pageNum: "+(startPage-1)+", sort: \"" + sort +"\", column: \"" + column + "\", select: \"" + select + "\", search: \"" + search + "\"})'>이전</a>] "
				} 
				for(var i=startPage; i<= endPage; i++){
					page += "[<a href='javascript:guestSearch({pageNum: "+i+", sort: \"" + sort +"\", column: \"" + column + "\", select: \"" + select + "\", search: \"" + search + "\"})'>" + i + "</a>] "
				}
	
				if(pageCount > endPage){
					page += "[<a href='javascript:guestSearch({pageNum: "+(endPage+1)+", sort: \"" + sort +"\", column: \"" + column + "\", select: \"" + select + "\", search: \"" + search + "\"})'>다음</a>] "
				}
			}

			$(".paging").append(page);
		    
		    
		    
   	 		}
		,error:function(request,status,error){
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}		
		})
}




//<!--GuestList 검색 후 정렬용 함수 밑에서 클릭시 data 받음 -->
function searchGuestSort(data){
    $.ajax({
    type: 'POST'
    , url: 'search_guest.do'
    , dataType: "json"
    , data : data
    ,success: function(data){
        $(".table-body").empty();
         var str = '<TR>';
        $.each(data.list, function(i){
             str += '<TD>' + this.member_nm + '</TD>';
             str += '<TD>' + this.member_email + '</TD>';
             str += '<TD>' + this.member_reg_dt + '</TD>';
             str += '<TD>' + this.member_pno + '</TD>';
             str += '<td class="deleteMember"><a href="memberDelete.do?member_no='+this.member_no+'" onclick="return removeCheck();">삭제</a></td>';
             str += '</TR>';
        });
        $(".table-body").append(str);
        
        
         var sort = data.sort;
           var column = data.column;
    
        var startPage = data.startPage;
        var endPage = data.endPage;
        var pageBlock = data.pageBlock;
        var pageCount = data.pageCount;
        var list = data.list;
        
        var search = data.search;
        var select = data.select;
        
    
           $(".paging").empty();
    
    
        if(list.length > 0 && list != null && list != undefined){
            var page = '';
            if(startPage > pageBlock){
                page += "[<a href='javascript:searchGuestSort({pageNum: "+(startPage-1)+", sort: \"" + sort +"\", column: \"" + column + "\", select: \"" + select + "\", search: \"" + search + "\"})'>이전</a>] "
            } 
            for(var i=startPage; i<= endPage; i++){
                page += "[<a href='javascript:searchGuestSort({pageNum: "+i+", sort: \"" + sort +"\", column: \"" + column + "\", select: \"" + select + "\", search: \"" + search + "\"})'>" + i + "</a>] "
            }

            if(pageCount > endPage){
                page += "[<a href='javascript:searchGuestSort({pageNum: "+(endPage+1)+", sort: \"" + sort +"\", column: \"" + column + "\", select: \"" + select + "\", search: \"" + search + "\"})'>다음</a>] "
            }
        }

        $(".paging").append(page);
        
        
            }
    ,error:function(request,status,error){
        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    }		
    })
}


//<!--listCate정렬-->
function sortCate(data){
	$.ajax({
		type:'POST'
		, url:'category_sort.do'
		,dataType: "json"
		, data: data
		
		, success: function(data) {
		console.log(data);
		$(".table-body").empty();
		 	var str = '<TR>';
			$.each(data.list, function(i){
				 str += '<TD>' + this.cate_nm + '</TD><TD><img src="/resources/img/cateIcon/'+this.cate_img+'" width="200" height="180"></TD>'
				 str += '<TD><a href="catedel.do?cate_no='+this.cate_no+'" onclick="return removeCheck();">삭제</a></TD>';
				 str += '</TR>';
			});
	    $(".table-body").append(str);
	    
	    
	   	var startPage = data.startPage;
		var endPage = data.endPage;
		var pageBlock = data.pageBlock;
		var pageCount = data.pageCount;
		var list = data.list;
		let sort = data.sort;
		
		
		console.log(data.sort);
		console.log(sort);
		console.log(pageCount);
		console.log(startPage);
		console.log(endPage);
		console.log(list);
		console.log(pageBlock);
		
		
		$(".paging").empty();
		
		if(list.length > 0 && list != null && list != undefined){
			var page = '';
			if(startPage > pageBlock){
					page += "[<a href='javascript:sortCate({pageNum: "+(startPage-1)+", sort: \"" + sort +"\"})'>이전</a>] "
			} 
		 
			for(var i=startPage; i<= endPage; i++){
					page += "[<a href='javascript:sortCate({pageNum: "+i+", sort: \"" + sort +"\"})'>" + i + "</a>] "
			}
	
			if(pageCount > endPage){
					page += "[<a href='javascript:sortCate({pageNum: "+(endPage+1)+", sort: \"" + sort +"\"})'>다음</a>] "
			}
		}

		$(".paging").append(page);
		
		}
		
		,error: function(err) {
			console.log("에러"+err);
		}
	})
}





//<!--CateList 버튼눌러 검색 후 List-->
$("#cateSearchButton").on("click",function(){
	cateSearch();
});

$("#cateSearch").on("keyup",function(key){
        if(key.keyCode==13) {
           cateSearch();
        }
});


function cateSearch(){
	$.ajax({
		type: 'POST'
		, url: 'search_cate.do'
		, dataType: "json"
		, data : {
			select : $(".form-control").val(),
			search : $(".form-search").val()
		}
		,success: function(data){
			$(".table-head").empty();
			$(".table-body").empty();
			
			var hds = '<tr>';
				hds +=	'<th>카테고리명<i id="search_cate_nm" class="uil uil-sort-amount-down"></i></th>'
				hds +=	'<th>아이콘</th>'
				hds +=	'<th class="textPosition">삭제</th>'
				hds +=	'</tr>'
			$(".table-head").append(hds);
			
		 	var str = '<TR>';
			$.each(data.list, function(i){
				 str += '<TD>' + this.cate_nm + '</TD>';
				 str += '<TD><img src="/resources/img/cateIcon/' + this.cate_img + '" width="200" height="180"></TD>';
				 str += '<TD><a href="catedel.do?cate_no='+this.cate_no+'" onclick="return removeCheck();">삭제</a></TD>';
				 str += '</TR>';
			});
		    $(".table-body").append(str);
		    
		    
		    
		  
	   	var startPage = data.startPage;
		var endPage = data.endPage;
		var pageBlock = data.pageBlock;
		var pageCount = data.pageCount;
		var list = data.list;
		var sort = data.sort;
		var column = data.column;
		var search = data.search;
        var select = data.select;
		
		console.log(data.sort);
		console.log(sort);
		console.log(pageCount);
		console.log(startPage);
		console.log(endPage);
		console.log(list);
		console.log(pageBlock);
		
		
		$(".paging").empty();
		
		if(list.length > 0 && list != null && list != undefined){
            var page = '';
            if(startPage > pageBlock){
                page += "[<a href='javascript:cateSearch({pageNum: "+(startPage-1)+", sort: \"" + sort +"\", column: \"" + column + "\", select: \"" + select + "\", search: \"" + search + "\"})'>이전</a>] "
            } 
            for(var i=startPage; i<= endPage; i++){
                page += "[<a href='javascript:cateSearch({pageNum: "+i+", sort: \"" + sort +"\", column: \"" + column + "\", select: \"" + select + "\", search: \"" + search + "\"})'>" + i + "</a>] "
            }

            if(pageCount > endPage){
                page += "[<a href='javascript:cateSearch({pageNum: "+(endPage+1)+", sort: \"" + sort +"\", column: \"" + column + "\", select: \"" + select + "\", search: \"" + search + "\"})'>다음</a>] "
            }
        }

		$(".paging").append(page);
		    
		    
		    
		    
		    
		    
   	 		}
		,error:function(request,status,error){
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}		
		})
}


//<!--CateList 검색 후 정렬용 함수 밑에서 클릭시 data 받음 -->
function searchCateSort(data){
    $.ajax({
    type: 'POST'
    , url: 'search_cate.do'
    , dataType: "json"
    , data : data
    ,success: function(data){
        $(".table-body").empty();
         var str = '<TR>';
        $.each(data.list, function(i){
             str += '<TD>' + this.cate_nm + '</TD>';
             str += '<TD><img src="/resources/img/cateIcon/' + this.cate_img + '" width="200" height="180"></TD>';
             str += '<TD>삭제</TD>';
             str += '</TR>';
        });
        $(".table-body").append(str);
        
        
        
        
	   	var startPage = data.startPage;
		var endPage = data.endPage;
		var pageBlock = data.pageBlock;
		var pageCount = data.pageCount;
		var list = data.list;
		var sort = data.sort;
		var column = data.column;
		
		
		var search = data.search;
        var select = data.select;
		
		console.log(data.sort);
		console.log(sort);
		console.log(pageCount);
		console.log(startPage);
		console.log(endPage);
		console.log(list);
		console.log(pageBlock);
		
		
		$(".paging").empty();
		
		if(list.length > 0 && list != null && list != undefined){
            var page = '';
            if(startPage > pageBlock){
                page += "[<a href='javascript:searchCateSort({pageNum: "+(startPage-1)+", sort: \"" + sort +"\", column: \"" + column + "\", select: \"" + select + "\", search: \"" + search + "\"})'>이전</a>] "
            } 
            for(var i=startPage; i<= endPage; i++){
                page += "[<a href='javascript:searchCateSort({pageNum: "+i+", sort: \"" + sort +"\", column: \"" + column + "\", select: \"" + select + "\", search: \"" + search + "\"})'>" + i + "</a>] "
            }

            if(pageCount > endPage){
                page += "[<a href='javascript:searchCateSort({pageNum: "+(endPage+1)+", sort: \"" + sort +"\", column: \"" + column + "\", select: \"" + select + "\", search: \"" + search + "\"})'>다음</a>] "
            }
        }

		$(".paging").append(page);
        
        
        
        
            }
    ,error:function(request,status,error){
        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    }		
    })
}



//<!-- listRoom 정렬 -->

function sortRoomList(data){
	$.ajax({
		type:'POST'
		, url:'roomList_sort.do'
		,dataType: "json"
		, data: data
		, success: function(data) {
		console.log(data);
		$(".table-body").empty();	
		 	var str = '<TR>';
			$.each(data.list, function(i){
				 str += '<TD>' + this.member_nm + '</TD>';
				 str += '<TD>' + this.cate_nm + '</TD>';
				 str += '<TD>' + this.room_nm + '</TD>';
				 str += '<TD>' + this.room_price + ' 원</TD>';
				 str += '<TD>' + this.room_fit + ' 명</TD>';
				 str += '<TD>' + this.room_desc + '</TD>';
				 str += '<td><img src="/resources/img/'+ this.room_img1+'" width="200" height="180"></td>';
				 str += '<TD>' + this.room_time_s +' ~ '+ this.room_time_e + '</TD>';
				 str += '<TD>' + this.room_week + '</TD>';
				 if(this.room_st == '승인대기중'){
				 	str += '<td><a class="approveRoom" href="approveRoom.do?room_no=' +this.room_no+ '" onclick="return approveCheck();">'+ this.room_st + '</a></td>';
				 } else{
				 	str += '<td>'+ this.room_st +'</td>';
				 }
				 str += '<td class="deleteRoom"><a href="roomDelete.do?room_no='+this.room_no+'" onclick="return removeCheck();">삭제</a></td>';
				 str += '</TR>';
			});
	    $(".table-body").append(str);
	    
	    
	    
	     
	   	var startPage = data.startPage;
		var endPage = data.endPage;
		var pageBlock = data.pageBlock;
		var pageCount = data.pageCount;
		var list = data.list;
		var sort = data.sort;
		var column = data.column;
	    
	    
	    $(".paging").empty();
		
		
		if(list.length > 0 && list != null && list != undefined){
			var page = '';
			if(startPage > pageBlock){
				page += "[<a href='javascript:sortRoomList({pageNum: "+(startPage-1)+", sort: \"" + sort +"\", column: \"" + column + "\"})'>이전</a>] "
			} 
			
			
			for(var i=startPage; i<= endPage; i++){
				page += "[<a href='javascript:sortRoomList({pageNum: "+i+", sort: \"" + sort +"\", column: \"" + column + "\"})'>" + i + "</a>] "
			}
	
			if(pageCount > endPage){
				page += "[<a href='javascript:sortRoomList({pageNum: "+(endPage+1)+", sort: \"" + sort +"\", column: \"" + column + "\"})'>다음</a>] "
			}
		}

		$(".paging").append(page);
	    
	    
	    
   	 	}
		,error:function(request,status,error){
        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
	})
}



//<!-- RoomList 버튼눌러 검색 후 List  -->
$("#listRoomSearchButton").on("click",function(){
	listRoomSearch({	
				select : $(".form-control").val(),
				search : $(".form-search").val(),
				column : $(".form-control").val(),
				sort : "asc"
				}
	);
});

$("#listRoomSearch").on("keyup",function(key){
        if(key.keyCode==13) {
           listRoomSearch(
           {	
				select : $(".form-control").val(),
				search : $(".form-search").val(),
				column : $(".form-control").val(),
				sort : "asc"
				}
			);
        }
});

function listRoomSearch(data){
	$.ajax({
		type: 'POST'
		, url: 'search_listRoom.do'
		, dataType: "json"
		, data : data
		,success: function(data){
		console.log(data);
			$(".table-head").empty();
			$(".table-body").empty();
			
			var hds = '<tr>';
				hds +=	'<th>Host 닉네임<i id="search_room_host_nm" class="uil uil-sort-amount-down"></i></th>'
				hds +=	'<th>카테고리<i id="search_room_cate_nm" class="uil uil-sort-amount-down"></i></th>'
				hds +=	'<th>방 이름<i id="search_room_nm" class="uil uil-sort-amount-down"></i></th>'
				hds +=	'<th>방 가격<i id="search_room_price" class="uil uil-sort-amount-down"></i></th>'
				hds +=	'<th>수용인원<i id="search_room_fit" class="uil uil-sort-amount-down"></i></th>'
				hds +=	'<th>방설명<i id="search_room_desc" class="uil uil-sort-amount-down"></i></th>'
				hds +=	'<th>대표이미지</th>'
				hds +=	'<th>대여가능시간<i id="search_room_time" class="uil uil-sort-amount-down"></i></th>'
				hds +=	'<th>휴무요일<i id="search_room_date" class="uil uil-sort-amount-down"></i></th>'
				hds +=	'<th>승인상태<i id="search_room_st" class="uil uil-sort-amount-down"></i></th>'
				hds +=	'<th class="textPosition">삭제</th>'
				hds +=	'</tr>'
			$(".table-head").append(hds);
			
		 	var str = '<TR>';
			$.each(data.list, function(i){
				 str += '<TD>' + this.member_nm + '</TD>';
				 str += '<TD>' + this.cate_nm + '</TD>';
				 str += '<TD>' + this.room_nm + '</TD>';
				 str += '<TD>' + this.room_price + ' 원</TD>';
				 str += '<TD>' + this.room_fit + ' 명</TD>';
				 str += '<TD>' + this.room_desc + '</TD>';
				 str += '<td><img src="/resources/img/'+ this.room_img1+'" width="200" height="180"></td>';
				 str += '<TD>' + this.room_time_s +' ~ '+ this.room_time_e + '</TD>';
				 str += '<TD>' + this.room_week + '</TD>';
				 if(this.room_st == '승인대기중'){
				 	str += '<td><a class="approveRoom" href="approveRoom.do?room_no=' +this.room_no+ '" onclick="return approveCheck();">'+ this.room_st + '</a></td>';
				 } else{
				 	str += '<td>'+ this.room_st +'</td>';
				 }
				 str += '<td class="deleteRoom"><a href="roomDelete.do?room_no='+this.room_no+'" onclick="return removeCheck();">삭제</a></td>';
				 str += '</TR>';
			});
		    $(".table-body").append(str);
		    
		    
		    var sort = data.sort;
	   		var column = data.column;
	    
		    var startPage = data.startPage;
			var endPage = data.endPage;
			var pageBlock = data.pageBlock;
			var pageCount = data.pageCount;
			var list = data.list;
			
			var search = data.search;
			var select = data.select;
	   	 
	    
	   		$(".paging").empty();
		
		
			if(list.length > 0 && list != null && list != undefined){
				var page = '';
				if(startPage > pageBlock){
					page += "[<a href='javascript:listRoomSearch({pageNum: "+(startPage-1)+", sort: \"" + sort +"\", column: \"" + column + "\", select: \"" + select + "\", search: \"" + search + "\"})'>이전</a>] "
				} 
				for(var i=startPage; i<= endPage; i++){
					page += "[<a href='javascript:listRoomSearch({pageNum: "+i+", sort: \"" + sort +"\", column: \"" + column + "\", select: \"" + select + "\", search: \"" + search + "\"})'>" + i + "</a>] "
				}
	
				if(pageCount > endPage){
					page += "[<a href='javascript:listRoomSearch({pageNum: "+(endPage+1)+", sort: \"" + sort +"\", column: \"" + column + "\", select: \"" + select + "\", search: \"" + search + "\"})'>다음</a>] "
				}
			}

			$(".paging").append(page);
		    
		    
   	 		}
		,error:function(request,status,error){
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}		
		})
}




//<!--RoomList 검색 후 정렬용 함수 밑에서 클릭시 data 받음 -->
function searchRoomListSort(data){
    $.ajax({
    type: 'POST'
    , url: 'search_listRoom.do'
    , dataType: "json"
    , data : data
    ,success: function(data){
    console.log(data);
        $(".table-body").empty();
         var str = '<TR>';
        $.each(data.list, function(i){
             str += '<TD>' + this.member_nm + '</TD>';
             str += '<TD>' + this.cate_nm + '</TD>';
             str += '<TD>' + this.room_nm + '</TD>';
             str += '<TD>' + this.room_price + ' 원</TD>';
             str += '<TD>' + this.room_fit + ' 명</TD>';
             str += '<TD>' + this.room_desc + '</TD>';
             str += '<td><img src="/resources/img/'+ this.room_img1+'" width="200" height="180"></td>';
				 str += '<TD>' + this.room_time_s +' ~ '+ this.room_time_e + '</TD>';
				 str += '<TD>' + this.room_week + '</TD>';
				 if(this.room_st == '승인대기중'){
				 	str += '<td><a class="approveRoom" href="approveRoom.do?room_no=' +this.room_no+ '" onclick="return approveCheck();">'+ this.room_st + '</a></td>';
				 } else{
				 	str += '<td>'+ this.room_st +'</td>';
				 }
             str += '<td class="deleteRoom"><a href="roomDelete.do?room_no='+this.room_no+'" onclick="return removeCheck();">삭제</a></td>';
             str += '</TR>';
        });
        $(".table-body").append(str);
        
        
        var sort = data.sort;
           var column = data.column;
    
        var startPage = data.startPage;
        var endPage = data.endPage;
        var pageBlock = data.pageBlock;
        var pageCount = data.pageCount;
        var list = data.list;
        
        var search = data.search;
        var select = data.select;
        
    
           $(".paging").empty();
    
    
        if(list.length > 0 && list != null && list != undefined){
            var page = '';
            if(startPage > pageBlock){
                page += "[<a href='javascript:searchRoomListSort({pageNum: "+(startPage-1)+", sort: \"" + sort +"\", column: \"" + column + "\", select: \"" + select + "\", search: \"" + search + "\"})'>이전</a>] "
            } 
            for(var i=startPage; i<= endPage; i++){
                page += "[<a href='javascript:searchRoomListSort({pageNum: "+i+", sort: \"" + sort +"\", column: \"" + column + "\", select: \"" + select + "\", search: \"" + search + "\"})'>" + i + "</a>] "
            }

            if(pageCount > endPage){
                page += "[<a href='javascript:searchRoomListSort({pageNum: "+(endPage+1)+", sort: \"" + sort +"\", column: \"" + column + "\", select: \"" + select + "\", search: \"" + search + "\"})'>다음</a>] "
            }
        }

        $(".paging").append(page);
        
        
            }
    ,error:function(request,status,error){
        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    }		
    })
}






//<!-- listReserve 정렬 -->

function sortListReserve(data){
	$.ajax({
		type:'POST'
		, url:'listReserve_sort.do'
		,dataType: "json"
		, data: data
		, success: function(data) {
		console.log(data);
		$(".table-body").empty();	
		 	var str = '<TR>';
			$.each(data.list, function(i){
				 str += '<TD>' + this.res_nm + '</TD>';
				 str += '<TD>' + this.room_nm + '</TD>';
				 str += '<TD>' + this.use_dt + '</TD>';
				 str += '<TD>' + this.use_time + '</TD>';
				 str += '<TD>' + this.space_pno + '</TD>';
				 str += '<TD>' + this.res_pno + '</TD>';
				 str += '<TD>' + this.res_email + '</TD>';
				 str += '<TD>' + this.res_personnel + ' 명</TD>';
				 str += '<td><a class="cancelHover" href="cancelReserve.do?res_no='+this.res_no+'" onclick="return cancelCheck();">'+this.res_st+'</a></td>';
				 str += '<td class="deleteReserve"><a href="reserveDelete.do?res_no='+this.res_no+'" onclick="return removeCheck();">삭제</a></td>';
				 str += '</TR>';
			});
	    $(".table-body").append(str);
	    
	    
	     
	     
	   	var startPage = data.startPage;
		var endPage = data.endPage;
		var pageBlock = data.pageBlock;
		var pageCount = data.pageCount;
		var list = data.list;
		var sort = data.sort;
		var column = data.column;
	    
	    
	    $(".paging").empty();
		
		
		if(list.length > 0 && list != null && list != undefined){
			var page = '';
			if(startPage > pageBlock){
				page += "[<a href='javascript:sortListReserve({pageNum: "+(startPage-1)+", sort: \"" + sort +"\", column: \"" + column + "\"})'>이전</a>] "
			} 
			
			
			for(var i=startPage; i<= endPage; i++){
				page += "[<a href='javascript:sortListReserve({pageNum: "+i+", sort: \"" + sort +"\", column: \"" + column + "\"})'>" + i + "</a>] "
			}
	
			if(pageCount > endPage){
				page += "[<a href='javascript:sortListReserve({pageNum: "+(endPage+1)+", sort: \"" + sort +"\", column: \"" + column + "\"})'>다음</a>] "
			}
		}

		$(".paging").append(page);
	    
	    
	    
   	 	}
		,error:function(request,status,error){
        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
	})
}



//<!-- ReserveList 버튼눌러 검색 후 List  -->
$("#listReserveSearchButton").on("click",function(){
	listReserveSearch({
        select : $(".form-control").val(),
		search : $(".form-search").val(),
		column : $(".form-control").val(),
		sort : "asc"
		}
    );
});

$("#listReserveSearch").on("keyup",function(key){
        if(key.keyCode==13) {
           listReserveSearch(
           {
            select : $(".form-control").val(),
			search : $(".form-search").val(),
			column : $(".form-control").val(),
			sort : "asc"
			}
           );
        }
});

function listReserveSearch(data){
	$.ajax({
		type: 'POST'
		, url: 'search_listReserve.do'
		, dataType: "json"
		, data : data
		,success: function(data){
            console.log(data);
			$(".table-head").empty();
			$(".table-body").empty();
			
			var hds = '<tr>';
				hds +=	'<th>예약자명<i id="search_res_nm" class="uil uil-sort-amount-down"></i></th>'
				hds +=	'<th>방이름<i id="search_res_room_nm" class="uil uil-sort-amount-down"></i></th>'
				hds +=	'<th>이용시작일<i id="search_res_use_dt" class="uil uil-sort-amount-down"></i></th>'
				hds +=	'<th>이용시간<i id="search_res_use_time" class="uil uil-sort-amount-down"></i></th>'
				hds +=	'<th>호스트연락처<i id="search_res_space_pno" class="uil uil-sort-amount-down"></i></th>'
				hds +=	'<th>예약자연락처<i id="search_res_pno" class="uil uil-sort-amount-down"></i></th>'
				hds +=	'<th>예약자이메일<i id="search_res_email" class="uil uil-sort-amount-down"></i></th>'
				hds +=	'<th>예약인원수<i id="search_res_personnel" class="uil uil-sort-amount-down"></i></th>'
				hds +=	'<th>결제유무<i id="search_res_st" class="uil uil-sort-amount-down"></i></th>'
				hds +=	'<th class="textPosition">삭제</th>'
				hds +=	'</tr>'
			$(".table-head").append(hds);
			
		 	var str = '<TR>';
			$.each(data.list, function(i){
				 str += '<TD>' + this.res_nm + '</TD>';
				 str += '<TD>' + this.room_nm + '</TD>';
				 str += '<TD>' + this.use_dt + '</TD>';
				 str += '<TD>' + this.use_time + '</TD>';
				 str += '<TD>' + this.space_pno + '</TD>';
				 str += '<TD>' + this.res_pno + '</TD>';
				 str += '<TD>' + this.res_email + '</TD>';
				 str += '<TD>' + this.res_personnel + ' 명</TD>';
				 str += '<td><a class="cancelHover" href="cancelReserve.do?res_no='+this.res_no+'" onclick="return cancelCheck();">'+this.res_st+'</a></td>';
				 str += '<td class="deleteReserve"><a href="reserveDelete.do?res_no='+this.res_no+'" onclick="return removeCheck();">삭제</a></td>';
				 str += '</TR>';
			});
		    $(".table-body").append(str);


            var sort = data.sort;
	   		var column = data.column;
	    
		    var startPage = data.startPage;
			var endPage = data.endPage;
			var pageBlock = data.pageBlock;
			var pageCount = data.pageCount;
			var list = data.list;
			
			var search = data.search;
			var select = data.select;
	   	 
	    
	   		$(".paging").empty();
		
		
			if(list.length > 0 && list != null && list != undefined){
				var page = '';
				if(startPage > pageBlock){
					page += "[<a href='javascript:listReserveSearch({pageNum: "+(startPage-1)+", sort: \"" + sort +"\", column: \"" + column + "\", select: \"" + select + "\", search: \"" + search + "\"})'>이전</a>] "
				} 
				for(var i=startPage; i<= endPage; i++){
					page += "[<a href='javascript:listReserveSearch({pageNum: "+i+", sort: \"" + sort +"\", column: \"" + column + "\", select: \"" + select + "\", search: \"" + search + "\"})'>" + i + "</a>] "
				}
	
				if(pageCount > endPage){
					page += "[<a href='javascript:listReserveSearch({pageNum: "+(endPage+1)+", sort: \"" + sort +"\", column: \"" + column + "\", select: \"" + select + "\", search: \"" + search + "\"})'>다음</a>] "
				}
			}

			$(".paging").append(page);


   	 		}
		,error:function(request,status,error){
        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}		
		})
}



//<!--ReserveList 검색 후 정렬용 함수 밑에서 클릭시 data 받음 -->
function searchReserveListSort(data){
    $.ajax({
    type: 'POST'
    , url: 'search_listReserve.do'
    , dataType: "json"
    , data : data
    ,success: function(data){
        console.log(data);
        $(".table-body").empty();
         var str = '<TR>';
        $.each(data.list, function(i){
             str += '<TD>' + this.res_nm + '</TD>';
             str += '<TD>' + this.room_nm + '</TD>';
             str += '<TD>' + this.use_dt + '</TD>';
             str += '<TD>' + this.use_time + '</TD>';
             str += '<TD>' + this.space_pno + '</TD>';
             str += '<TD>' + this.res_pno + '</TD>';
             str += '<TD>' + this.res_email + '</TD>';
             str += '<TD>' + this.res_personnel + ' 명</TD>';
             str += '<TD>' + this.res_st + '</TD>';
             str += '<td class="deleteReserve"><a href="reserveDelete.do?res_no='+this.res_no+'" onclick="return removeCheck();">삭제</a></td>';
             str += '</TR>';
        });
        $(".table-body").append(str);


        var sort = data.sort;
	   		var column = data.column;
	    
		    var startPage = data.startPage;
			var endPage = data.endPage;
			var pageBlock = data.pageBlock;
			var pageCount = data.pageCount;
			var list = data.list;
			
			var search = data.search;
			var select = data.select;
	   	 
	    
	   		$(".paging").empty();
		
		
			if(list.length > 0 && list != null && list != undefined){
				var page = '';
				if(startPage > pageBlock){
					page += "[<a href='javascript:searchReserveListSort({pageNum: "+(startPage-1)+", sort: \"" + sort +"\", column: \"" + column + "\", select: \"" + select + "\", search: \"" + search + "\"})'>이전</a>] "
				} 
				for(var i=startPage; i<= endPage; i++){
					page += "[<a href='javascript:searchReserveListSort({pageNum: "+i+", sort: \"" + sort +"\", column: \"" + column + "\", select: \"" + select + "\", search: \"" + search + "\"})'>" + i + "</a>] "
				}
	
				if(pageCount > endPage){
					page += "[<a href='javascript:searchReserveListSort({pageNum: "+(endPage+1)+", sort: \"" + sort +"\", column: \"" + column + "\", select: \"" + select + "\", search: \"" + search + "\"})'>다음</a>] "
				}
			}

			$(".paging").append(page);

            }
    ,error:function(request,status,error){
        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    }		
    })
}


//<!--검색후 sort icon  click 시 정렬-->
//<!-- HostList search and sort -->

$(document).on("click","#search_host_nm",function(){
	if($("#search_host_nm").hasClass("uil-sort-amount-down")){
		var data = {
				column : "member_nm",
				sort : "asc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
				
		}
	}else{
		var data = {
				column : "member_nm",
				sort : "desc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
		}
	}
	searchHostSort(data);
});


$(document).on("click","#search_host_email",function(){
	if($("#search_host_email").hasClass("uil-sort-amount-down")){
		var data = {
				column : "member_email",
				sort : "asc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
				
		}
	}else{
		var data = {
				column : "member_email",
				sort : "desc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
		}
	}
	searchHostSort(data);
});


$(document).on("click","#search_host_reg_dt",function(){
	if($("#search_host_reg_dt").hasClass("uil-sort-amount-down")){
		var data = {
				column : "member_reg_dt",
				sort : "asc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
				
		}
	}else{
		var data = {
				column : "member_reg_dt",
				sort : "desc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
		}
	}
	searchHostSort(data);
});


$(document).on("click","#search_host_pno",function(){
	if($("#search_host_pno").hasClass("uil-sort-amount-down")){
		var data = {
				column : "member_pno",
				sort : "asc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
				
		}
	}else{
		var data = {
				column : "member_pno",
				sort : "desc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
		}
	}
	searchHostSort(data);
});


$(document).on("click","#search_space_nm",function(){
	if($("#search_space_nm").hasClass("uil-sort-amount-down")){
		var data = {
				column : "space_nm",
				sort : "asc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
				
		}
	}else{
		var data = {
				column : "space_nm",
				sort : "desc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
		}
	}
	searchHostSort(data);
});


$(document).on("click","#search_space_comnum",function(){
	if($("#search_space_comnum").hasClass("uil-sort-amount-down")){
		var data = {
				column : "space_comnum",
				sort : "asc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
				
		}
	}else{
		var data = {
				column : "space_comnum",
				sort : "desc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
		}
	}
	searchHostSort(data);
});



//<!-- GuestList search and sort -->



$(document).on("click","#search_guest_nm",function(){
	if($("#search_guest_nm").hasClass("uil-sort-amount-down")){
		var data = {
				column : "member_nm",
				sort : "asc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
				
		}
	}else{
		var data = {
				column : "member_nm",
				sort : "desc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
		}
	}
	searchGuestSort(data);
});



$(document).on("click","#search_guest_email",function(){
	if($("#search_guest_email").hasClass("uil-sort-amount-down")){
		var data = {
				column : "member_email",
				sort : "asc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
				
		}
	}else{
		var data = {
				column : "member_email",
				sort : "desc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
		}
	}
	searchGuestSort(data);
});




$(document).on("click","#search_guest_reg_dt",function(){
	if($("#search_guest_reg_dt").hasClass("uil-sort-amount-down")){
		var data = {
				column : "member_reg_dt",
				sort : "asc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
				
		}
	}else{
		var data = {
				column : "member_reg_dt",
				sort : "desc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
		}
	}
	searchGuestSort(data);
});



$(document).on("click","#search_guest_pno",function(){
	if($("#search_guest_pno").hasClass("uil-sort-amount-down")){
		var data = {
				column : "member_pno",
				sort : "asc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
				
		}
	}else{
		var data = {
				column : "member_pno",
				sort : "desc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
		}
	}
	searchGuestSort(data);
});



//<!-- CateList search and sort -->

$(document).on("click","#search_cate_nm",function(){
	if($("#search_cate_nm").hasClass("uil-sort-amount-down")){
		var data = {
				column : "cate_nm",
				sort : "asc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
				
		}
	}else{
		var data = {
				column : "cate_nm",
				sort : "desc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
		}
	}
	searchCateSort(data);
});




//<!-- RoomList search and sort -->

$(document).on("click","#search_room_host_nm",function(){
	if($("#search_room_host_nm").hasClass("uil-sort-amount-down")){
		var data = {
				column : "member_nm",
				sort : "asc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
				
		}
	}else{
		var data = {
				column : "member_nm",
				sort : "desc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
		}
	}
	searchRoomListSort(data);
});




$(document).on("click","#search_room_cate_nm",function(){
	if($("#search_room_cate_nm").hasClass("uil-sort-amount-down")){
		var data = {
				column : "cate_nm",
				sort : "asc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
				
		}
	}else{
		var data = {
				column : "cate_nm",
				sort : "desc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
		}
	}
	searchRoomListSort(data);
});




$(document).on("click","#search_room_nm",function(){
	if($("#search_room_nm").hasClass("uil-sort-amount-down")){
		var data = {
				column : "room_nm",
				sort : "asc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
				
		}
	}else{
		var data = {
				column : "room_nm",
				sort : "desc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
		}
	}
	searchRoomListSort(data);
});




$(document).on("click","#search_room_price",function(){
	if($("#search_room_price").hasClass("uil-sort-amount-down")){
		var data = {
				column : "room_price",
				sort : "asc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
				
		}
	}else{
		var data = {
				column : "room_price",
				sort : "desc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
		}
	}
	searchRoomListSort(data);
});




$(document).on("click","#search_room_fit",function(){
	if($("#search_room_fit").hasClass("uil-sort-amount-down")){
		var data = {
				column : "room_fit",
				sort : "asc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
				
		}
	}else{
		var data = {
				column : "room_fit",
				sort : "desc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
		}
	}
	searchRoomListSort(data);
});




$(document).on("click","#search_room_desc",function(){
	if($("#search_room_desc").hasClass("uil-sort-amount-down")){
		var data = {
				column : "room_desc",
				sort : "asc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
				
		}
	}else{
		var data = {
				column : "room_desc",
				sort : "desc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
		}
	}
	searchRoomListSort(data);
});




$(document).on("click","#search_room_img1",function(){
	if($("#searh_room_img1").hasClass("uil-sort-amount-down")){
		var data = {
				column : "room_img1",
				sort : "asc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
				
		}
	}else{
		var data = {
				column : "room_img1",
				sort : "desc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
		}
	}
	searchRoomListSort(data);
});




$(document).on("click","#search_room_time",function(){
	if($("#search_room_time").hasClass("uil-sort-amount-down")){
		var data = {
				column : "room_time_s",
				sort : "asc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
				
		}
	}else{
		var data = {
				column : "room_time_s",
				sort : "desc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
		}
	}
	searchRoomListSort(data);
});




$(document).on("click","#search_room_date",function(){
	if($("#search_room_date").hasClass("uil-sort-amount-down")){
		var data = {
				column : "room_time_e",
				sort : "asc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
				
		}
	}else{
		var data = {
				column : "room_time_e",
				sort : "desc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
		}
	}
	searchRoomListSort(data);
});




$(document).on("click","#search_room_st",function(){
	if($("#search_room_st").hasClass("uil-sort-amount-down")){
		var data = {
				column : "room_st",
				sort : "asc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
				
		}
	}else{
		var data = {
				column : "room_st",
				sort : "desc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
		}
	}
	searchRoomListSort(data);
});


//<!--ReserveList Search and Sort-->

$(document).on("click","#search_res_nm",function(){
	if($("#search_res_nm").hasClass("uil-sort-amount-down")){
		var data = {
				column : "res_nm",
				sort : "asc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
				
		}
	}else{
		var data = {
				column : "res_nm",
				sort : "desc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
		}
	}
	searchReserveListSort(data);
});


$(document).on("click","#search_res_room_nm",function(){
	if($("#search_res_room_nm").hasClass("uil-sort-amount-down")){
		var data = {
				column : "room_nm",
				sort : "asc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
				
		}
	}else{
		var data = {
				column : "room_nm",
				sort : "desc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
		}
	}
	searchReserveListSort(data);
});


$(document).on("click","#search_res_use_dt",function(){
	if($("#search_res_use_dt").hasClass("uil-sort-amount-down")){
		var data = {
				column : "use_dt",
				sort : "asc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
				
		}
	}else{
		var data = {
				column : "use_dt",
				sort : "desc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
		}
	}
	searchReserveListSort(data);
});


$(document).on("click","#search_res_use_time",function(){
	if($("#search_res_use_time").hasClass("uil-sort-amount-down")){
		var data = {
				column : "use_time",
				sort : "asc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
				
		}
	}else{
		var data = {
				column : "use_time",
				sort : "desc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
		}
	}
	searchReserveListSort(data);
});


$(document).on("click","#search_res_space_pno",function(){
	if($("#search_res_space_pno").hasClass("uil-sort-amount-down")){
		var data = {
				column : "space_pno",
				sort : "asc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
				
		}
	}else{
		var data = {
				column : "space_pno",
				sort : "desc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
		}
	}
	searchReserveListSort(data);
});


$(document).on("click","#search_res_pno",function(){
	if($("#search_res_pno").hasClass("uil-sort-amount-down")){
		var data = {
				column : "res_pno",
				sort : "asc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
				
		}
	}else{
		var data = {
				column : "res_pno",
				sort : "desc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
		}
	}
	searchReserveListSort(data);
});


$(document).on("click","#search_res_email",function(){
	if($("#search_res_email").hasClass("uil-sort-amount-down")){
		var data = {
				column : "res_email",
				sort : "asc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
				
		}
	}else{
		var data = {
				column : "res_email",
				sort : "desc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
		}
	}
	searchReserveListSort(data);
});


$(document).on("click","#search_res_personnel",function(){
	if($("#search_res_personnel").hasClass("uil-sort-amount-down")){
		var data = {
				column : "res_personnel",
				sort : "asc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
				
		}
	}else{
		var data = {
				column : "res_personnel",
				sort : "desc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
		}
	}
	searchReserveListSort(data);
});


$(document).on("click","#search_res_st",function(){
	if($("#search_res_st").hasClass("uil-sort-amount-down")){
		var data = {
				column : "res_st",
				sort : "asc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
				
		}
	}else{
		var data = {
				column : "res_st",
				sort : "desc",
				select : $(".form-control").val(),
				search : $(".form-search").val()
		}
	}
	searchReserveListSort(data);
});





//<!-- 위의 sort 함수를 이용해서 코드 정리 토글결과에 따라서 같이 변하게 적용-->

//<!-- admin_listGuest 정렬 -->
$("#member_email").on("click",function(){
	if($("#member_email").hasClass("uil-sort-amount-down")){
		var data = {
				column : "member_email",
				sort : "asc"
		}
	}else{
		var data = {
				column : "member_email",
				sort : "desc"
		}
	}
		sortGuest(data);
});


$("#member_nm").on("click",function(){
	if($("#member_nm").hasClass("uil-sort-amount-down")){
		var data = {
				column : "member_nm",
				sort : "asc"
		}	
	}else{
		var data = {
				column : "member_nm",
				sort : "desc"
		}			
	}
	sortGuest(data);
});


$("#member_pno").on("click",function(){
	if($("#member_pno").hasClass("uil-sort-amount-down")){
		var data = {
				column : "member_pno",
				sort : "asc"
		}	
	}else{
		var data = {
				column : "member_pno",
				sort : "desc"
		}			
	}
	sortGuest(data);
});

$("#member_reg_dt").on("click",function(){
	if($("#member_reg_dt").hasClass("uil-sort-amount-down")){
		var data = {
				column : "member_reg_dt",
				sort : "asc"
		}		
	} else{
		var data = {
				column : "member_reg_dt",
				sort : "desc"
		}				
	}
	sortGuest(data);
});


//<!--Category 정렬-->
$("#cate_nm").on("click",function(){
	if($("#cate_nm").hasClass("uil-sort-amount-down")){
		var data = {
				sort : "asc"
		}		
	} else{
		var data = {
				sort : "desc"
		}				
	}
	sortCate(data);
});

//<!-- ListHost 정렬 -->

$("#host_nm").on("click",function(){
	if($("#host_nm").hasClass("uil-sort-amount-down")){
		var data = {
				column : "member_nm",
				sort : "asc"
		}		
	} else{
		var data = {
				column : "member_nm",
				sort : "desc"
		}				
	}
	sortHost(data);
});

$("#host_email").on("click",function(){
	if($("#host_email").hasClass("uil-sort-amount-down")){
		var data = {
				column : "member_email",
				sort : "asc"
		}		
	} else{
		var data = {
				column : "member_email",
				sort : "desc"
		}				
	}
	sortHost(data);
});

$("#host_reg_dt").on("click",function(){
	if($("#host_reg_dt").hasClass("uil-sort-amount-down")){
		var data = {
				column : "member_reg_dt",
				sort : "asc"
		}		
	} else{
		var data = {
				column : "member_reg_dt",
				sort : "desc"
		}				
	}
	sortHost(data);
});

$("#host_pno").on("click",function(){
	if($("#host_pno").hasClass("uil-sort-amount-down")){
		var data = {
				column : "member_pno",
				sort : "asc"
		}		
	} else{
		var data = {
				column : "member_pno",
				sort : "desc"
		}				
	}
	sortHost(data);
});

$("#space_nm").on("click",function(){
	if($("#space_nm").hasClass("uil-sort-amount-down")){
		var data = {
				column : "space_nm",
				sort : "asc"
		}		
	} else{
		var data = {
				column : "space_nm",
				sort : "desc"
		}				
	}
	sortHost(data);
});

$("#space_comnum").on("click",function(){
	if($("#space_comnum").hasClass("uil-sort-amount-down")){
		var data = {
				column : "space_comnum",
				sort : "asc"
		}		
	} else{
		var data = {
				column : "space_comnum",
				sort : "desc"
		}				
	}
	sortHost(data);
});



//<!-- list Room 정렬 -->

$("#room_host_nm").on("click",function(){
	if($("#room_host_nm").hasClass("uil-sort-amount-down")){
		var data = {
				column : "member_nm",
				sort : "asc"
		}		
	} else{
		var data = {
				column : "member_nm",
				sort : "desc"
		}				
	}
	sortRoomList(data);
});

$("#room_cate_nm").on("click",function(){
	if($("#room_cate_nm").hasClass("uil-sort-amount-down")){
		var data = {
				column : "cate_nm",
				sort : "asc"
		}		
	} else{
		var data = {
				column : "cate_nm",
				sort : "desc"
		}				
	}
	sortRoomList(data);
});

$("#room_nm").on("click",function(){
	if($("#room_nm").hasClass("uil-sort-amount-down")){
		var data = {
				column : "room_nm",
				sort : "asc"
		}		
	} else{
		var data = {
				column : "room_nm",
				sort : "desc"
		}				
	}
	sortRoomList(data);
});

$("#room_price").on("click",function(){
	if($("#room_price").hasClass("uil-sort-amount-down")){
		var data = {
				column : "room_price",
				sort : "asc"
		}		
	} else{
		var data = {
				column : "room_price",
				sort : "desc"
		}				
	}
	sortRoomList(data);
});

$("#room_fit").on("click",function(){
	if($("#room_fit").hasClass("uil-sort-amount-down")){
		var data = {
				column : "room_fit",
				sort : "asc"
		}		
	} else{
		var data = {
				column : "room_fit",
				sort : "desc"
		}				
	}
	sortRoomList(data);
});

$("#room_desc").on("click",function(){
	if($("#room_desc").hasClass("uil-sort-amount-down")){
		var data = {
				column : "room_desc",
				sort : "asc"
		}		
	} else{
		var data = {
				column : "room_desc",
				sort : "desc"
		}				
	}
	sortRoomList(data);
});

$("#room_img1").on("click",function(){
	if($("#room_img1").hasClass("uil-sort-amount-down")){
		var data = {
				column : "room_img1",
				sort : "asc"
		}		
	} else{
		var data = {
				column : "room_img1",
				sort : "desc"
		}				
	}
	sortRoomList(data);
});

$("#room_time").on("click",function(){
	if($("#room_time").hasClass("uil-sort-amount-down")){
		var data = {
				column : "room_time_s",
				sort : "asc"
		}		
	} else{
		var data = {
				column : "room_time_s",
				sort : "desc"
		}				
	}
	sortRoomList(data);
});

$("#room_date").on("click",function(){
	if($("#room_date").hasClass("uil-sort-amount-down")){
		var data = {
				column : "room_time_e",
				sort : "asc"
		}		
	} else{
		var data = {
				column : "room_time_e",
				sort : "desc"
		}				
	}
	sortRoomList(data);	
});


$("#room_st").on("click",function(){
	if($("#room_st").hasClass("uil-sort-amount-down")){
		var data = {
				column : "room_st",
				sort : "asc"
		}		
	} else{
		var data = {
				column : "room_st",
				sort : "desc"
		}				
	}
	sortRoomList(data);	
});





$("#res_nm").on("click",function(){
	if($("#res_nm").hasClass("uil-sort-amount-down")){
		var data = {
				column : "res_nm",
				sort : "asc"
		}		
	} else{
		var data = {
				column : "res_nm",
				sort : "desc"
		}				
	}
	sortListReserve(data);
});

$("#res_room_nm").on("click",function(){
	if($("#res_room_nm").hasClass("uil-sort-amount-down")){
		var data = {
				column : "room_nm",
				sort : "asc"
		}		
	} else{
		var data = {
				column : "room_nm",
				sort : "desc"
		}				
	}
	sortListReserve(data);
});

$("#res_use_dt").on("click",function(){
	if($("#res_use_dt").hasClass("uil-sort-amount-down")){
		var data = {
				column : "use_dt",
				sort : "asc"
		}		
	} else{
		var data = {
				column : "use_dt",
				sort : "desc"
		}				
	}
	sortListReserve(data);
});


$("#res_use_time").on("click",function(){
	if($("#res_use_time").hasClass("uil-sort-amount-down")){
		var data = {
				column : "use_time",
				sort : "asc"
		}		
	} else{
		var data = {
				column : "use_time",
				sort : "desc"
		}				
	}
	sortListReserve(data);
});


$("#res_space_pno").on("click",function(){
	if($("#res_space_pno").hasClass("uil-sort-amount-down")){
		var data = {
				column : "space_pno",
				sort : "asc"
		}		
	} else{
		var data = {
				column : "space_pno",
				sort : "desc"
		}				
	}
	sortListReserve(data);
});


$("#res_pno").on("click",function(){
	if($("#res_pno").hasClass("uil-sort-amount-down")){
		var data = {
				column : "res_pno",
				sort : "asc"
		}		
	} else{
		var data = {
				column : "res_pno",
				sort : "desc"
		}				
	}
	sortListReserve(data);
});


$("#res_email").on("click",function(){
	if($("#res_email").hasClass("uil-sort-amount-down")){
		var data = {
				column : "res_email",
				sort : "asc"
		}		
	} else{
		var data = {
				column : "res_email",
				sort : "desc"
		}				
	}
	sortListReserve(data);
});


$("#res_personnel").on("click",function(){
	if($("#res_personnel").hasClass("uil-sort-amount-down")){
		var data = {
				column : "res_personnel",
				sort : "asc"
		}		
	} else{
		var data = {
				column : "res_personnel",
				sort : "desc"
		}				
	}
	sortListReserve(data);
});


$("#res_st").on("click",function(){
	if($("#res_st").hasClass("uil-sort-amount-down")){
		var data = {
				column : "res_st",
				sort : "asc"
		}		
	} else{
		var data = {
				column : "res_st",
				sort : "desc"
		}				
	}
	sortListReserve(data);
});

				
	
