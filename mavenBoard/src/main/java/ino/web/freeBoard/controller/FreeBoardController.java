package ino.web.freeBoard.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ino.web.freeBoard.dto.FreeBoardDto;
import ino.web.freeBoard.service.FreeBoardService;
import ino.web.freeBoard.util.Pager;

@Controller
public class FreeBoardController {
	
	@Autowired
	private FreeBoardService freeBoardService;
	
	//메인 페이지,게시물 리스트
	@RequestMapping("/main.ino")
	public ModelAndView main(
		@RequestParam(defaultValue = "name") String search_option,
		@RequestParam(defaultValue = "") String keyword,
		@RequestParam(defaultValue="1") int curPage) 
				throws Exception {
	
    //레코드 갯수 계산
	int count=freeBoardService.countArticle(search_option,keyword);
	
	//페이지 관련 설정
	Pager pager=new Pager(count, curPage);
	int start=pager.getPageBegin();
	int end=pager.getPageEnd();
				
		ModelAndView mav = new ModelAndView();		
		List<FreeBoardDto> list = freeBoardService.freeBoardList(search_option,keyword,start,end);
		HashMap<String, Object> map=new HashMap<>();
		map.put("freeBoardList", list); //map에 자료 저장
		map.put("count", count);
		map.put("pager", pager); //페이지 네비게이션을 위한 변수
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		mav.setViewName("boardMain");
		mav.addObject("map",map);
	   return mav;
	 }
	
	//글쓰기 페이지 이동
	@RequestMapping("/freeBoardInsert.ino")
	public String freeBoardInsert(){
		return "freeBoardInsert";
	}
	
	//글쓰기(추가)
	@RequestMapping("/freeBoardInsertPro.ino")
	public String freeBoardInsertPro(HttpServletRequest request,@ModelAttribute FreeBoardDto dto){
		freeBoardService.freeBoardInsertPro(dto);
		System.out.println("글쓰기 완료");
		return "redirect:/freeBoardDetail.ino?num="+dto.getNum();
	}
	
	//글 세부정보
	@RequestMapping("/freeBoardDetail.ino")
	public ModelAndView freeBoardDetail(int num){
		FreeBoardDto dto = freeBoardService.getDetailByNum(num);
		System.out.println("--freeBoardDetail.ino--");
		System.out.println(dto);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("freeBoardDetail");
		mav.addObject("freeBoardDto", dto);
		return mav;
	}
	
	//글 수정페이지 이동
	@RequestMapping("/freeBoardDetailUD.ino")
	public ModelAndView freeBoardDetailUD(HttpServletRequest request){
		int num=Integer.parseInt(request.getParameter("num"));
		FreeBoardDto dto = freeBoardService.getDetailByNum(num);
		System.out.println("--freeBoardDetailUD.ino--");
		System.out.println(dto);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("freeBoardDetailUD");
		mav.addObject("freeBoardDto", dto);	
		return mav;
	}
	
	//글 수정 기능
	@RequestMapping("/freeBoardUpdate.ino")
	public String freeBoardUpdate(FreeBoardDto dto) {
        freeBoardService.freeBoardUpdate(dto);
		return "redirect:/main.ino";
	}
	
	//글 삭제 기능
	@RequestMapping("/freeBoardDelete.ino")
	public String freeBoardDelete(int num) {
		freeBoardService.freeBoardDelete(num);
		return "redirect:/main.ino";
	}
	
	
	
	
	
	
}
