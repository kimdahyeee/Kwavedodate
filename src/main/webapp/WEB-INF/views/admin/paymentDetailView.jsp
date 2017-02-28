
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <section class="main-container">
      <div class="container">
         <div class="row">   
            <div class="table-responsive" data-animation-effect="fadeInUpSmall" data-effect-delay="100">
               <h1>결제 정보</h1>
               <table class="table table-colored text-center">
                  <thead>
                     <tr>
                        <th>Pledge number<br><small>(클릭시 영수증)</small></th>
                        <th>결제금액<br><small>(배송금액 포함)</small></th>
                        <th>PG사</th>
                        <th>PG승인번호<br><small>(카드사 승인번호)</small></th>
                        <th>결제 상세</th>
                        <th>결제 시각</th>
                        <th>상태</th>
                     </tr>
                  </thead>
                  <tbody>
                        <tr>
                           <td><a href="${paymentDetail.receipt_url}"><strong>${paymentDetail.imp_uid}</strong></a></td>
                           <td>$${paymentDetail.totalAmount}<br>($${paymentDetail.shippingAmount})</td>
                           <td>
                           		<c:choose>
	                           		<c:when test="${paymentDetail.imp_pgProvider == 'paypal'}">
	                           			페이팔
	                           		</c:when>
	                           		<c:otherwise>
	                           			이니시스(웹표준)
	                           		</c:otherwise>
                           		</c:choose>
                           </td>
                           <td>${paymentDetail.imp_pgTid }<br>(${paymentDetail.imp_applyNum})</td>
                           <td>${paymentDetail.imp_cardName}<br>
                           		<c:choose>
	                           		<c:when test="${paymentDetail.imp_cardQuota == '0'}">
	                           			(일시불)
	                           		</c:when>
	                           		<c:otherwise>
	                           			(${paymentDetail.imp_cardQuota}개월)
	                           		</c:otherwise>
                           		</c:choose>
                           </td>
                           <td>${paymentDetail.imp_paidAt}</td>
                           <td>
                           		<c:choose>
                           			<c:when test="${paymentDetail.imp_status == 'paid'}">결제완료</c:when>
                           			<c:when test="${paymentDetail.imp_status == 'ready'}">미결제</c:when>
                           			<c:when test="${paymentDetail.imp_status == 'cancelled'}">결제취소</c:when>
                           			<c:when test="${paymentDetail.imp_status == 'faild'}">결제실패</c:when>
                           		</c:choose>
                           		<br><a href="" class="btn square btn-danger">취소하기</a>
                      		</td>
                        </tr>
                  </tbody>
               </table>
            </div>
         </div>
      </div>
      <div class="container">
         <div class="row">
            <div class="table-responsive" data-animation-effect="fadeInUpSmall" data-effect-delay="100">
               <h1>배송 정보</h1>
               <table class="table table-colored">
                  <tbody>
                     <tr>
                        <th>주문명</th>
                        <td colspan="3">${paymentDetail.imp_name}</td>
                     </tr>
                     <tr>
                        <th>User Name</th>
                        <td>${deliveryDetail.userName}</td>
                        <th>Zip Code</th>
                        <td>${deliveryDetail.zipcode}</td>
                        
                     </tr>
                     <tr>
                        <th>User Email</th>
                        <td>${deliveryDetail.userEmail}</td>
                        <th>Address</th>
                        <td>${deliveryDetail.address1}</td>
                     </tr>
                     <tr>
                        <th>Phone Number</th>
                        <td>${deliveryDetail.phone}</td>
                        <th>Address Detail</th>
                        <td>${deliveryDetail.address2}</td>
                     </tr>
                     <tr>
                        <th>Nation(Lang)</th>
                        <td>${deliveryDetail.userNation}</td>
                        <th>City</th>
                        <td>${deliveryDetail.city}</td>
                     </tr>
                     <tr>
                        <th>Region</th>
                        <td>${deliveryDetail.region}</td>
                        <th>Country</th>
                        <td>${deliveryDetail.country}</td>
                     </tr>
                     <tr>
                        <th>Note</th>
                        <td colspan="3">${deliveryDetail.note}</td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </div>
      </div>
   </section>
