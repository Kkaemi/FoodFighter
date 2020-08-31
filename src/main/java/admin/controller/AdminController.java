package admin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import admin.bean.RestaurantDTO;
import admin.bean.ZipcodeDTO;
import admin.service.AdminService;

@Controller
@RequestMapping(value="admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	// 가게정보 입력 페이지
	@RequestMapping(value="resWriteForm", method=RequestMethod.GET)
	public String resWriteForm() {
		return "/jsp/admin/resWriteForm";
	}
	
	// 가게정보 입력
	@ResponseBody
	@RequestMapping(value="resWrite", method=RequestMethod.POST)
	public void resWrite(@ModelAttribute RestaurantDTO restaurantDTO, @RequestParam MultipartFile[] img){
		String filePath = "D:\\spring\\workSTS\\FoodFighter\\src\\main\\webapp\\storage";
		String fileName;
		File file;
		
		
		// 첫번째 이미지 
		if(img[0] != null) {
			fileName = img[0].getOriginalFilename();
			file = new File(filePath, fileName);
			
			try {
				FileCopyUtils.copy(img[0].getInputStream(), new FileOutputStream(file));
			}catch(IOException e) {
				e.printStackTrace();
			}
			
			restaurantDTO.setResImage1(fileName);
		}else {
			restaurantDTO.setResImage1("");
		}
		
		// 두번째 이미지
		if(img[1] != null) {
			fileName = img[1].getOriginalFilename();
			file = new File(filePath, fileName);
			
			try {
				FileCopyUtils.copy(img[1].getInputStream(), new FileOutputStream(file));
			}catch(IOException e) {
				e.printStackTrace();
			}
			
			restaurantDTO.setResImage2(fileName);
		}else {
			restaurantDTO.setResImage2("");
		}
		
		// DB
		adminService.resWrite(restaurantDTO);
		

	}
	
	// 가게 데이터 주소 입력 checkPost
	@RequestMapping(value="checkPost", method = RequestMethod.GET)
	public String checkPost() {
		return "/jsp/admin/checkPost";
	}
	
	@RequestMapping(value = "postSearch", method = RequestMethod.POST)
	public ModelAndView postSearch(@RequestParam Map<String, String> map) {
		System.out.println(map.get("resAddress"));
		List<ZipcodeDTO> list = adminService.postSearch(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
}
