package qna.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("PopupDao")
public class PopupDao {
	
	String namespace = "qna.model.Popup";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int getTotalCount(Map<String, String> map) {
		int result = sqlSessionTemplate.selectOne(namespace+".GetTotalCount",map);
		
		System.out.println("GetTotalCount"+result);
		return result;
	}

	public List<PopupBean> getProList(Paging pageInfo, Map<String, String> map) {
		List<PopupBean> lists=new ArrayList<PopupBean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		
		lists=sqlSessionTemplate.selectList(namespace+".GetProList",map,rowBounds);
		System.out.println("Dao List:"+lists);
		return lists;
	}
}
