<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
 
    <title>Uni Shop
    </title>
    <!-- SEO Meta Tags-->
    <meta name="description" content="Unishop - Universal E-Commerce Template">
    <meta name="keywords" content="shop, e-commerce, modern, flat style, responsive, online store, business, mobile, blog, bootstrap 4, html5, css3, jquery, js, gallery, slider, touch, creative, clean">
    <meta name="author" content="Rokaux">
    <!-- Mobile Specific Meta Tag-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <!-- Favicon and Apple Icons-->
    <link rel="icon" type="image/x-icon" href="favicon.ico">
    <link rel="icon" type="image/png" href="favicon.png">
    <link rel="apple-touch-icon" href="touch-icon-iphone.png">
    <link rel="apple-touch-icon" sizes="152x152" href="touch-icon-ipad.png">
    <link rel="apple-touch-icon" sizes="180x180" href="touch-icon-iphone-retina.png">
    <link rel="apple-touch-icon" sizes="167x167" href="touch-icon-ipad-retina.png">
    <!-- Vendor Styles including: Bootstrap, Font Icons, Plugins, etc.-->
    <link rel="stylesheet" media="screen" href="css/vendor.min.css">
    <!-- Main Template Styles-->
    <link id="mainStyles" rel="stylesheet" media="screen" href="css/styles.min.css">
    <link  rel="stylesheet" media="screen" href="css/main.css">
    <!-- Modernizr-->
    <script src="js/modernizr.min.js"></script>
  </head>
  <!-- Body-->
  <body>
    <!-- Off-Canvas Category Menu-->
    <div class="offcanvas-container" id="shop-categories">
      <div class="offcanvas-header">
        <h3 class="offcanvas-title">Shop Categories</h3>
      </div>
      <nav class="offcanvas-menu">
        <ul class="menu">
          <li class="has-children"><span><a href="#">여성 상의</a><span class="sub-menu-toggle"></span></span>
            <ul class="offcanvas-submenu">
              <li><a href="shop_female_outer_list">여성 아우터</a></li>
              <li><a href="shop_female_cardigan_list">여성 가디건</a></li>
              <li><a href="shop_female_tshirt_list">여성 티셔츠</a></li>
            </ul>
          </li>
          <li class="has-children"><span><a href="#">여성 하의</a><span class="sub-menu-toggle"></span></span>
            <ul class="offcanvas-submenu">
              <li><a href="shop_female_longpants_list">여성 긴바지</a></li>
              <li><a href="shop_female_skirt_list">여성 스커트</a></li>
            </ul>
          </li>
          <li class="has-children"><span><a href="#">남성 상의</a><span class="sub-menu-toggle"></span></span>
            <ul class="offcanvas-submenu">
              <li><a href="shop_male_outer_list">남성 아우터</a></li>
              <li><a href="shop_male_cardigan_list">남성 가디건</a></li>
              <li><a href="shop_male_tshirt_list">남성 티셔츠</a></li>
            </ul>
          </li>
          <li class="has-children"><span><a href="#">남성 하의</a><span class="sub-menu-toggle"></span></span>
            <ul class="offcanvas-submenu">
              <li><a href="shop_male_longpants_list">남성 긴바지</a></li>
              <li><a href="shop_male_shortpants_list">남성 반바지</a></li>
            </ul>
          </li>
        </ul>
      </nav>
    </div>
    <!-- Off-Canvas Mobile Menu-->
    <div class="offcanvas-container" id="mobile-menu"><a class="account-link" href="account-orders.html">
        <div class="user-info">
          <h6 class="user-name">${loginMember.member_name}</h6><span class="text-sm text-white opacity-60"></span>
        </div></a>
      <nav class="offcanvas-menu">
        <ul class="menu">
          <li class="has-children"><span><a href="unishop_main"><span>Home</span></a><span class="sub-menu-toggle"></span></span>
            <ul class="offcanvas-submenu">
                <li><a href="index.html">Featured Products Slider</a></li>
                <li><a href="home-featured-categories.html">Featured Categories</a></li>
                <li><a href="home-collection-showcase.html">Products Collection Showcase</a></li>
                <li><a href="home-dark-header.html">Dark Header</a></li>
            </ul>
          </li>
          <li class="has-children"><span><a href="shop_main"><span>Shop</span></a><span class="sub-menu-toggle"></span></span>
            <ul class="offcanvas-submenu">
                <li><a href="shop-categories.html">Shop Categories</a></li>
              <li class="has-children"><span><a href="shop-grid-ls.html"><span>Shop Grid</span></a><span class="sub-menu-toggle"></span></span>
                <ul class="offcanvas-submenu">
                    <li><a href="shop-grid-ls.html">Grid Left Sidebar</a></li>
                    <li><a href="shop-grid-rs.html">Grid Right Sidebar</a></li>
                    <li><a href="shop-grid-ns.html">Grid No Sidebar</a></li>
                </ul>
              </li>
              <li class="has-children"><span><a href="shop-list-ls.html"><span>Shop List</span></a><span class="sub-menu-toggle"></span></span>
                <ul class="offcanvas-submenu">
                    <li><a href="shop-list-ls.html">List Left Sidebar</a></li>
                    <li><a href="shop-list-rs.html">List Right Sidebar</a></li>
                    <li><a href="shop-list-ns.html">List No Sidebar</a></li>
                </ul>
              </li>
                <li><a href="shop-single.html">Single Product</a></li>
                <li><a href="cart_list">Cart</a></li>
                <li><a href="jumun_address_form">Checkout</a></li>
            </ul>
          </li>
          <li class="has-children"><span><a href="#">카테고리</a><span class="sub-menu-toggle"></span></span>
            <ul class="offcanvas-submenu">
              <li class="has-children"><span><a href="#">Men's Shoes</a><span class="sub-menu-toggle"></span></span>
                <ul class="offcanvas-submenu">
                  <li><a href="#">Sneakers</a></li>
                  <li><a href="#">Loafers</a></li>
                  <li><a href="#">Boat Shoes</a></li>
                  <li><a href="#">Sandals</a></li>
                  <li><a href="#">View All</a></li>
                </ul>
              </li>
              <li class="has-children"><span><a href="#">Women's Shoes</a><span class="sub-menu-toggle"></span></span>
                <ul class="offcanvas-submenu">
                  <li><a href="#">Sandals</a></li>
                  <li><a href="#">Flats</a></li>
                  <li><a href="#">Sneakers</a></li>
                  <li><a href="#">Heels</a></li>
                  <li><a href="#">View All</a></li>
                </ul>
              </li>
              <li class="has-children"><span><a href="#">Men's Clothing</a><span class="sub-menu-toggle"></span></span>
                <ul class="offcanvas-submenu">
                  <li><a href="#">Shirts &amp; Tops</a></li>
                  <li><a href="#">Pants</a></li>
                  <li><a href="#">Jackets</a></li>
                  <li><a href="#">View All</a></li>
                </ul>
              </li>
              <li class="has-children"><span><a href="#">Women's Clothing</a><span class="sub-menu-toggle"></span></span>
                <ul class="offcanvas-submenu">
                  <li><a href="#">Dresses</a></li>
                  <li><a href="#">Shirts &amp; Tops</a></li>
                  <li><a href="#">Shorts</a></li>
                  <li><a href="#">Swimwear</a></li>
                  <li><a href="#">View All</a></li>
                </ul>
              </li>
              <li class="has-children"><span><a href="#">Bags</a><span class="sub-menu-toggle"></span></span>
                <ul class="offcanvas-submenu">
                  <li><a href="#">Handbags</a></li>
                  <li><a href="#">Backpacks</a></li>
                  <li><a href="#">Luggage</a></li>
                  <li><a href="#">Wallets</a></li>
                  <li><a href="#">View All</a></li>
                </ul>
              </li>
              <li class="has-children"><span><a href="#">Accessories</a><span class="sub-menu-toggle"></span></span>
                <ul class="offcanvas-submenu">
                  <li><a href="#">Sunglasses</a></li>
                  <li><a href="#">Hats</a></li>
                  <li><a href="#">Watches</a></li>
                  <li><a href="#">Jewelry</a></li>
                  <li><a href="#">Belts</a></li>
                  <li><a href="#">View All</a></li>
                </ul>
              </li>
            </ul>
          </li>
          <li class="has-children active"><span><a href="member_profile_form"><span>Account</span></a><span class="sub-menu-toggle"></span></span>
            <ul class="offcanvas-submenu">
                <li><a href="member_login_register_form">Login / Register</a></li>
                <li><a href="account-password-recovery.html">Password Recovery</a></li>
                <li class="active"><a href="member_jumun_list">Orders List</a></li>
                <li><a href="member_wishlist_detail">Wishlist</a></li>
                <li><a href="member_profile_form">Profile Page</a></li>
                <li><a href="member_address_detail">Contact / Shipping Address</a></li>
                <li><a href="member_question_list">질문내역</a></li>
                <li><a href="member_question_detail">질문보기</a></li>
            </ul>
          </li>
          <li class="has-children"><span><a href="blog-rs.html"><span>Blog</span></a><span class="sub-menu-toggle"></span></span>
            <ul class="offcanvas-submenu">
              <li class="has-children"><span><a href="blog-rs.html"><span>Blog Layout</span></a><span class="sub-menu-toggle"></span></span>
                <ul class="offcanvas-submenu">
                    <li><a href="blog-rs.html">Blog Right Sidebar</a></li>
                    <li><a href="blog-ls.html">Blog Left Sidebar</a></li>
                    <li><a href="blog-ns.html">Blog No Sidebar</a></li>
                </ul>
              </li>
              <li class="has-children"><span><a href="blog-single-rs.html"><span>Single Post Layout</span></a><span class="sub-menu-toggle"></span></span>
                <ul class="offcanvas-submenu">
                    <li><a href="blog-single-rs.html">Post Right Sidebar</a></li>
                    <li><a href="blog-single-ls.html">Post Left Sidebar</a></li>
                    <li><a href="blog-single-ns.html">Post No Sidebar</a></li>
                </ul>
              </li>
            </ul>
          </li>
          <li class="has-children"><span><a href="#"><span>Pages</span></a><span class="sub-menu-toggle"></span></span>
            <ul class="offcanvas-submenu">
                <li><a href="about.html">About Us</a></li>
                <li><a href="mobile-app.html">Unishop Mobile App</a></li>
                <li><a href="services.html">Services</a></li>
                <li><a href="contacts.html">Contacts</a></li>
                <li><a href="faq.html">Help / FAQ</a></li>
                <li><a href="order-tracking.html">Order Tracking</a></li>
                <li><a href="search-results.html">Search Results</a></li>
                <li><a href="404.html">404</a></li>
                <li><a href="coming-soon.html">Coming Soon</a></li>
              <li><a class="text-danger" href="docs/dev-setup.html">Documentation</a></li>
            </ul>
          </li>
          <li class="has-children"><span><a href="components/accordion.html"><span>Components</span></a><span class="sub-menu-toggle"></span></span>
            <ul class="offcanvas-submenu">
                <li><a href="components/accordion.html">Accordion</a></li>
                <li><a href="components/alerts.html">Alerts</a></li>
                <li><a href="components/buttons.html">Buttons</a></li>
                <li><a href="components/cards.html">Cards</a></li>
                <li><a href="components/carousel.html">Carousel</a></li>
                <li><a href="components/countdown.html">Countdown</a></li>
                <li><a href="components/forms.html">Forms</a></li>
                <li><a href="components/gallery.html">Gallery</a></li>
                <li><a href="components/google-maps.html">Google Maps</a></li>
                <li><a href="components/images.html">Images &amp; Figures</a></li>
                <li><a href="components/list-group.html">List Group</a></li>
                <li><a href="components/market-social-buttons.html">Market &amp; Social Buttons</a></li>
                <li><a href="components/media.html">Media Object</a></li>
                <li><a href="components/modal.html">Modal</a></li>
                <li><a href="components/pagination.html">Pagination</a></li>
                <li><a href="components/pills.html">Pills</a></li>
                <li><a href="components/progress-bars.html">Progress Bars</a></li>
                <li><a href="components/shop-items.html">Shop Items</a></li>
                <li><a href="components/steps.html">Steps</a></li>
                <li><a href="components/tables.html">Tables</a></li>
                <li><a href="components/tabs.html">Tabs</a></li>
                <li><a href="components/team.html">Team</a></li>
                <li><a href="components/toasts.html">Toast Notifications</a></li>
                <li><a href="components/tooltips-popovers.html">Tooltips &amp; Popovers</a></li>
                <li><a href="components/typography.html">Typography</a></li>
                <li><a href="components/video-player.html">Video Player</a></li>
                <li><a href="components/widgets.html">Widgets</a></li>
            </ul>
          </li>
        </ul>
      </nav>
    </div>
    <!-- Topbar-->
    <div class="topbar">
      <div class="topbar-column"><a class="hidden-md-down" href="mailto:support@unishop.com"><i class="icon-mail"></i>&nbsp; support@unishop.com</a><a class="hidden-md-down" href="tel:00331697720"><i class="icon-bell"></i>&nbsp; 00 33 169 7720</a><a class="social-button sb-facebook shape-none sb-dark" href="#" target="_blank"><i class="socicon-facebook"></i></a><a class="social-button sb-twitter shape-none sb-dark" href="#" target="_blank"><i class="socicon-twitter"></i></a><a class="social-button sb-instagram shape-none sb-dark" href="#" target="_blank"><i class="socicon-instagram"></i></a><a class="social-button sb-pinterest shape-none sb-dark" href="#" target="_blank"><i class="socicon-pinterest"></i></a>
      </div>
      <div class="topbar-column"><a class="hidden-md-down" href="#"><i class="icon-download"></i>&nbsp; Get mobile app</a>
        <div class="lang-currency-switcher-wrap">
          <div class="lang-currency-switcher dropdown-toggle"><span class="language"><img alt="English" src="IMAGE/korea_flag.jpg"></span><span class="currency"> WON (₩)</span></div>
          <div class="dropdown-menu">
            <div class="currency-select">
              <select class="form-control form-control-rounded form-control-sm">
                <option value="usd">₩ WON</option>
                <option value="usd">€ EUR</option>
                <option value="usd">$ USD</option>
                <option value="usd">¥ JPY</option>
              </select>
            </div><a class="dropdown-item" href="#"><img src="img/flags/FR.png" alt="Français">Français</a><a class="dropdown-item" href="#"><img src="img/flags/DE.png" alt="Deutsch">Deutsch</a><a class="dropdown-item" href="#"><img src="img/flags/IT.png" alt="Italiano">Italiano</a>
          </div>
        </div>
      </div>
    </div>
    <!-- Navbar-->
    <!-- Remove "navbar-sticky" class to make navigation bar scrollable with the page.-->
    <header class="navbar navbar-sticky">
      <!-- Search-->
      <form class="site-search" method="get">
        <input type="text" name="site_search" placeholder="Type to search...">
        <div class="search-tools"><span class="clear-search">Clear</span><span class="close-search"><i class="icon-cross"></i></span></div>
      </form>
      <div class="site-branding">
        <div class="inner">
          <!-- Off-Canvas Toggle (#shop-categories)--><a class="offcanvas-toggle cats-toggle" href="#shop-categories" data-toggle="offcanvas"></a>
          <!-- Off-Canvas Toggle (#mobile-menu)--><a class="offcanvas-toggle menu-toggle" href="#mobile-menu" data-toggle="offcanvas"></a>
          <!-- Site Logo--><a class="site-logo" href="unishop_main"><img src="img/logo/logo.png" alt="Unishop"></a>
        </div>
      </div>
      <!-- Main Navigation-->
      <nav class="site-menu">
        <ul>
          <li class="has-megamenu"><a href="unishop_main"><span>Home</span></a></li>
          <li><a href="shop_main"><span>Shop</span></a>
            <ul class="sub-menu">
              <li class="has-children"><a href="shop_female_outer_list"><span>여성</span></a>
                <ul class="sub-menu">
                    <li><a href="shop_female_outer_list">여성 아우터</a></li>
                    <li><a href="shop_female_cardigan_list">여성 가디건</a></li>
                    <li><a href="shop_female_tshirt_list">여성 티셔츠</a></li>
                    <li><a href="shop_female_longpants_list">여성 긴바지</a></li>
                    <li><a href="shop_female_skirt_list">여성 스커트</a></li>
                </ul>
              </li>
              <li class="has-children"><a href="shop_male_outer_list"><span>남성</span></a>
                <ul class="sub-menu">
                    <li><a href="shop_male_outer_list">남성 아우터</a></li>
                    <li><a href="shop_male_cardigan_list">남성 가디건</a></li>
                    <li><a href="shop_male_tshirt_list">남성 티셔츠</a></li>
                    <li><a href="shop_male_longpants_list">남성 긴바지</a></li>
                    <li><a href="shop_male_shortpants_list">남성 반바지</a></li>
                </ul>
              </li>
                <li><c:choose><c:when test="${empty sMemberId}"><a href="member_login_register_form">장바구니</a></c:when><c:otherwise><a href="cart_list">장바구니</a></c:otherwise></c:choose></li>
            </ul>
          </li>
          <li><c:choose><c:when test="${empty sMemberId}"><a href="member_login_register_form"><span>Account</span></a></c:when><c:otherwise><a href="member_profile_form"><span>Account</span></a></c:otherwise></c:choose>
            <ul class="sub-menu">
                <c:choose>
                	<c:when test="${empty sMemberId}">
                		<li><a href="member_login_register_form">로그인 / 회원가입</a></li>
                	</c:when>
                	<c:otherwise>
                		<li><a href="member_login_register_form">회원가입</a></li>
                		<li><a href="member_jumun_list">주문 내역</a></li>
                		<li><a href="member_wishlist_detail">찜 목록</a></li>
                		<li><a href="member_profile_form">회원 정보</a></li>
                		<li><a href="member_address_detail">회원 주소</a></li>
                		<li><a href="member_question_list">질문 내역</a></li>
                	</c:otherwise>
                </c:choose>
            </ul>
          </li>
          <li class="has-megamenu"><a href="#"><span>Mega Menu</span></a>
            <ul class="mega-menu">
              <li><span class="mega-menu-title">Top Categories</span>
                <ul class="sub-menu">
                  <li><a href="#">Men's Shoes</a></li>
                  <li><a href="#">Women's Shoes</a></li>
                  <li><a href="#">Shirts and Tops</a></li>
                  <li><a href="#">Swimwear</a></li>
                  <li><a href="#">Shorts and Pants</a></li>
                  <li><a href="#">Accessories</a></li>
                </ul>
              </li>
              <li><span class="mega-menu-title">Specialty Shops</span>
                <ul class="sub-menu">
                  <li><a href="#">Junior's Shop</a></li>
                  <li><a href="#">Swim Shop</a></li>
                  <li><a href="#">Athletic Shop</a></li>
                  <li><a href="#">Outdoor Shop</a></li>
                  <li><a href="#">Luxury Shop</a></li>
                  <li><a href="#">Accessories Shop</a></li>
                </ul>
              </li>
              <li>
                <section class="promo-box" style="background-image: url(img/banners/02.jpg);"><span class="overlay-dark" style="opacity: .4;"></span>
                  <div class="promo-box-content text-center padding-top-2x padding-bottom-2x">
                    <h4 class="text-light text-thin text-shadow">New Collection of</h4>
                    <h3 class="text-bold text-light text-shadow">Sunglasses</h3><a class="btn btn-sm btn-primary" href="#">Shop Now</a>
                  </div>
                </section>
              </li>
              <li>
                <section class="promo-box" style="background-image: url(img/banners/03.jpg);">
                  <!-- Choose between .overlay-dark (#000) or .overlay-light (#fff) with default opacity of 50%. You can overrride default color and opacity values via 'style' attribute.--><span class="overlay-dark" style="opacity: .45;"></span>
                  <div class="promo-box-content text-center padding-top-2x padding-bottom-2x">
                    <h3 class="text-bold text-light text-shadow">Limited Offer</h3>
                    <h4 class="text-light text-thin text-shadow">save up to 50%!</h4><a class="btn btn-sm btn-primary" href="#">Learn More</a>
                  </div>
                </section>
              </li>
            </ul>
          </li>
          
          
          <li><a href="#"><span>Pages</span></a>
            <ul class="sub-menu">
                <li><a href="about">About Us</a></li>
                <li><a href="contacts">Contacts</a></li>
                <li><a href="faq">Help / FAQ</a></li>
            </ul>
          </li>
          
        </ul>
      </nav>
      <!-- Toolbar-->
      <div class="toolbar">
        <div class="inner">
          <div class="tools">
            <div class="search"><i class="icon-search"></i></div>
            <div class="account"><c:choose><c:when test="${empty sMemberId}"><a href="member_login_register_form"></a></c:when><c:otherwise><a href="member_profile_form"></a></c:otherwise></c:choose><i class="icon-head"></i>
              <ul class="toolbar-dropdown">
              	<c:choose>
              		<c:when test="${empty sMemberId}">
              			<li><a href="member_login_register_form">로그인 / 회원가입</a></li>
              		</c:when>
              		<c:otherwise>
		                <li class="sub-menu-user">
		                  <div class="user-info">
		                    <h6 class="user-name">${loginMember.member_name}</h6><span class="text-xs text-muted"></span>
		                  </div>
		                </li>
		                  <li><a href="member_profile_form">회원 정보</a></li>
		                  <li><a href="member_jumun_list">주문 내역</a></li>
		                  <li><a href="member_wishlist_detail">찜 목록</a></li>
		                <li class="sub-menu-separator"></li>
		                <li><a href="member_logout_action"> <i class="icon-unlock"></i>Logout</a></li>
		            </c:otherwise>
              </c:choose>
              </ul>
            </div>
            <c:choose><c:when test="${empty sMemberId}"><a href="member_login_register_form"></a></c:when>
            <c:otherwise>
            <div class="cart"><a href="cart_list"></a><i class="icon-bag"></i><span class="count"></span><span class="subtotal" id="subtotal">${cart_subtotal}</span>
              <div class="toolbar-dropdown" id = "cart_drop_down">
              <c:forEach items="${cartList}" 
							var="cart"  
							begin="0"  
							step="1" 
							end="${cartList.size()}"
							varStatus="status">
                <div class="dropdown-product-item"><span class="dropdown-product-remove"><i class="icon-cross"></i></span><a class="dropdown-product-thumb" href="shop_product_detail?product_no=${cart.product_no}"><img src="IMAGE/${cart.product_image_1}" alt="Product"></a>
                  <div class="dropdown-product-info"><a class="dropdown-product-title" href="shop_product_detail?product_no=${cart.product_no}">${cart.product_name}</a><span id="cart_qty_tot_price" class="dropdown-product-details">${cart.cart_qty} x ${cart.cart_tot_price}</span></div>
                </div>
             </c:forEach>
                <div class="toolbar-dropdown-group">
                  <div class="column"><span class="text-lg">Total:</span></div>
                  <div class="column text-right"><span class="text-lg text-medium" id=subtotal_dropdown>${cart_subtotal} &nbsp;</span></div>
                </div>
                <div class="toolbar-dropdown-group">
                  <div class="column"><a class="btn btn-sm btn-block btn-secondary" href="cart_list">장바구니</a></div>
                  <div class="column"><a class="btn btn-sm btn-block btn-success" href="jumun_address_form">결제</a></div>
                </div>
              </div>
            </div>
            </c:otherwise>
            </c:choose>
          </div>
        </div>
      </div>
    </header>