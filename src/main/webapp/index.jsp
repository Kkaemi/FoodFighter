<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Index</title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="/FoodFighter/resources/assets/img/favicon.png" rel="icon">
  <link href="/FoodFighter/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Vendor CSS Files -->
  <link href="/FoodFighter/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/FoodFighter/resources/assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="/FoodFighter/resources/assets/vendor/venobox/venobox.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="/FoodFighter/resources/assets/css/style.css" rel="stylesheet">
  <link href="/FoodFighter/resources/css/main.css" rel = "stylesheet">

  <script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>

<body id="page-top">
<form id="headerForm" name="headerForm" method="post" action="./review/getSearchList">
  <!-- ======= Header/ Navbar ======= -->
  <nav class="navbar navbar-b navbar-trans navbar-expand-md fixed-top" id="mainNav">
    <div class="container">
      <a id="logo" class="navbar-brand js-scroll" href="/FoodFighter/"><img id="logo-img" src="/FoodFighter/resources/img/logo.png" width="200px;" height="55px;" ></a>
      <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarDefault" aria-controls="navbarDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span></span>
        <span></span>
        <span></span>
      </button>
      
      <div class="navbar-collapse collapse justify-content-end" id="navbarDefault">
        <ul class="navbar-nav">
         <li class="nav-search">
	   		<img src="./resources/img/search.png" class="header_searchIcon" width="30" height="30" align="center"> 
		   	<input type="search" class="header_searchInput" placeholder="&emsp;&emsp;식당 또는 음식 검색" id ="keyword" name="keyword" autocomplete="on" maxlength="50" >
		   	<button size="10" id="header_searchBtn">검색</button>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll active" href="/FoodFighter">Home</a>
          </li>
          <li class="nav-item">
           <a class="nav-link js-scroll" href="/FoodFighter/review/reviewNonSearchList">리뷰 리스트</a>
          </li>
          <li class="nav-item">
           <a class="nav-link js-scroll" href="/FoodFighter/community/communityMain">커뮤니티</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll" href="/FoodFighter/event/eventList">이벤트</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll">
            <img src="/FoodFighter/resources/img/member.png" class="header_searchIcon" width="30" height="30" align="center">
            </a>
          </li>
          <!-- <li class="nav-item">
            <a class="nav-link js-scroll" href="#blog"><img src="./img/member.png" class="header_searchIcon" width="30" height="30" align="center"></a>
          </li> -->
        </ul>
      </div>
    </div>
  </nav>
</form>
<form id="searchForm" name="searchForm" method="post" action="./review/getSearchList">
  <!-- ======= Intro Section ======= -->
  <div id="home" class="intro route bg-image" style="background-image: url(/FoodFighter/resources/assets/img/ah.jpg)">
    <div class="overlay-itro"></div>
    <div class="intro-content display-table">
      <div class="table-cell">
        <div class="container">
          <!--<p class="display-6 color-d">Hello, world!</p>-->
          <h1 class="intro-title mb-4">푸드파이터</h1>
       		 <input type="text" class="Intro_searchInput" placeholder="&emsp;&emsp;식당 또는 음식 검색" class="keyword" id ="keyword" name="keyword" value = "${keyword}" autocomplete="on" maxlength="20" size="80">
      		 <button id="Intro_searchBtn"><font class="searchBtn">검색</font></button>
        </div>
      </div>
    </div>
  </div><!-- End Intro Section -->
  <main id="main">
