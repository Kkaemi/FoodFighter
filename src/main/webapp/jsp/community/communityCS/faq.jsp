<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ게시판</title>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="/FoodFighter/recourses/css/community/headerCss.css">
    <link rel="stylesheet" href="/FoodFighter/recourses/css/community/normalize.css">
    <link rel="stylesheet" href="/FoodFighter/recourses/css/community/communityBoard.css">
    <!-- <link rel="stylesheet" href="css/store_common.css"> -->
    <!-- <link rel="stylesheet" href="css/sub.css"> -->
    <style>
        /* table {
            display: table;
            border-collapse: separate;
            box-sizing: border-box;
            border-spacing: 2px;
            border-color: grey;
        } */

        ul {
            margin: 0;
            padding: 0;
            border: 0;
            outline: 0;
            vertical-align: top;
            background: transparent;
        }

        .mypage_type {
            display: table;
            width: 100%;
            height: 32px;
            margin-top: 20px;
            *zoom: 1;
            border: 1px solid #ddd;
            border-left: none;
            box-sizing: border-box
        }

        .mypage_type li {
            display: table-cell;
            width: 9.09%
        }

        .mypage_type li a {
            border-left: 1px solid #ddd;
            box-sizing: border-box
        }

        .mypage_type li.active {
            border: 1px solid #000;
        }

        .mypage_type li.active a {
            color: #000;
            font-weight: bold;
        }

        .mypage_type a {
            display: block;
            width: 100%;
            height: 30px;
            color: #b2b2b2;
            text-align: center;
            line-height: 30px
        }

        .mypage_type_on a {
            font-weight: bold;
            color: #000;
            background: #f3f3f3;
            border-left: 1px solid #ddd
        }

        .mypage_type .selected {
            font-weight: bold;
            background: #f3f3f3
        }

        .mypage_type .selected a {
            color: #000
        }

        .table_basic {
            clear: both;
            width: 100%;
            font-family: "굴림", Gulim, sans-serif;
            text-align: center;
            background: #fff
        }

        .table_basic tr {
            border: 1px solid #ddd
        }

        .table_basic th {
            vertical-align: middle;
            padding: 10px 0
        }

        .table_basic td {
            line-height: 16.8px;
            padding: 10px 0
        }

        .table_basic td.empty_cart {
            vertical-align: middle
        }

        .table_basic .txt_subject {
            text-align: left
        }

        .table_basic .border_right_none {
            border-right: none
        }
    </style>
</head>

