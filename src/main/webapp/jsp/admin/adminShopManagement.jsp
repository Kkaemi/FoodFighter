<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
<div class="container col-12">
    <div class="table-responsive">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-8"><h2>가게 관리</h2></div>
                    	<input type="hidden" id ="pg" value="${pg}">
                    <div class="col-sm-4">
                        <div class="search-box">
                            <i class="material-icons">&#xE8B6;</i>
                            <input type="text" id="shopSearchKeyword" class="form-control" placeholder="검색">
                        </div>
                    </div>
                </div>
            </div>
            <div><button type="button" id="insertShopBtn" >맛집 등록</button></div>
            <table id="shopTable" class="table table-striped table-hover table-bordered tablesorter">
                <thead>
                    <tr>
                        <th>가게 관리 번호<i id="memberNumSort" class="fa fa-sort"></i></th>
                        <th>가게 이름<i id="dateSort" class="fa fa-sort"></i></th>
                        <th>가게 주소<i id="dateSort" class="fa fa-sort"></i></th>
                        <th>가게 전화<i id="dateSort" class="fa fa-sort"></i></th>
                        <th>가게 별점<i id="dateSort" class="fa fa-sort"></i></th>
                        <th>관리</th>
                    </tr>
                </thead>
                <tbody>
                <%-- <c:if test="${list != null}">
  					<c:forEach var="RestaurantDTO" items="${list}">
                    <tr>
                        <td class="resSeq">${RestaurantDTO.seq}</td>
                        <td>${RestaurantDTO.resName}</td>
                        <td>${RestaurantDTO.resAddress}</td>
                        <td>${RestaurantDTO.resTel}</td>
                        <td>${RestaurantDTO.resScore}</td>
                        <td>
                        	<a href="#" class="view" title="View" data-toggle="tooltip"><i class="material-icons">&#xE417;</i></a>
                            <a href="javascript:void(0);" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                        </td>
                    </tr>
                  </c:forEach>
                  </c:if>   --%>
                </tbody>
            </table>
            <div class="clearfix">
              ${adminShopPaging.pagingHTML}
            </div>
        </div>
    </div>  
</div>
</body>

