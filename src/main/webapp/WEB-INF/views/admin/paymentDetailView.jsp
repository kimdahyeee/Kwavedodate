   <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
                           <td><a href="#"><strong>imp_uid</strong></a></td>
                           <td>$25<br>($5)</td>
                           <td>이니시스(웹표준)</td>
                           <td>StdpayCARDINIpayTest20170215213736802804<br>(30002091)</td>
                           <td>NH카드<br>(일시불)</td>
                           <td>2017.02.15 21:05:55</td>
                           <td>결제완료<br><a href="" class="btn square btn-danger">취소하기</a></td>
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
                        <td colspan="3">IU PLAY WITH YOU TEST....</td>
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