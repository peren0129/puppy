package member.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("MemberDao")
public class MemberDao {
	String namespace="member.model.Member";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public void joinMember(MemberBean member) {
		sqlSessionTemplate.insert(namespace+".joinMember",member);
		//System.out.println("check/MemberDao : "+member.getNum()+", "+member.getNameTitle());
	}

	public MemberBean getMember(String member_id) {
		MemberBean mbean = null;
		mbean = sqlSessionTemplate.selectOne(namespace+".GetMember", member_id);
		return mbean;
	}
} 