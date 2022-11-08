package product.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import product.model.ProductBean;
import product.model.ProductDao;
import utility.Paging;

@Controller
public class ProductListController {
	
	 private final String command = "/list.pro";
	 private String getPage = "/Prolist";
	 
	@Autowired
	private ProductDao ProDao;
	
	@RequestMapping(command)
	public ModelAndView list(
			@RequestParam(value="whatColumn",required = false) String whatColumn,
			@RequestParam(value="keyword",required = false) String keyword,
			@RequestParam(value="pageNumber",required = false) String pageNumber,
			HttpServletRequest request) {
		
			ModelAndView mav = new ModelAndView();
			System.out.println("Controller mav:"+mav); // model 에서 null?
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("whatColumn", whatColumn);
			map.put("keyword", "%"+keyword+"%");
			
			int totalCount = ProDao.getTotalCount(map);
			String url = request.getContextPath()+"/"+command;
			
			Paging pageInfo = new Paging(pageNumber,null, totalCount, url, whatColumn, keyword, null);
	
			List<ProductBean> lists = new ArrayList<ProductBean>();
			lists = ProDao.getProList(pageInfo,map);
			
			mav.addObject("lists",lists);
			mav.addObject("pageInfo",pageInfo);
			//mav.addObject(getPage);
			mav.setViewName(getPage);
			System.out.println("mav:"+mav);

			return mav;
	}
}
