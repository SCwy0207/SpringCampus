package com.controller;
import java.io.File;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import com.domain.Card;
import com.domain.User;
import com.service.CardsService;
import com.util.MyUtil;
@Controller
@RequestMapping("/card")
public class CardController extends BaseController{
	//依赖注入Service进行后台处理
	@Autowired
	private CardsService cardsService;
	/**
	 * add页面初始化
	 */
	@RequestMapping("/input")
	public String addInput(Model model){
		model.addAttribute("card", new Card());
		return "/card/addCard";
	}
	/**
	 * 查询名片，包括修改、删除的查询
	 */
	@RequestMapping("/query")
	public String query(HttpSession session, Model model, Integer pageCur, String act){
		List<Map<String, Object>> allCards = cardsService.query(getUserName(session));
		int temp = allCards.size();
		model.addAttribute("totalCount", temp);
		int totalPage = 0;
		if (temp == 0) {
			totalPage = 0;//总页数
		} else {
			//返回大于或者等于指定表达式的最小整数
			totalPage = (int) Math.ceil((double) temp / 10);
		}
		if (pageCur == null) {
			pageCur = 1;
		}
		if ((pageCur - 1) * 10 > temp) {
			pageCur = pageCur - 1;
		}
		
		//分页查询
		allCards = cardsService.queryByPage(pageCur, getUserName(session));
		
		model.addAttribute("allCards", allCards);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageCur", pageCur);
		//删除查询
		if("deleteSelect".equals(act)){
			return "/card/deleteSelect";
		}
		//修改查询
		else if("updateSelect".equals(act)){
			return "/card/updateSelect";
		}else{
			return "/card/queryCards";
		}
	}
	/**
	 * 添加与修改页面
	 */
	@RequestMapping("/add")
	public String add(@ModelAttribute Card card, HttpServletRequest request, HttpSession session, String updateAct){
		/*上传文件的保存位置"/logos"，该位置是指
		workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps，
		发布后使用*/
		//防止文件名重名
		String newFileName = "";
		String fileName = card.getLogo().getOriginalFilename(); 
		//选择了文件
		if(fileName.length() > 0){
			String realpath = request.getServletContext().getRealPath("logos");
			//实现文件上传
			String fileType = fileName.substring(fileName.lastIndexOf('.'));
			//防止文件名重名
			newFileName = MyUtil.getStringID() + fileType;
			File targetFile = new File(realpath, newFileName); 
			if(!targetFile.exists()){  
	            targetFile.mkdirs();  
	        } 
			//上传 
	        try {   
	        	card.getLogo().transferTo(targetFile);
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
		}
		//修改
		if("update".equals(updateAct)){//updateAct不能与act重名，因为使用了转发
			//修改到数据库
	        if(cardsService.update(card, newFileName)){
	        	return "forward:/card/query?act=updateSelect";
	        }else{
	        	return "rpassword";
	        }
			
		}else{//添加
			//保存到数据库
			if(cardsService.add(card, newFileName, getUserName(session))){
				//转发到查询的controller
				return "forward:/card/query";
			}else{
				return "/card/addCard";
			}
		}
	}
	/**
	 * 查询一个名片
	 */
	@RequestMapping("selectACard")
	public String selectACard(Model model, String id, String act){
		Map<String, Object> mp = cardsService.selectACard(id);
		model.addAttribute("acard", mp);
		//修改页面
		if("updateAcard".equals(act)){
			Card card = new Card();
			card.setId((Integer)mp.get("id"));
			card.setName((String)mp.get("name"));
			card.setAddress((String)mp.get("address"));
			card.setCompany((String)mp.get("company"));
			card.setEmail((String)mp.get("email"));
			//从数据库取出的文件名
			card.setFileName((String)mp.get("logo"));
			card.setPost((String)mp.get("post"));
			card.setTelephone((String)mp.get("telephone"));
			model.addAttribute("card", card);
			return "rpassword";
		}
		//详情页面
		return "/card/detail";
	}
	/**
	 * 删除一个名片
	 */
	@RequestMapping("deleteACard")
	public String deleteACard(String id){
		cardsService.deleteAcard(id);
		return "forward:/card/query?act=deleteSelect";
	}
	/**
	 * 删除多个名片
	 */
	@RequestMapping("deleteCards")
	public String deleteCards(String[] ids){
		cardsService.deleteCards(ids);
		return "forward:/card/query?act=deleteSelect";
	}
	/**
	 * 获得登录用户的用户名(非处理请求方法)
	 */
	public String getUserName(HttpSession session){
		 User user = (User)session.getAttribute("user");
		 return user.getUsername();
	}
}
