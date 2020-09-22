package ino.web.freeBoard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ino.web.freeBoard.dto.FreeBoardDto;


@Service
public class FreeBoardService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<FreeBoardDto> freeBoardList(String search_option, String keyword, int start, int end) throws Exception{
		Map<String,Object> map=new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		map.put("start", start);//맵에 자료저장
		map.put("end", end);
		return sqlSessionTemplate.selectList("freeBoardGetList",map);
	}
		
	public int countArticle(String search_option, String keyword) {
		Map<String,String> map=new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		return sqlSessionTemplate.selectOne("countArticle",map);
	}
	
	public void freeBoardInsertPro(FreeBoardDto dto){
		sqlSessionTemplate.insert("freeBoardInsertPro",dto);
	}
	
	public FreeBoardDto getDetailByNum(int num){
		return sqlSessionTemplate.selectOne("freeBoardDetailByNum", num);
	}

	public void freeBoardUpdate(FreeBoardDto dto) {
		sqlSessionTemplate.update("freeBoardUpdate",dto);		
	}

	public void freeBoardDelete(int num) {
		sqlSessionTemplate.delete("freeBoardDelete",num);		
	}


	
}