<body>
    <!-- 헤더부분 -->
    <div class="header">
        <img src="" class="header_SearchIcon" width="30" height="30" align="center">
        <input type="text" class="header_SearchInput" placeholder="식당 또는 음식 검색" value="" autocomplete="on"
            maxlength="50">
        &emsp;&emsp;리뷰리스트&emsp;|&emsp;커뮤니티&emsp;|&emsp;이벤트
    </div>
    <!-- 제목부분 -->
    <div class="container">
        <div class="page-header">
            <h2 class="text-center">FAQ</h2>
            <p class="text-center">자주 묻는 질문 모음</p>
        </div>
    </div>
    <!-- FAQ 본문 -->
    <div class="page-body">
        <form id="search_form" method="get" action="/app/cs/faq">
            <h3 class="title_cs font-mss">FAQ</h3>
            <input class="faq_search_txt" name="q" type="text">
            <a class="plain-btn btn search_again_btn faq_search_btn"><input type="submit" value="검색"></a>
        </form>
        <!-- 탭버튼 -->
        <ul class="mypage_type">
            <li class="selected"><a href="#">회원 관련</a></li>
            <li><a href="#">리뷰 관련</a></li>
            <li><a href="#">기타</a></li>
        </ul>
        <!-- //탭버튼 -->
        <!-- 콘텐츠 -->
        <table class="table_basic table_faq_cs">
            <colgroup>
                <col width="8%">
                <col width="">
            </colgroup>
            <thead>
                <tr>
                    <th style="text-align: center;">번호</th>
                    <th style="text-align: center;">내용</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td class="txt_contents"><a href="javascript:void(0)"
                            onclick="viewContent('faq_69', '', ''); return false;">바로접속 ON 일시에만 회원 할인 혜택이 정상 제공됩니다.</a>
                    </td>
                </tr>
                <tr id="faq_69" style="display: none;">
                    <td class="faq_q">답변</td>
                    <td class="faq_a">
                        <p>바로 접속 ON 은 무신사 스토어 즐겨찾기 접속이나 무신사 스토어 URL을 입력하여 바로 접속한 경우에만 해당되며, 무신사 스토어의 회원 할인 혜택을 받으실 수
                            있습니다.<br><br>
                            바로 접속 OFF는 네이버 키워드 광고, 배너광고, 지식쇼핑 및 다음 쇼핑하우 등 광고를 통한 접속 시, 회원 할인 혜택이 제공되지 않으며, 적립금 사용이
                            불가능합니다. 또한 비회원으로 주문 시에도 회원&nbsp;혜택이 적용되지 않으니&nbsp;바로 접속 OFF 상태(광고 접속)에서 바로 접속 ON을 희망하시는 경우
                            모든 인터넷 창을 닫으신 후 즐겨찾기나 무신사스토어 URL( store.musinsa.com)을 직접 입력하여 접속하시기 바랍니다.<br><br>
                            위와 같은 경우에도 바로 접속 OFF 상태일 경우 아래 URL을 복사하여 주소창에&nbsp;입력하셔서&nbsp;접속, 새로 고침 해보시기 바랍니다.<br><br>
                            store.musinsa.com/app/?source=ICON</p>
                        <div class="faq_url"><span>URL</span>http://store.musinsa.com/app/cs/faq/12?view_no=69</div>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td class="txt_contents"><a href="javascript:void(0)"
                            onclick="viewContent('faq_70', '', ''); return false;">복합결제가 가능한가요?</a></td>
                </tr>
                <tr id="faq_70" style="display: none;">
                    <td class="faq_q">답변</td>
                    <td class="faq_a">
                        <p>복합결제는 현재 지원하지 않습니다. 구매를 희망하시는 고객님들께서는 한 가지의 결제수단을 이용해 주시기 바랍니다.</p>
                        <div class="faq_url"><span>URL</span>http://store.musinsa.com/app/cs/faq/12?view_no=70</div>
                    </td>
                </tr>
                <tr>
                    <td>3</td>
                    <td class="txt_contents"><a href="javascript:void(0)"
                            onclick="viewContent('faq_71', '', ''); return false;">인터넷 안전 결제(ISP) 가 무엇입니까?</a></td>
                </tr>
                <tr id="faq_71" style="display: none;">
                    <td class="faq_q">답변</td>
                    <td class="faq_a">
                        <p>인터넷 안전 결제(ISP)는 BC/국민/우리/신한카드사에서 의무적으로 시행하는 것으로, BC/국민/우리/신한카드로 결제할 때 카드번호를 직접 입력하지 않고 카드사에서
                            발급하는 가상의 인터넷안전결제(ISP) 비밀번호만으로 안전한 전자상거래를 할 수 있는 서비스입니다.</p><br>
                        <br>
                        <p>① 결제수단 선택에서 BC/국민/우리/신한카드(안전결제) 선택<br><br>
                            ② 자동으로 뜨는 플러그인 창에서 ISP인증번호 입력 : 사전에 ISP 서비스 등록이 되어 있지 않는 경우, 플러그인 창에서 카드번호와 이메일 입력을 통해 바로
                            ISP서비스를 등록 가능합니다. (해당 카드사 홈페이지에서도 등록 가능함)<br><br>
                            ③ 30만원 이상 결제 시 추가로 공인인증번호 입력 : 1회 결제금액이 30만원 이상인 경우는 인터넷뱅킹에 사용하시는 공인인증번호를 입력하셔야 합니다. 2)
                            공인인증서가 없으신 분은 신분증을 지참해 거래 은행에 방문하셔서 신청을 하시고, 해당 은행의 홈페이지에서 공인인증서를 다운로드 받아 설치하시면 됩니다.</p><br>
                        <br>
                        <p>[참고사항]<br><br>
                            거래금액이 30만원 이상일 때는 공인인증 과정이 필수입니다.</p>
                        <div class="faq_url"><span>URL</span>http://store.musinsa.com/app/cs/faq/12?view_no=71</div>
                    </td>
                </tr>
                <tr>
                    <td>4</td>
                    <td class="txt_contents"><a href="javascript:void(0)"
                            onclick="viewContent('faq_72', '', ''); return false;">안심클릭은 무엇인가요?</a></td>
                </tr>
                <tr id="faq_72" style="display: none;">
                    <td class="faq_q">답변</td>
                    <td class="faq_a">
                        <p>인터넷 쇼핑 시 고객님이 소유하신 카드에 미리 설정해 둔 전자상거래용의 별도 비밀번호를 입력하여 카드사용자 본인을 확인함으로써 온라인 상에서의 카드 무단도용을
                            방지해주는 서비스입니다.<br>[참고사항]<br>- 시행일시 : 2004년 4월 1일부터 정부 시책에 따라 의무 시행<br>- 대상카드:
                            삼성/외환/신한/현대/롯데/하나/씨티 등<br>- 인증방식: 카드사가 제공하는 팝업창 에서 선택 가능<br>① 30만원 미만: 안심클릭 또는 공인인증<br>②
                            30만원 이상: 공인인증<br>안심클릭 등록방법: 고객님이 소유한 신용카드의 카드사 홈페이지 통해 등록 가능</p>
                        <div class="faq_url"><span>URL</span>http://store.musinsa.com/app/cs/faq/12?view_no=72</div>
                    </td>
                </tr>
                <tr>
                    <td>5</td>
                    <td class="txt_contents"><a href="javascript:void(0)"
                            onclick="viewContent('faq_74', '', ''); return false;">적립금 선 할인은 무엇인가요?</a></td>
                </tr>
                <tr id="faq_74" style="display: none;">
                    <td class="faq_q">답변</td>
                    <td class="faq_a">
                        <p>적립금 선 할인은 상품 구매 시 지급되는 적립금을 지급받지 않고 상품 주문 시 즉시 사용하는 할인 방법입니다.&nbsp;<br><br>
                            제휴(광고) 접속 또는 일부 상품에는 적립금 선 할인이 제한될 수 있습니다.</p>
                        <div class="faq_url"><span>URL</span>http://store.musinsa.com/app/cs/faq/12?view_no=74</div>
                    </td>
                </tr>
                <tr>
                    <td>6</td>
                    <td class="txt_contents"><a href="javascript:void(0)"
                            onclick="viewContent('faq_136', '', ''); return false;">등급 할인은 무엇인가요?</a></td>
                </tr>
                <tr id="faq_136" style="display: none;">
                    <td class="faq_q">답변</td>
                    <td class="faq_a">
                        <p>무신사의 회원 등급은 다양한 커뮤니티 활동과 상품 구매로 등급 점수가 부여되며, 각 점수에 따라 회원 등급이 구분됩니다. 상품 구매 시 등급 별로 추가 할인 혜택이
                            있습니다.</p><br>
                        <br>
                        <p><strong><a href="https://store.musinsa.com/app/content/s/cs/benefit_01" target="_blank"><span
                                        style="color:#3498db;">[등급 별 혜택 보기]</span></a></strong><br><br>
                            <strong><a href="https://my.musinsa.com/member/v1/benefit" target="_blank"><span
                                        style="color:#3498db;">[현재 나의 등급 점수 보기]</span></a></strong></p>
                        <div class="faq_url"><span>URL</span>http://store.musinsa.com/app/cs/faq/12?view_no=136</div>
                    </td>
                </tr>
                <tr>
                    <td>7</td>
                    <td class="txt_contents"><a href="javascript:void(0)"
                            onclick="viewContent('faq_181', '', ''); return false;">가상계좌 주문이 제한 되었어요.</a></td>
                </tr>
                <tr id="faq_181" style="display: none;">
                    <td class="faq_q">답변</td>
                    <td class="faq_a">
                        <p>가상계좌 주문 후 반복적인 주문취소 시, 가상계좌 주문이 제한됩니다. 다른 결제수단을 이용하시거나 익일 제한이 해제되었을 경우 주문 가능 합니다.</p>
                        <div class="faq_url"><span>URL</span>http://store.musinsa.com/app/cs/faq/12?view_no=181</div>
                    </td>
                </tr>
                <tr>
                    <td>8</td>
                    <td class="txt_contents"><a href="javascript:void(0)"
                            onclick="viewContent('faq_182', '', ''); return false;">휴대폰 소액결제에 대하여 알려주세요.</a></td>
                </tr>
                <tr id="faq_182" style="display: none;">
                    <td class="faq_q">답변</td>
                    <td class="faq_a">
                        <p>휴대폰 소액결제는 결제 대금을 휴대폰으로 결제하는 방법으로 결제 시 구매금액의 5%의 수수료가 발생합니다. 결제 대금은 다음 달 휴대폰 요금에 부과되어 청구됩니다.
                            환불 시 결제 수수료를 포함하여 환불됩니다.<br><br>
                            [주의사항]<br><br>
                            - 50만원 이상 결제 시 휴대폰 소액결제 서비스가 차단됩니다.<br><br>
                            - 휴대폰 결제의 환불 시, 부분 환불 또는 결제 월이 지난 경우 계좌로 환불됩니다.</p>
                        <div class="faq_url"><span>URL</span>http://store.musinsa.com/app/cs/faq/12?view_no=182</div>
                    </td>
                </tr>
                <tr>
                    <td>9</td>
                    <td class="txt_contents"><a href="javascript:void(0)"
                            onclick="viewContent('faq_207', '', ''); return false;">주문 결제 시 현금영수증 요청을 하지 않았습니다. 따로 신청
                            가능한가요?</a></td>
                </tr>
                <tr id="faq_207" style="display: none;">
                    <td class="faq_q">답변</td>
                    <td class="faq_a">
                        <p>주문 결제 후 현금영수증 요청은 고객센터로 문의 부탁드립니다. 발행이 가능한 기간은 <strong>결제월 기준 익월 15일 이내</strong>입니다.</p>
                        <div class="faq_url"><span>URL</span>http://store.musinsa.com/app/cs/faq/12?view_no=207</div>
                    </td>
                </tr>
                <tr>
                    <td>10</td>
                    <td class="txt_contents"><a href="javascript:void(0)"
                            onclick="viewContent('faq_209', '', ''); return false;">[TOSS] 현금영수증 발급은 어떻게 하나요?</a></td>
                </tr>
                <tr id="faq_209" style="display: none;">
                    <td class="faq_q">답변</td>
                    <td class="faq_a">
                        <p>1. 결제 비밀번호 입력 전 설정으로 들어갑니다.<br><br>
                            <img alt="" src="//image.msscdn.net/images/faq/2018111310330200000021112.png"><br><br>
                            2. 결제 설정에서 현금영수증 발급 설정을 누릅니다.<br><br>
                            <img alt="" src="//image.msscdn.net/images/faq/2018111310333200000099268.png"><br><br>
                            3. 발급 종류 및 증빙 방법 선택 후, 개인정보 제공 동의를 체크하여 확인을 누릅니다. 이 후 결제 비밀번호를 입력하여 결제를 진행하면 발급이 완료
                            됩니다.<br><br>
                            <img alt="" src="//image.msscdn.net/images/faq/2018111310353000000089320.png"></p>
                        <div class="faq_url"><span>URL</span>http://store.musinsa.com/app/cs/faq/12?view_no=209</div>
                    </td>
                </tr>
                <tr>
                    <td>11</td>
                    <td class="txt_contents"><a href="javascript:void(0)"
                            onclick="viewContent('faq_210', '', ''); return false;">[TOSS] 등록한 계좌에 잔액이 있는데 이체가 안돼요.</a>
                    </td>
                </tr>
                <tr id="faq_210" style="display: none;">
                    <td class="faq_q">답변</td>
                    <td class="faq_a">
                        - 등록계좌 혹은 입금계좌의 시스템점검 혹은 일시점검의 경우에는 사용이 불가능합니다.<br><br>
                        - 보안상의 안전을 위해 토스측에서 사용을 정지시켰을때는 사용이 불가능합니다.<br><br>
                        -&nbsp;등록계좌의 잔액이 수표입금인 경우 1~3일이 지나야 사용이 가능합니다.<br><br>
                        -&nbsp;입금받는 계좌가 특수목적계좌(적금, 청약 등) 혹은 휴면 계좌라면 이체가 불가능합니다.<br><br>
                        -&nbsp;입금받는 계좌가 가상계좌라면 금액을 나눠 입금할경우에는 입금이 불가능합니다. <div class="faq_url">
                            <span>URL</span>http://store.musinsa.com/app/cs/faq/12?view_no=210</div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- //콘텐츠 -->
</body>
<script src="js/jquery-3.5.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</html>