</form>

    <!-- ======= 카테고리 ======= -->
    <section id="service" class="services-mf pt-5 route">
      <div class="container">
        <div class="row">
          <div class="col-sm-12">
            <div class="title-box text-center">
              <h3 class="title-a">
                Best Category
              </h3>
              <p class="subtitle-a">
                카테고리별 가장 인기가 좋은 맛집소개
              </p>
              <div class="line-mf"></div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6">
            <div class="service-box">
              <div class="service-ico">
                <span class="ico-circle"><i class="ion-monitor"></i></span>
              </div>
              <div class="service-content">
                <h2 class="s-title">한식</h2>
                <p class="s-description text-center">
                   한식 카테고리별 맛집
                </p>
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <div class="service-box">
              <div class="service-ico">
                <span class="ico-circle"><i class="ion-code-working"></i></span>
              </div>
              <div class="service-content">
                <h2 class="s-title">중식</h2>
                <p class="s-description text-center">
                  중식 카테고리별 맛집
                </p>
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <div class="service-box">
              <div class="service-ico">
                <span class="ico-circle"><i class="ion-camera"></i></span>
              </div>
              <div class="service-content">
                <h2 class="s-title">일식</h2>
                <p class="s-description text-center">
                  일식 카테고리별 맛집
                </p>
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <div class="service-box">
              <div class="service-ico">
                <span class="ico-circle"><i class="ion-android-phone-portrait"></i></span>
              </div>
              <div class="service-content">
                <h2 class="s-title">양식</h2>
                <p class="s-description text-center">
                양식 카테고리별 맛집
                </p>
              </div>
            </div>
          </div>
    </section><!-- End Services Section -->


    <!-- ======= Portfolio Section ======= -->
    <section id="work" class="portfolio-mf sect-pt4 route">
      <div class="container">
        <div class="row">
          <div class="col-sm-12">
            <div class="title-box text-center">
              <h3 class="title-a">
                리뷰왕 랭킹
              </h3>
              <p class="subtitle-a">
               작성수와 000순으로
              </p>
              <div class="line-mf"></div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-4">
            <div class="work-box">
              <a href="/FoodFighter/resources/assets/img/work-1.jpg" data-gall="portfolioGallery" class="venobox">
                <div class="work-img">
                  <img src="/FoodFighter/resources/assets/img/work-1.jpg" alt="" class="img-fluid">
                </div>
              </a>
              <div class="work-content">
                <div class="row">
                  <div class="col-sm-8">
                    <h2 class="w-title">유재석</h2>
                    <div class="w-more">
                      <span class="w-ctegory">1등급</span> / <span class="w-date">18 Sep. 2018</span>
                    </div>
                  </div>
                  <div class="col-sm-4">
                    <div class="w-like">
                      <a href="portfolio-details.html"> <span class="ion-ios-plus-outline"></span></a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="work-box">
              <a href="/FoodFighter/resources/assets/img/work-2.jpg" data-gall="portfolioGallery" class="venobox">
                <div class="work-img">
                  <img src="/FoodFighter/resources/assets/img/work-2.jpg" alt="" class="img-fluid">
                </div>
              </a>
              <div class="work-content">
                <div class="row">
                  <div class="col-sm-8">
                    <h2 class="w-title">박명수</h2>
                    <div class="w-more">
                      <span class="w-ctegory">1등급</span> / <span class="w-date">18 Sep. 2018</span>
                    </div>
                  </div>
                  <div class="col-sm-4">
                    <div class="w-like">
                      <a href="portfolio-details.html"> <span class="ion-ios-plus-outline"></span></a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="work-box">
              <a href="/FoodFighter/resources/assets/img/work-3.jpg" data-gall="portfolioGallery" class="venobox">
                <div class="work-img">
                  <img src="/FoodFighter/resources/assets/img/work-3.jpg" alt="" class="img-fluid">
                </div>
              </a>
              <div class="work-content">
                <div class="row">
                  <div class="col-sm-8">
                    <h2 class="w-title">하하</h2>
                    <div class="w-more">
                      <span class="w-ctegory">1등급</span> / <span class="w-date">18 Sep. 2018</span>
                    </div>
                  </div>
                  <div class="col-sm-4">
                    <div class="w-like">
                      <a href="portfolio-details.html"> <span class="ion-ios-plus-outline"></span></a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="work-box">
              <a href="/FoodFighter/resources/assets/img/work-4.jpg" data-gall="portfolioGallery" class="venobox">
                <div class="work-img">
                  <img src="/FoodFighter/resources/assets/img/work-4.jpg" alt="" class="img-fluid">
                </div>
              </a>
              <div class="work-content">
                <div class="row">
                  <div class="col-sm-8">
                    <h2 class="w-title">정준하</h2>
                    <div class="w-more">
                      <span class="w-ctegory">1등급</span> / <span class="w-date">18 Sep. 2018</span>
                    </div>
                  </div>
                  <div class="col-sm-4">
                    <div class="w-like">
                      <a href="portfolio-details.html"> <span class="ion-ios-plus-outline"></span></a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="work-box">
              <a href="/FoodFighter/resources/assets/img/work-5.jpg" data-gall="portfolioGallery" class="venobox">
                <div class="work-img">
                  <img src="/FoodFighter/resources/assets/img/work-5.jpg" alt="" class="img-fluid">
                </div>
              </a>
              <div class="work-content">
                <div class="row">
                  <div class="col-sm-8">
                    <h2 class="w-title">정형돈</h2>
                    <div class="w-more">
                      <span class="w-ctegory">1등급</span> / <span class="w-date">18 Sep. 2018</span>
                    </div>
                  </div>
                  <div class="col-sm-4">
                    <div class="w-like">
                      <a href="portfolio-details.html"> <span class="ion-ios-plus-outline"></span></a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="work-box">
              <a href="/FoodFighter/resources/assets/img/work-6.jpg" data-gall="portfolioGallery" class="venobox">
                <div class="work-img">
                  <img src="/FoodFighter/resources/assets/img/work-6.jpg" alt="" class="img-fluid">
                </div>
              </a>
              <div class="work-content">
                <div class="row">
                  <div class="col-sm-8">
                    <h2 class="w-title">노홍철</h2>
                    <div class="w-more">
                      <span class="w-ctegory">1등급</span> / <span class="w-date">18 Sep. 2017</span>
                    </div>
                  </div>
                  <div class="col-sm-4">
                    <div class="w-like">
                      <a href="portfolio-details.html"> <span class="ion-ios-plus-outline"></span></a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>
      </div>
    </section><!-- End Portfolio Section -->

    <!-- ======= Blog Section ======= -->
    <section id="blog" class="blog-mf sect-pt4 route">
      <div class="container">
        <div class="row">
          <div class="col-sm-12">
            <div class="title-box text-center">
              <h3 class="title-a">
                Event
              </h3>
              <p class="subtitle-a">
                체험단 신청 게시판이동
              </p>
              <div class="line-mf"></div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-4">
            <div class="card card-blog">
              <div class="card-img">
                <a href="blog-single.html"><img src="/FoodFighter/resources/assets/img/post-1.jpg" alt="" class="img-fluid"></a>
              </div>
              <div class="card-body">
                <div class="card-category-box">
                  <div class="card-category">
                    <h6 class="category"></h6>
                  </div>
                </div>
                <h3 class="card-title"><a href="blog-single.html">See more ideas about Travel</a></h3>
                <p class="card-description">
                  Proin eget tortor risus. Pellentesque in ipsum id orci porta dapibus. Praesent sapien massa, convallis
                  a pellentesque nec,
                  egestas non nisi.
                </p>
              </div>
              <div class="card-footer">
                <div class="post-author">
                  <a href="#">
                    <img src="/FoodFighter/resources/img/member.png" alt="" class="avatar rounded-circle">
                    <span class="author">커피집사장님</span>
                  </a>
                </div>
                <div class="post-date">
                  <span class="ion-ios-clock-outline"></span> 
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card card-blog">
              <div class="card-img">
                <a href="blog-single.html"><img src="/FoodFighter/resources/assets/img/post-2.jpg" alt="" class="img-fluid"></a>
              </div>
              <div class="card-body">
                <div class="card-category-box">
                  <div class="card-category">
                    <h6 class="category"></h6>
                  </div>
                </div>
                <h3 class="card-title"><a href="blog-single.html">See more ideas about Travel</a></h3>
                <p class="card-description">
                  Proin eget tortor risus. Pellentesque in ipsum id orci porta dapibus. Praesent sapien massa, convallis
                  a pellentesque nec,
                  egestas non nisi.
                </p>
              </div>
              <div class="card-footer">
                <div class="post-author">
                  <a href="#">
                    <img src="/FoodFighter/resources/img/member.png" alt="" class="avatar rounded-circle">
                    <span class="author">횟집사장님</span>
                  </a>
                </div>
                <div class="post-date">
                  <span class="ion-ios-clock-outline"></span> 
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card card-blog">
              <div class="card-img">
                <a href="blog-single.html"><img src="/FoodFighter/resources/assets/img/post-3.jpg" alt="" class="img-fluid"></a>
              </div>
              <div class="card-body">
                <div class="card-category-box">
                  <div class="card-category">
                    <h6 class="category"></h6>
                  </div>
                </div>
                <h3 class="card-title"><a href="blog-single.html">See more ideas about Travel</a></h3>
                <p class="card-description">
                  Proin eget tortor risus. Pellentesque in ipsum id orci porta dapibus. Praesent sapien massa, convallis
                  a pellentesque nec,
                  egestas non nisi.
                </p>
              </div>
              <div class="card-footer">
                <div class="post-author">
                  <a href="#">
                    <img src="/FoodFighter/resources/img/member.png" alt="" class="avatar rounded-circle">
                    <span class="author">칼국수 사장님</span>
                  </a>
                </div>
                <div class="post-date">
                  <span class="ion-ios-clock-outline"></span> 
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section><!-- End Blog Section -->


  </main><!-- End #main -->

 <!-- Footer -->
 <div id="footer-container">
	 <p class="copyright" style="text-align:left;">
	     ㈜ 푸드파이터<br>서울 서초구 강남대로 459(백암빌딩) 202호<br>대표이사: FOODFIGHTER<br>사업자 등록번호: 2020-020-22222 
	       <br>고객센터: 0507-1414-9601<br><br>
	       <strong>HOME | 리뷰리스트 | 커뮤니티 | 이벤트</strong><br><br>
	       &copy; Copyright <strong>foodFighter</strong>. All Rights Reserved
              Designed by foodFighter
	 </p>
 </div>
  
  <!-- Up -->
  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"> <img src="/FoodFighter/resources/img/back-up.png" width="32px;" height="32px;"></i></a>
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="/FoodFighter/resources/assets/vendor/jquery/jquery.min.js"></script>  
  <script src="/FoodFighter/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/FoodFighter/resources/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="/FoodFighter/resources/assets/vendor/php-email-form/validate.js"></script>
  <script src="/FoodFighter/resources/assets/vendor/waypoints/jquery.waypoints.min.js"></script>
  <script src="/FoodFighter/resources/assets/vendor/counterup/jquery.counterup.min.js"></script>
  <script src="/FoodFighter/resources/assets/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="/FoodFighter/resources/assets/vendor/typed.js/typed.min.js"></script>
  <script src="/FoodFighter/resources/assets/vendor/venobox/venobox.min.js"></script>

  <!-- Template Main JS File -->
  <script src="/FoodFighter/resources/assets/js/main.js"></script>
  <script src="/FoodFighter/resources/js/review/keyword.js"></script>
</body>

</html>