package member.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("MemberDao")
public class MemberDao {
	String namespace="member.model.Member";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int joinMember(MemberBean member) {
		int cnt = sqlSessionTemplate.insert(namespace+".joinMember",member);
	
		System.out.println("Dao cnt:"+cnt);
		return cnt;
	}
}