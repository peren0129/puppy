package notice.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component
public class NoticeDao {
	
	private String namespace = "notice.model.Notice";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<NoticeBean> getAllData(Paging pageInfo, Map<String,String> map){
		List<NoticeBean> lists = new ArrayList<NoticeBean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		lists = sqlSessionTemplate.selectList(namespace+".getAllData",map,rowBounds);
		return lists;
	}
	
	public int getTotalCount(Map<String,String> map) {
		int totalCount = sqlSessionTemplate.selectOne(namespace+".getTotalCount",map);
		System.out.println("Dao 갯수:"+totalCount);
		return totalCount;
	}

	public void insertData(NoticeBean no) {
		System.out.println("insertData 2");
		sqlSessionTemplate.insert(namespace+".insertData", no);
		System.out.println("insertData 3");
	}
	
	public NoticeBean getData(String num) {
		NoticeBean no = sqlSessionTemplate.selectOne(namespace+".getData", num);
		return no;	
	}

	public void updateReadcount(String num) {
		sqlSessionTemplate.update(namespace+".addReadcount",num);
	}


}
