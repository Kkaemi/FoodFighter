package admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import admin.bean.AdminMemberPaging;
import admin.bean.AdminShopPaging;
import admin.service.AdminService;
import member.bean.MemberDTO;

@Controller
@RequestMapping(value = "admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value = "adminMain")
	public String adminMain(Model model) {
	
		model.addAttribute("display","/jsp/admin/adminDashboard.jsp");
		return "/jsp/admin/adminMain";
	}
	//대시보드
	@RequestMapping(value = "adminDashboard")
	public String adminDashboard(Model model) {
	
		model.addAttribute("display","/jsp/admin/adminDashboard.jsp");
		return "/jsp/admin/adminMain";
	}
	
	//멤버관리
		@RequestMapping(value = "adminMemberManagement", method = RequestMethod.GET)
		public String adminMemberManagement(Model model,@RequestParam(defaultValue = "1") String pg) {
			
			AdminMemberPaging adminMemberPaging = adminService.getAdminPaging(pg);
			
			int endNum = Integer.parseInt(pg)*10;
			int startNum = endNum-9;
			
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("startNum",startNum);
			map.put("endNum",endNum);
			
			
			List<MemberDTO> list = adminService.getMemberList(map);
			
			model.addAttribute("pg", pg);
			model.addAttribute("adminMemberPaging", adminMemberPaging);
			model.addAttribute("list", list);
			model.addAttribute("display","/jsp/admin/adminMemberManagement.jsp");
			return "/jsp/admin/adminMain";

		}
	//가게 관리
		@RequestMapping(value = "adminShopManagement", method = RequestMethod.GET)
		public String adminShopManagement(Model model,@RequestParam(defaultValue = "1") String pg) {
			
			AdminShopPaging adminShopPaging = adminService.getAdminShopPaging(pg);
			
			int endNum = Integer.parseInt(pg)*10;
			int startNum = endNum-9;
			
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("startNum",startNum);
			map.put("endNum",endNum);
			
			
			//List<MemberDTO> list = adminService.getResList(map); 
			
			model.addAttribute("pg", pg);
			model.addAttribute("adminShopPaging", adminShopPaging);
			//model.addAttribute("list", list); 
			model.addAttribute("display","/jsp/admin/adminShopManagement.jsp");
			return "/jsp/admin/adminMain";

		}
		
	//회원 탈퇴	
		@RequestMapping(value="AdminWithdraw",method=RequestMethod.POST)
		@ResponseBody
		public void AdminWithdraw(@RequestParam String member_seq) {
			adminService.AdminWithdraw(member_seq);
		}
	//회원검색	
		@RequestMapping(value = "getMemberSearch", method = RequestMethod.POST)
		public String getMemberSearch(Model model,@RequestParam Map<String, Object> map) {
			System.out.println("키워드= "+map.get("memSearchKeyword"));
			
			AdminMemberPaging adminMemberPaging = adminService.getSearchPaging(map);
			
			
			List<MemberDTO> list = adminService.getMemberSearch(map);
			System.out.println(list.size());
			model.addAttribute("pg", map.get("pg"));
			model.addAttribute("adminMemberPaging", adminMemberPaging);
			model.addAttribute("list", list);
			
			return "/jsp/admin/adminMemberManagement";

		}
		//가게 삭제
		/*
		 * @RequestMapping(value="adminShopDelete",method=RequestMethod.POST)
		 * 
		 * @ResponseBody public void adminShopDelete(@RequestParam String resSeq) {
		 * adminService.adminShopDelete(resSeq); }
		 */
}
