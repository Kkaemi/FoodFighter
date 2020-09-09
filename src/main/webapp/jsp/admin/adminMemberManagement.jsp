<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">

<body>
<div class="container col-12">
    <div class="table-responsive">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-8"><h2>회원 관리</h2></div>
                    <div class="col-sm-4">
                        <div class="search-box">
                            <i class="material-icons">&#xE8B6;</i>
                            <input type="text" id="memSearchKeyword" class="form-control" placeholder="검색">
                        </div>
                    </div>
                </div>
            </div>
            <table id="memberTable" class="table table-striped table-hover table-bordered tablesorter">
            	<input type="hidden" id ="pg" value="${pg}">
                <thead>
                    <tr>
                        <th>회원 번호<i id="memberNumSort" class="fa fa-sort"></i></th>
                        <th>이메일<i id="dateSort" class="fa fa-sort"></i></th>
                        <th>이름<i id="dateSort" class="fa fa-sort"></i></th>
                        <th>닉네임<i id="dateSort" class="fa fa-sort"></i></th>
                        <th>가입날짜<i id="dateSort" class="fa fa-sort"></i></th>
                        <th>관리</th>
                    </tr>
                </thead>
                <tbody>
                <c:if test="${list != null}">
  					<c:forEach var="memberDTO" items="${list}">
                    <tr>
                        <td class="member_seq">${memberDTO.member_seq}</td>
                        <td>${memberDTO.email}</td>
                        <td>${memberDTO.name}</td>
                        <td>${memberDTO.nickname}</td>
                        <td>${memberDTO.signupDate}</td>
                        <td>
                            <a href="javascript:void(0);" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                        </td>
                    </tr>
                  </c:forEach>
                  </c:if>      
                </tbody>
            </table>
            <div class="clearfix">
              ${adminMemberPaging.pagingHTML}
            </div>
        </div>
    </div>  
</div>
</body>

