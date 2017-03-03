package com.kwavedonate.kwaveweb;


import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kwavedonate.kwaveweb.core.util.Sstring;
import com.kwavedonate.kwaveweb.user.dao.UserDaoService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class PaymentServiceController {
	
	private static final Logger logger = LoggerFactory.getLogger(PaymentServiceController.class);
	
	@Autowired
	private PlatformTransactionManager transactionManager;
	
	@Resource(name = "userDaoService")
	private UserDaoService dao;

	private IamportClient client;
	
	private String _totalAmount = "";
	
	@ResponseBody
	@RequestMapping(value="insertDelivery", method=RequestMethod.POST)
	public HashMap<String, Object> insertDeliveryENG(
			@RequestParam("imp_uid")String imp_uid,   @RequestParam("rewardNum")String rewardNum,
			@RequestParam("note")String note,		  @RequestParam("shippingMethod")String shippingMethod,
			@RequestParam("address2")String address2, @RequestParam("shippingAmount")String shippingAmount,
			@RequestParam("country")String country,	  @RequestParam("city")String city,
			@RequestParam("region")String region, @RequestParam("rewardAmount")String rewardAmount) {
		
		logger.info("PC : insertDelivery");
		if(city.equals("kwavedonate_not_define")) {	city = "";	region = "";	}
		Map<String, Object> payment_result = new HashMap<String, Object>();
		payment_result.putAll(getPaymentInfo(imp_uid));
		int IntegerTotalAmount = Integer.parseInt(_totalAmount);
		int IntegerShippingAmount = Integer.parseInt(shippingAmount);
		int DollarAmount = (IntegerTotalAmount-IntegerShippingAmount) / 1100;
		
		payment_result.put("totalAmount", DollarAmount);
		payment_result.put("rewardNum", Integer.parseInt(rewardNum));
		payment_result.put("rewardAmount", Integer.parseInt(rewardAmount));
		payment_result.put("shippingAmount", Integer.parseInt(shippingAmount));
		payment_result.put("shippingMethod", shippingMethod);
		payment_result.put("note", note);
		payment_result.put("address2", address2);
		payment_result.put("city", city);
		payment_result.put("country", country);
		payment_result.put("region", region);
		
		HashMap<String, Object> returnData = new HashMap<String, Object>();
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		
		TransactionStatus status = transactionManager.getTransaction(def);
		try {
			
			if(IntegerTotalAmount == 10) {
				dao.insertPayments(payment_result); logger.info("insertPayments 완료");
				dao.updateCampaignsByPayment(payment_result);	logger.info("updateCampaignsByPayment 완료");
			} else {
				dao.insertPayments(payment_result); logger.info("insertPayments 완료");
				dao.insertDelivery(payment_result); logger.info("insertDelivery 완료");
				dao.updateRewardsByPayment(payment_result);	logger.info("updateRewardsByPayment 완료");
				dao.updateCampaignsByPayment(payment_result);	logger.info("updateCampaignsByPayment 완료");
			}
			transactionManager.commit(status); logger.info("COMMIT COMPLETE !!");
			returnData.put("KEY", "SUCCESS");
			
		} catch (Exception e) {
			try {
				transactionManager.rollback(status);	logger.info("ROLLBACK COMPLETE !!");
				cancelPayment(imp_uid);	logger.info("결제 취소 완료 !!");
			} catch(Exception ee) {
				 System.out.println("Exception in commit or rollback : "+ee);
			}
			
			System.out.println("Exception in saveTemplatesToPCA() : "+e);
			returnData.put("KEY", "FAIL");
		}
		
		
		return returnData;
	}
	
	@ResponseBody
	@RequestMapping(value="/m_redirect", method=RequestMethod.GET)
	public String m_redirect(HttpServletRequest request) {

		String payment_uid = request.getParameter("imp_uid");

		Map<String, Object> payment_result = new HashMap<String, Object>();
		
		
		
		payment_result.putAll(getPaymentInfo(payment_uid));
		
		payment_result.put("rewardNum", Integer.parseInt(request.getParameter("rewardNum")));
		payment_result.put("rewardAmount", Integer.parseInt(request.getParameter("rewardAmount")));
		payment_result.put("shippingAmount", Integer.parseInt(request.getParameter("shippingAmount")));
		payment_result.put("shippingMethod", request.getParameter("shippingMethod"));
		payment_result.put("note", request.getParameter("note"));
		payment_result.put("city", "city");
		payment_result.put("region", "region");
		payment_result.put("country", request.getParameter("country"));
		payment_result.put("address2", request.getParameter("address2"));
		
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		
		TransactionStatus status = transactionManager.getTransaction(def);
		try {
			dao.insertPayments(payment_result); logger.info("insertPayments 완료");
			dao.insertDelivery(payment_result); logger.info("insertDelivery 완료");
			dao.updateRewardsByPayment(payment_result);	logger.info("updateRewardsByPayment 완료");
			dao.updateCampaignsByPayment(payment_result);	logger.info("updateCampaignsByPayment 완료");
			transactionManager.commit(status); logger.info("COMMIT COMPLETE !!");
		} catch (Exception e) {
			System.out.println("catch문 들어옴");
			try {
				transactionManager.rollback(status);	logger.info("ROLLBACK COMPLETE !!");
				cancelPayment(payment_uid);	logger.info("결제 취소 완료 !!");
			} catch(Exception ee) {
				 System.out.println("Exception in commit or rollback : "+ee);
			}
			
			System.out.println("Exception in saveTemplatesToPCA() : "+e);
		}
		
	
		return "/kwaveweb/";
	}
	
	
	
	public Map<String, Object> getPaymentInfo(String payment_imp_uid) {
		
		client = new IamportClient(Sstring.REST_API_KEY, Sstring.REST_API_SECRET_KEY);
		IamportResponse<Payment> payment_response = client.paymentByImpUid(payment_imp_uid);
		
		Map<String, Object> paymentInfo = new HashMap<String,Object>();
		
		
		
		paymentInfo.put("imp_uid", payment_response.getResponse().getImpUid());
		paymentInfo.put("merchant_uid", payment_response.getResponse().getMerchantUid());
		paymentInfo.put("userEmail", payment_response.getResponse().getBuyerEmail());
		paymentInfo.put("campaignName", payment_response.getResponse().getName());
		paymentInfo.put("phone", payment_response.getResponse().getBuyerTel());
		paymentInfo.put("zipCode", payment_response.getResponse().getBuyerPostcode());
		paymentInfo.put("receipt_url", payment_response.getResponse().getReceiptUrl());
		paymentInfo.put("totalAmount", payment_response.getResponse().getAmount().toString());
		paymentInfo.put("address1", payment_response.getResponse().getBuyerAddr());
		
		_totalAmount = payment_response.getResponse().getAmount().toString();
		
		return paymentInfo;
	}
	
	public void cancelPayment(String payment_imp_uid) {
		CancelData cancel_data = new CancelData(payment_imp_uid, true); //imp_uid를 통한 전액취소
		client.cancelPaymentByImpUid(cancel_data);
	}
	
}
