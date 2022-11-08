package product.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("ProductDao")
public class ProductDao {
	
	String namespace = "product.model.Product";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int getTotalCount(Map<String, String> map) {
		int result = sqlSessionTemplate.selectOne(namespace+".GetTotalCount",map);
		
		System.out.println("GetTotalCount"+result);
		return result;
	}

	public List<ProductBean> getProList(Paging pageInfo, Map<String, String> map) {
		List<ProductBean> lists=new ArrayList<ProductBean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		
		lists=sqlSessionTemplate.selectList(namespace+".GetProList",map,rowBounds);
		System.out.println("Dao List:"+lists);
		return lists;
	}
}
