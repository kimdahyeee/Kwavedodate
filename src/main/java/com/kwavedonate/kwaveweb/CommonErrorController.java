package com.kwavedonate.kwaveweb;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/common/error")
public class CommonErrorController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommonErrorController.class);

	@RequestMapping(value="/throwble")
	public String throwble(HttpServletRequest request, Model model) {
		logger.info("throwable");
		pageErrorLog(request);
		model.addAttribute("errCode", "500");
		model.addAttribute("errSubejct", "Internal Server Error");
		model.addAttribute("msg", "A generic error message, given when an unexpected condition was encountered and no more specific message is suitable.");
		return "error";
	}
	
	@RequestMapping(value="/exception")
	public String exception(HttpServletRequest request, Model model) {
		logger.info("exception");
		pageErrorLog(request);
		model.addAttribute("errCode", "500");
		model.addAttribute("errSubejct", "Internal Server Error");
		model.addAttribute("msg", "A generic error message, given when an unexpected condition was encountered and no more specific message is suitable.");
		return "error";
	}
	
	@RequestMapping(value="/400")
	public String pageError400(HttpServletRequest request, Model model) {
		logger.info("page error code 400");
		pageErrorLog(request);
		model.addAttribute("errCode", "400");
		model.addAttribute("errSubejct", "Bad Request");
		model.addAttribute("msg", "The server cannot or will not process the request due to an apparent client error.");
		return "error";
	}
	
	@RequestMapping(value="/403")
	public String pageError403(HttpServletRequest request, Model model) {
		logger.info("page error code 403");
		pageErrorLog(request);
		model.addAttribute("errCode", "403");
		model.addAttribute("errSubejct", "Forbidden");
		model.addAttribute("msg", "The request was valid, but the server is refusing action. The user might not have the necessary permissions for a resource.");
		return "error";
	}
	
	@RequestMapping(value="/404")
	public String pageError404(HttpServletRequest request, Model model) {
		logger.info("page error code 404");
		pageErrorLog(request);
		model.addAttribute("errCode", "404");
		model.addAttribute("errSubejct", "Page Not Found");
		model.addAttribute("msg", "The requested URL was not found on this server. Make sure that the Web site address displayed in the address bar of your browser is spelled and formatted correctly.");
		return "error";
	}
	
	@RequestMapping(value="/405")
	public String pageError405(HttpServletRequest request, Model model) {
		logger.info("page error code 405");
		pageErrorLog(request);
		model.addAttribute("errCode", "405");
		model.addAttribute("errSubejct", "Method Not Allowed");
		model.addAttribute("msg", "A request method is not supported for the requested resource; for example, a GET request on a form that requires data to be presented via POST, or a PUT request on a read-only resource.");
		return "error";
	}
	
	@RequestMapping(value="/500")
	public String pageError500(HttpServletRequest request, Model model) {
		logger.info("page error code 500");
		pageErrorLog(request);
		model.addAttribute("errCode", "500");
		model.addAttribute("errSubejct", "Internal Server Error");
		model.addAttribute("msg", "A generic error message, given when an unexpected condition was encountered and no more specific message is suitable.");
		return "error";
	}
	
	@RequestMapping(value="/503")
	public String pageError503(HttpServletRequest request, Model model) {
		logger.info("page error code 503");
		pageErrorLog(request);
		model.addAttribute("errCode", "503");
		model.addAttribute("errSubejct", "Service Unavailable");
		model.addAttribute("msg", "The server is currently unavailable (because it is overloaded or down for maintenance). Generally, this is a temporary state.");
		return "error";
	}

	private void pageErrorLog(HttpServletRequest request) {
		logger.info("status_code : " + request.getAttribute("javax.servlet.error.status_code"));
		logger.info("exception_type : " + request.getAttribute("javax.servlet.error.exception_type"));
		logger.info("message : " + request.getAttribute("javax.servlet.error.message"));
		logger.info("request_uri : " + request.getAttribute("javax.servlet.error.request_uri"));
		logger.info("exception : " + request.getAttribute("javax.servlet.error.exception"));
		logger.info("servlet_name : " + request.getAttribute("javax.servlet.error.servlet_name"));
		
	}
}
