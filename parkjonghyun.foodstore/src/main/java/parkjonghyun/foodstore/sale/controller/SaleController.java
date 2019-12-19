package parkjonghyun.foodstore.sale.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import parkjonghyun.foodstore.guest.service.GuestService;
import parkjonghyun.foodstore.product.domain.Product;
import parkjonghyun.foodstore.product.service.ProdService;
import parkjonghyun.foodstore.sale.domain.Receipt;
import parkjonghyun.foodstore.sale.service.ExcelService;
import parkjonghyun.foodstore.sale.service.SaleService;
import parkjonghyun.foodstore.stock.service.StockService;
import parkjonghyun.foodstore.user.domain.User;
import parkjonghyun.foodstore.user.service.UserService;

@Controller
@RequestMapping("/sale")
public class SaleController {
	@Autowired private StockService stockService;
	@Autowired private ProdService prodService;
	@Autowired private SaleService saleService;
	@Autowired private GuestService guestService;
	@Autowired private UserService userService;
	@Autowired private ExcelService excelService;
	
	@RequestMapping(value="/order", method=RequestMethod.GET)
	public String order(Model model, HttpSession session) {
		User user = (User)session.getAttribute("user");
		model.addAttribute("stocks", stockService.getStocks(user.getUserId()));
		model.addAttribute("products", prodService.getProds());
		return "/sale/order";
	}
	
	@RequestMapping(value="/orderdetail")
	@ResponseBody
	public List<Product> orderdetail(String str){
		return prodService.getProdstr(str);
	}
	
	@Transactional
	@RequestMapping("/addSale")
	public String addSale(HttpServletRequest request, HttpSession session){
		String prodNo[] = request.getParameterValues("prodNo");
		String prodCnt[] = request.getParameterValues("prodCnt");
		String userid = ((User)session.getAttribute("user")).getUserId();
		guestService.addGuest();
		String guestNo = guestService.findGuest();
		for(int i=0; i<prodCnt.length; i++){
			stockService.saleStocks(userid, prodNo[i], prodCnt[i]);
			saleService.addSale(userid, prodNo[i], prodCnt[i], guestNo);		
		}
		return "redirect:../sale/order";
	}
	
	// 매출조회 초기화면
		@RequestMapping("/saleList")
		public String saleList(Model model, HttpSession session){
			// 유저 가져오기
			User user = (User)session.getAttribute("user");
			String userId = user.getUserId();
			List<User> users = userService.getUsers();
			model.addAttribute("userList", users);
			
			
			// 오늘 날짜 입력
			SimpleDateFormat formatter = new SimpleDateFormat ("yy/MM/dd", Locale.KOREA );
			Date currentTime = new Date();
			String year = formatter.format(currentTime).substring(0, 2);
			String month = formatter.format(currentTime).substring(3, 5);
			String day = formatter.format(currentTime).substring(6, 8);
			Map<String, String> setDate = new HashMap<String, String>();
			setDate.put("year", year);
			setDate.put("month", month);
			setDate.put("day", day);
			model.addAllAttributes(setDate);
			String YYMM = year + "/" + month;
			String YYMMDD = year + "/" + month + "/" + day;
			
			
			// 차트 데이터 가져오기
			model.addAllAttributes(saleService.getDateTotal(userId, YYMM, YYMMDD));
			
			
			// 뷰 제어
			String view = "";
			if("admin".equals(userId)){
				view = "sale/saleList_head";
			}else{
				view = "sale/saleList_fran";
			}
			
			System.out.println("saleList()=> userId: " + userId + ", YYMM: " + YYMM + ", YYMMDD: " + YYMMDD);
			return view;
		}
		
		
		// 모든 차트 내용 조회
		@RequestMapping("/search1")
		@ResponseBody
		public Map<String, List<Receipt>> saleList_ajax_01(Model model, String userId, String YYMM, String YYMMDD){
			System.out.println("saleList_ajax_01() => userId: " + userId + ", YYMM: " + YYMM + ", YYMMDD: " + YYMMDD );
			
			Map<String, List<Product>> prodNameList = prodService.getProdName();
			
			return saleService.getDateTotal_ajax_search1(userId, YYMM, YYMMDD, prodNameList);
		}
		
		
		// 내부 리스트 조회
		@RequestMapping("/search2")
		@ResponseBody
		public List<Receipt> saleList_ajax_02(String userId, String searchDate){
			System.out.println("saleList_ajax_02() => userId: " + userId + ", searchDate: " + searchDate );
			return saleService.getDateList_ajax_search2(userId, searchDate);
		}	
		
		
		// Excel 파일 다운로드
		@RequestMapping(value = "/downloadExcelFile", method = RequestMethod.POST)
	    public String downloadExcelFile(Model model, String userId, String year2, String month2) {
	        String YY = "";
	        String MM = "";
	        if(year2.length() <2){
	        	YY = '0' + year2;
	    	}
	    	else {
	    		YY = year2;
	    	}
	        if(month2.length() <2){
	        	MM = '0' + month2;
	    	}
	    	else {
	    		MM = month2;
	    	}
	        String YYMM = YY + "/" + MM;
	        List<Receipt> saleListDay = saleService.getDateList(userId, YYMM);
	        SXSSFWorkbook workbook = excelService.excelFileDownloadProcess(saleListDay);
	        
	        model.addAttribute("locale", Locale.KOREA);
	        model.addAttribute("workbook", workbook);
	        model.addAttribute("workbookName", "매출표리스트");
	        
	        return "excelDownloadView";
		}
}