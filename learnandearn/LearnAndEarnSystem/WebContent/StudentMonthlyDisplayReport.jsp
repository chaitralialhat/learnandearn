<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
    <%@page import="java.util.Calendar" %>
     <%@page import="java.util.Enumeration" %>
       <%@page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Customer Dashboard</title>
   <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <style>
.merchant-footer,.merchant-header .mer-header{font-family:"Helvetica Neue",Helvetica,Arial,sans-serif}
.merchant-header .mer-header .hide,.merchant-header .mer-header .mer-wrapper #mer-hamburger-bttn,.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-primary-nav .nav-arrow-xs,.merchant-header .mer-header .mer-wrapper .visible-xs{display:none}.merchant-header .rtl,.rtl{direction:rtl}.icon,.merchant-footer,.merchant-header .mer-header{-webkit-font-smoothing:antialiased;-moz-osx-font-smoothing:grayscale}.mer-header-sprite{background:url(https://www.paypalobjects.com/webstatic/i/ex_me2/sprite/sprite_headerfooter-1x_122.png) no-repeat}.merchant-header{min-height:77px}@media print{.merchant-header{display:none}}.merchant-header .mer-header{background-color:#fff;border-top:1px solid #fff;box-shadow:0 1px 5px 2px rgba(0,0,0,.15);height:auto;min-height:75px;line-height:1.5em;padding-left:15px;padding-right:15px;position:fixed;top:0;width:100%;z-index:1001}.merchant-header .mer-header .mer-wrapper *,.merchant-header .mer-header .mer-wrapper :after,.merchant-header .mer-header .mer-wrapper :before{box-sizing:border-box}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper{margin:0 auto;max-width:1170px}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper a{color:#0079c1;text-decoration:none}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper a:hover{text-decoration:underline}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper a.skip{background:0 0;font-size:12px;left:0;padding:.5em;position:absolute;top:-999em}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper a.skip:focus{background:#eee;left:0;top:0}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-logo{float:left;margin:10px 0px 0 0}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-primary-nav{list-style:none;margin:0}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-primary-nav li{float:left;line-height:75px;list-style:none;margin:0;padding:0}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-primary-nav li a{color:#2c2e2f;display:block;font-size:15px;padding:0 14px;text-decoration:none}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-primary-nav li a.selected,.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-primary-nav li a:focus,.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-primary-nav li a:hover{color:#0079ad;text-decoration:none}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-primary-nav li.mer-more-menu{position:relative;border-left:1px solid #fff;border-right:1px solid #fff}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-primary-nav li.mer-more-menu a{padding:0 5px 0 17px;position:relative;z-index:4}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-primary-nav li.mer-more-menu a .moreIcon{display:inline;vertical-align:sub;margin-left:6px;font-size:24px}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-primary-nav li.mer-more-menu a.moreLink{left:0}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-primary-nav li.mer-more-menu.open,.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-primary-nav li.mer-more-menu:focus,.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-primary-nav li.mer-more-menu:hover{border-left:1px solid #d6d6d6;border-right:1px solid #d6d6d6;height:60px}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-primary-nav li.mer-more-menu.open a.moreLink,.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-primary-nav li.mer-more-menu:focus a.moreLink,.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-primary-nav li.mer-more-menu:hover a.moreLink{background:#fff}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-primary-nav li.mer-more-menu.open ul,.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-primary-nav li.mer-more-menu:focus ul,.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-primary-nav li.mer-more-menu:hover ul{display:block}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-primary-nav li.mer-more-menu.open ul li a,.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-primary-nav li.mer-more-menu:focus ul li a,.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-primary-nav li.mer-more-menu:hover ul li a{left:0;background:0 0}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-primary-nav li.mer-more-menu ul{background:#fff;border:1px solid #d6d6d6;border-radius:0 5px 5px;box-shadow:0 1px 2px #ccc;display:none;left:-1px;list-style:none;margin:0;padding:0 0 5px;position:absolute;top:60px;z-index:3;white-space:nowrap}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-primary-nav li.mer-more-menu ul li{background:0 0;line-height:40px;min-width:160px;width:100%}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-primary-nav li.mer-more-menu ul li.RU{min-width:190px}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-primary-nav li.mer-more-menu ul li a{border-top:1px solid #ddd;font-weight:400;font-size:15px;line-height:18px;margin:0 10px;padding:12px 6px}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-primary-nav li.mer-more-menu ul .first-element,.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-primary-nav li.mer-more-menu ul li:first-child a{border-top:none}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-primary-nav li.mer-more-menu ul li a:focus,.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-primary-nav li.mer-more-menu ul li a:hover{color:#0079ad}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-primary-nav li.mer-more-menu ul .more_tools{font-weight:700}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-primary-nav li .tools-menu .moreLink .icon-arrow-right-half-small,.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-primary-nav li.mer-more-menu .mer-hide-nav-link{display:none}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-primary-nav li .tools_menu_loading{background:url(https://www.paypalobjects.com/webstatic/i/ex_ce2/icon/icon_loadingGraphic_42x42_2011_10_24.gif) center center no-repeat;display:block;height:50px;margin:30px 0 35px}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder{float:right;margin:22px 0 10px;position:relative}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-notification-icon,.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-nav-icon{background:url(https://www.paypalobjects.com/webstatic/i/ex_me2/sprite/sprite_headerfooter-1x_122.png) no-repeat;color:#2c2e2f;background-color:#e1e7eb;background-position:6px -3395px;float:left;position:relative;border-radius:50%;display:inline-block;margin:0;height:28px;width:28px;text-decoration:none}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-notification-icon:focus,.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-notification-icon:hover,.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-nav-icon:focus,.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-nav-icon:hover{color:#2c2e2f;background-color:#edf2f5}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-hide-nav-link{display:none}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-notification-count{background-color:#c72e2e;background-repeat:no-repeat;border-radius:10px;color:#fff;font-size:9px;font-weight:700;line-height:14px;min-width:15px;height:15px;width:15px;position:absolute;text-align:center;top:-6px;left:19px}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings a{text-align:left}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-nav-icon{background-position:5px -3588px}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-icon-label{color:#2c2e2f;vertical-align:10px;margin-left:36px;margin-top:4px;text-decoration:none;font-size:15px;white-space:nowrap}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-icon-label:focus,.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-icon-label:hover{text-decoration:none}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .popover{background:0 0;border:none;box-shadow:none;display:block;left:auto;position:absolute;right:-10px;top:37px;width:300px;max-width:276px;z-index:1010}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .popover-content:before{border-bottom:11px solid #888;border-left:10px solid transparent;border-right:10px solid transparent;content:"";display:inline-block;height:0;position:absolute;right:14px;top:-9px;width:0}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-notification-wrapper .mer-notifications-box,.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-wrapper .mer-settings-box{display:none}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .popover-content{background-clip:padding-box;background-color:#888;border-radius:5px;border-top:0 none;box-shadow:0 4px 20px #999;color:#fff;min-width:230px;padding:0 0 2px;position:relative}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .popover-head{border-radius:10px;height:100%;min-height:6px;padding-top:4px;text-align:center}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .popover-head h2{color:#fff;font-size:18px;line-height:20px;margin:5px auto 10px;width:75%}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .popover-head .mer-close-notifications,.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .popover-head .mer-close-settings{background:url(https://www.paypalobjects.com/webstatic/i/ex_me2/sprite/sprite_headerfooter-1x_122.png) no-repeat;background-position:15px -392px;height:30px;padding:7px;position:absolute;right:0;top:5px;width:45px;z-index:3}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .popover-head .mer-close-notifications:focus,.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .popover-head .mer-close-notifications:hover,.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .popover-head .mer-close-settings:focus,.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .popover-head .mer-close-settings:hover{background-position:-316px -392px}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .popover-body{background-color:#fff;border:1px solid #ddd;border-radius:4px;color:#999;margin:0 6px 5px;max-height:340px;overflow:auto;padding:0 5px}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-notification-wrapper{float:left;position:relative;margin-right:23px}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-notification-wrapper ul.mer-notification-links{background-color:#fff;list-style:none;margin:0;padding:0;min-height:50px}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-notification-wrapper ul.mer-notification-links li{border-bottom:1px solid #ddd;margin:0 5px;position:relative}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-notification-wrapper ul.mer-notification-links li .notification-text{display:block;margin:0 0 0 26px}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-notification-wrapper ul.mer-notification-links li:last-child{border-bottom:none}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-notification-wrapper ul.mer-notification-links .mer-alert-item{color:#2c2e2f;display:block;font-size:13px;line-height:20px;padding:14px 0}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-notification-wrapper ul.mer-notification-links .mer-no-alerts{color:#2c2e2f;font-size:13px;padding:12px 0;text-align:center}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-notification-wrapper ul.mer-notification-links .alert-restriction{background:url(https://www.paypalobjects.com/webstatic/i/ex_me2/sprite/sprite_headerfooter-1x_122.png) no-repeat;background-position:left -797px;float:left;height:30px;width:18px}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-notification-wrapper ul.mer-notification-links .alert-warning{background:0 0}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-notification-wrapper ul.mer-notification-links .close-notification-box,.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-notification-wrapper ul.mer-notification-links .mer-dismiss{background:url(https://www.paypalobjects.com/webstatic/i/ex_me2/sprite/sprite_headerfooter-1x_122.png) no-repeat;background-position:10px -392px;color:transparent;height:30px;opacity:.6;padding:7px;position:absolute;right:-10px;top:9px;width:30px;z-index:3}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-notification-wrapper ul.mer-notification-links .close-notification-box:focus,.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-notification-wrapper ul.mer-notification-links .close-notification-box:hover{background-position:right -387px;right:17px}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-notification-wrapper ul.mer-notification-links .mer-dismiss:focus,.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-notification-wrapper ul.mer-notification-links .mer-dismiss:hover{opacity:1}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-wrapper{float:left;position:relative}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-wrapper .mer-open-pop-over-bttn:focus,.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-wrapper .mer-open-pop-over-bttn:hover{text-decoration:none}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-wrapper .popover{left:-238px}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-wrapper .mer-settings-box.popover .popover-body{background-color:#f1f1f1;padding:0;max-height:375px}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-wrapper .mer-todos-top-count{background-color:#c72e2e;background-repeat:no-repeat;border-radius:10px;color:#fff;font-size:9px;font-weight:700;line-height:14px;min-width:15px;height:15px;width:15px;position:absolute;text-align:center;top:-6px;left:19px}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-wrapper h2 a{color:#fff;font-size:18px;text-decoration:none}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-wrapper h3{color:#686868;font-size:14px;font-weight:700;line-height:20px;margin:5px}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-wrapper h3 .mer-todos-count{background-color:#999;border-radius:10px;color:#fff;font-size:12px;padding-left:4px;padding-right:4px}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-wrapper .mer-merchant-info{color:#424242;margin:8px 15px}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-wrapper .mer-merchant-info h3.mer-user-info{font-size:16px;margin:0 0 5px}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-wrapper .mer-merchant-info h3.mer-user-info a{font-size:16px}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-wrapper .mer-merchant-info .mer-business-info{font-size:13px}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-wrapper .mer-merchant-info .mer-business-info .mer-business-label{display:inline-block;margin-right:8px}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-wrapper .mer-merchant-info .mer-business-info a{display:inline-block;font-size:13px}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-wrapper .mer-top-nav-links{background-color:#fff;list-style:none;margin:0;padding:0}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-wrapper .mer-top-nav-links li{border-bottom:1px solid #ddd;padding:12px 5px 8px;margin:0 10px;overflow:auto;position:relative}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-wrapper .mer-top-nav-links li .mer-icon{background:url(https://www.paypalobjects.com/webstatic/i/ex_me2/sprite/sprite_headerfooter-1x_122.png) no-repeat;float:left;height:28px;margin:0 12px 0 0;width:26px}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-wrapper .mer-top-nav-links li a{display:list-item;font-size:14px;font-weight:400;margin:0 5px}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-wrapper .mer-top-nav-links li .mer-onetouch{background:0 0;padding-bottom:5px;text-align:center}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-wrapper .mer-top-nav-links li:last-child{text-align:center;border-bottom:none}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-wrapper .mer-top-nav-links li.mer-businiess-setup .mer-icon{background-position:0 -2198px}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-wrapper .mer-top-nav-links li.mer-settings .mer-icon{background-position:0 -2400px}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-wrapper .todo-heading{text-align:center}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-wrapper .mer-sub-menu-wrapper{max-height:170px}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-wrapper .mer-sub-menu-wrapper .mer-todos-list{background-color:#fff;list-style:none;margin:0;padding:0}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-wrapper .mer-sub-menu-wrapper .mer-todos-list li{border-bottom:1px solid #ddd;padding:10px;margin:0 10px}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-wrapper .mer-sub-menu-wrapper .mer-todos-list li a{color:#0079ad;display:list-item;font-size:14px}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-wrapper .mer-sub-menu-wrapper .mer-todos-list li:last-child{border-bottom:none}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-logout-wrapper{float:right;margin:-3px 0 0 18px}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-logout-wrapper .button,.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-logout-wrapper .mer-logout-button{color:#2c2e2f;background-color:#e1e7eb;border-radius:5px;display:inline-block;font-size:15px;line-height:18px;min-height:28px;padding:8px 12px;text-decoration:none}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-logout-wrapper .button:focus,.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-logout-wrapper .button:hover,.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-logout-wrapper .mer-logout-button:focus,.merchant-header .mer-header .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-logout-wrapper .mer-logout-button:hover{color:#2c2e2f;background-color:#edf2f5}@media only screen and (min-width:992px){.merchant-header .mer-header .mer-wrapper .visible-sm{display:none}.merchant-header .mer-header .mer-wrapper .hidden-sm,.merchant-header .mer-header .mer-wrapper .hidden-xs{display:block}}@media only screen and (max-width:991px) and (min-width:768px){.merchant-header .mer-header .mer-wrapper .visible-sm{display:block}.merchant-header .mer-header .mer-wrapper .hidden-sm{display:none}.merchant-header .mer-header .mer-wrapper #mer-nav-menu li.mer-more-menu ul li .mid-element-xs{border-top:1px solid #ddd}}@media only screen and (max-width:768px){.merchant-header .mer-header .mer-wrapper .hovered{color:#0077C1}.merchant-header .mer-header .mer-wrapper .content-overlay{background-color:#fff;pointer-events:none;opacity:.2}.merchant-header .mer-header .mer-wrapper .disable-select{-webkit-touch-callout:none;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none}}@media only screen and (max-width:568px),(max-width:768px){.merchant-header .mer-header .mer-wrapper .hidden-xs,.merchant-header .mer-header .mer-wrapper .visible-sm{display:none!important}.merchant-header .mer-header .mer-wrapper .mer-content-wrapper{min-width:320px}.merchant-header .mer-header .mer-wrapper .mer-logo{width:32px;height:32px;background:url(https://www.paypalobjects.com/webstatic/i/ex_me2/icon/pp_mark.png) no-repeat}.merchant-header .mer-header .mer-wrapper .mer-logo img{display:none}.merchant-header .mer-header .mer-wrapper #mer-nav-menu{background-color:#fff;box-shadow:0 3px 6px rgba(0,0,0,.5);display:none}.merchant-header .mer-header .mer-wrapper #mer-nav-menu.expanded{position:absolute;width:96%;top:75px;z-index:-1;padding-top:10px}.merchant-header .mer-header .mer-wrapper #mer-nav-menu .mer-primary-nav{margin:0;display:table;border-collapse:collapse;width:100%}.merchant-header .mer-header .mer-wrapper #mer-nav-menu .mer-primary-nav .nav-arrow-xs{display:block;float:right;font-size:25px;margin-top:18px;padding-right:40px}.merchant-header .mer-header .mer-wrapper #mer-nav-menu .mer-primary-nav .moreIcon,.merchant-header .mer-header .mer-wrapper #mer-nav-menu .mer-primary-nav li.mer-more-menu .mer-divider,.merchant-header .mer-header .mer-wrapper #mer-nav-menu .mer-primary-nav li.mer-more-menu>a{display:none}.merchant-header .mer-header .mer-wrapper #mer-nav-menu .mer-primary-nav li{border-bottom:1px solid #ddd;background:0 0;float:none;font-weight:400;font-size:13px;line-height:40px}.merchant-header .mer-header .mer-wrapper #mer-nav-menu .mer-primary-nav a{font-weight:400;font-size:13px}.merchant-header .mer-header .mer-wrapper #mer-nav-menu .mer-primary-nav .logout-xs{border-bottom:none}.merchant-header .mer-header .mer-wrapper #mer-nav-menu .mer-primary-nav .logout-xs a{background:0 0;text-align:center}.merchant-header .mer-header .mer-wrapper #mer-nav-menu .mer-primary-nav li.mer-more-menu{position:relative;border:none}.merchant-header .mer-header .mer-wrapper #mer-nav-menu .mer-primary-nav li.mer-more-menu a{padding:11px 3px}.merchant-header .mer-header .mer-wrapper #mer-nav-menu .mer-primary-nav li.mer-more-menu ul{box-shadow:none;border:none;border-bottom:1px solid #D6D6D6;position:static;display:table;width:100%;margin:0;float:left;list-style-type:none}.merchant-header .mer-header .mer-wrapper #mer-nav-menu .mer-primary-nav li.mer-more-menu ul li{line-height:40px;max-width:inherit}.merchant-header .mer-header .mer-wrapper #mer-nav-menu .mer-primary-nav li.mer-more-menu ul li a{border:none;padding:11px 7px}.merchant-header .mer-header .mer-wrapper #mer-nav-menu .mer-primary-nav li.mer-more-menu .visible-xs{display:block!important}.merchant-header .mer-header .mer-wrapper #mer-nav-menu .mer-primary-nav li.tools-menu .moreLink .icon-arrow-right-half-small{display:block}.merchant-header .mer-header .mer-wrapper #mer-nav-menu .mer-primary-nav li.tools-menu ul{border:none}.merchant-header .mer-header .mer-wrapper #mer-nav-menu .mer-primary-nav li.tools-menu ul li{padding-left:25px}.merchant-header .mer-header .mer-wrapper #mer-nav-menu .mer-primary-nav li.tools-menu ul li:last-child{display:none}.merchant-header .mer-header .mer-wrapper #mer-nav-menu .mer-primary-nav li.tools-menu>a{border-bottom:1px solid #ddd;display:block;padding:0 0 0 20px}.merchant-header .mer-header .mer-wrapper #mer-hamburger-bttn{background:0 0;border:none;box-shadow:none;color:#999;font-size:20px;display:inline-block;height:27px;width:40px}}.merchant-header .rtl .mer-wrapper .mer-content-wrapper .mer-logo,.merchant-header .rtl .mer-wrapper .mer-content-wrapper .mer-primary-nav li{float:right}@media only screen and (max-width:568px){.merchant-header .mer-header .mer-wrapper .mer-global-links-holder .mer-notification-wrapper .popover-content:before{right:89px}.merchant-header .mer-header .mer-wrapper .mer-global-links-holder .mer-notification-wrapper .popover-content{left:80px}.merchant-header .mer-header .mer-wrapper .mer-global-links-holder .mer-notification-wrapper .popover-body{max-height:190px}.merchant-header .mer-header .mer-wrapper .mer-global-links-holder .mer-settings-wrapper .popover-content:before{right:42px}.merchant-header .mer-header .mer-wrapper .mer-global-links-holder .mer-settings-wrapper .popover-content{left:32px}.merchant-header .mer-header .mer-wrapper .mer-global-links-holder #mer-hamburger-bttn{margin-right:20px}}.merchant-header .rtl .mer-wrapper .mer-content-wrapper .mer-primary-nav{float:right;padding-right:15px}.merchant-header .rtl .mer-wrapper .mer-content-wrapper .mer-primary-nav li.mer-more-menu ul{left:auto;right:-1px;top:57px}.merchant-header .rtl .mer-wrapper .mer-content-wrapper .mer-primary-nav li.mer-more-menu a.moreLink{left:auto;right:0}.merchant-header .rtl .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-notification-wrapper .mer-notification-count,.merchant-header .rtl .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-wrapper .mer-todos-top-count{right:19px}.merchant-header .rtl .mer-wrapper .mer-content-wrapper .mer-primary-nav li.mer-more-menu a .moreIcon{margin:37px 5px 0 0}.merchant-header .rtl .mer-wrapper .mer-content-wrapper .mer-global-links-holder{float:left}.merchant-header .rtl .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-notification-wrapper{float:right}.merchant-header .rtl .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-icon-label{margin-left:0;margin-right:36px}.merchant-header .rtl .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-wrapper{float:right;margin:0 18px}.merchant-header .rtl .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-wrapper .mer-settings-nav-icon{float:right;margin-left:5px}.merchant-header .rtl .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-wrapper .mer-settings a{text-align:right}.merchant-header .rtl .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-wrapper .mer-merchant-info .mer-business-info .mer-business-label{margin:0 0 0 8px}.merchant-header .rtl .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-wrapper .popover-content::before,.merchant-header .rtl .mer-wrapper .mer-content-wrapper .mer-global-links-holder .popover-content::before{left:14px;right:auto}.merchant-header .rtl .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-wrapper .popover,.merchant-header .rtl .mer-wrapper .mer-content-wrapper .mer-global-links-holder .popover{left:-10px;right:auto;text-align:right}.merchant-header .rtl .mer-wrapper .mer-content-wrapper .mer-global-links-holder .mer-settings-wrapper .popover{left:35px}.merchant-header .rtl .mer-wrapper .mer-content-wrapper .mer-global-links-holder .popover-head .mer-close-notifications,.merchant-header .rtl .mer-wrapper .mer-content-wrapper .mer-global-links-holder .popover-head .mer-close-settings{left:0;right:auto}.merchant-header .rtl .mer-wrapper .mer-content-wrapper .mer-global-links-holder .popover-body ul.mer-notification-links li .alert-restriction{float:right}.merchant-header .rtl .mer-wrapper .mer-content-wrapper .mer-global-links-holder .popover-body ul.mer-notification-links li .notification-text{margin:0 26px 0 0}.merchant-header .rtl .mer-wrapper .mer-content-wrapper .mer-global-links-holder .popover-body ul.mer-notification-links li .mer-dismiss{left:-10px;right:auto}.merchant-header .rtl .mer-wrapper .mer-content-wrapper .mer-global-links-holder .popover-body .mer-top-nav-links li .mer-icon{float:right;margin:0 0 0 12px}@media only screen and (max-width:568px),(max-width:768px){.merchant-header .rtl .mer-wrapper #mer-nav-menu{right:0}.merchant-header .rtl .mer-wrapper #mer-nav-menu .mer-primary-nav .nav-arrow-xs{float:left;padding-left:30px}.merchant-header .rtl .mer-wrapper #mer-nav-menu .mer-primary-nav li.tools-menu .nav-arrow-xs{padding-left:0}.merchant-header .rtl .mer-wrapper #mer-nav-menu .mer-primary-nav li.tools-menu ul li a{padding-right:20px}.merchant-header .rtl .mer-wrapper #mer-nav-menu li.tools-menu>a{padding-right:12px}}@media only screen and (max-width:568px){.merchant-header .rtl .mer-wrapper .mer-content-wrapper .mer-logo{margin-right:10px}.merchant-header .rtl .mer-wrapper .mer-global-links-holder #mer-hamburger-bttn{margin-right:0}.merchant-header .rtl .mer-wrapper .mer-global-links-holder .mer-settings-wrapper{margin:0 18px 0 0}.merchant-header .rtl .mer-wrapper .mer-global-links-holder .mer-settings-wrapper .popover-content::before,.merchant-header .rtl .mer-wrapper .mer-global-links-holder .popover-content::before{left:53px;right:auto}.merchant-header .rtl .mer-wrapper .mer-global-links-holder .mer-settings-wrapper .popover,.merchant-header .rtl .mer-wrapper .mer-global-links-holder .popover{left:-85px;right:auto}}.merchant-footer{background:#fff;border-top:1px solid #eaeced;color:#6c7378;font-size:14px;overflow:auto;padding:20px 0}@media print{.merchant-footer{display:none}}.merchant-footer footer{text-align:justify}.merchant-footer .mer-nav-wrapper{float:left;margin-bottom:12px}.merchant-footer .mer-legal-nav-wrapper{float:right;text-align:right;width:65%}.merchant-footer .mer-footer{margin:0 auto;padding-left:15px;padding-right:15px;max-width:1200px}.merchant-footer .mer-footer .mer-hide-nav-link{display:none}.merchant-footer .mer-footer ul{clear:both;display:block;padding:0;margin:0}.merchant-footer .mer-footer ul li{display:inline-block;list-style-type:none;margin:0 10px 0 0;vertical-align:middle}.merchant-footer .mer-footer ul li a{color:#2c2e2f;font-size:12px;text-shadow:1px 1px #fff;text-decoration:none}.merchant-footer .mer-footer ul li a:active,.merchant-footer .mer-footer ul li a:focus,.merchant-footer .mer-footer ul li a:hover{color:#444;text-decoration:underline}.merchant-footer .mer-footer ul li.mer-copyright{font-size:9px;margin-top:4px}.merchant-footer .mer-footer .mer-nav-main{font-weight:700}.merchant-footer .mer-footer .mer-lang-toggle{display:none;text-align:right}.merchant-footer .mer-footer .mer-lang-toggle li{border-left:1px solid #eaeced;line-height:normal;margin:0 0 0 5px}.merchant-footer .mer-footer .mer-lang-toggle li:first-child{border-left:none}.merchant-footer .mer-footer .mer-lang-toggle li a{line-height:15px;padding-left:5px}.merchant-footer .mer-footer .mer-lang-toggle li a.selected{color:#0079c1}.merchant-footer .mer-footer .mer-nav-tertiary li{margin:0 0 0 10px}.merchant-footer .mer-footer .mer-nav-tertiary li a{color:#6c7378;font-size:9px}.merchant-footer .mer-footer .mer-legal-notes{border-top:1px solid #eaeced;clear:both;color:#777;font-size:11px;line-height:1.5em;padding:15px 200px;text-align:center}.merchant-footer .mer-footer #mer-risk-beacon{clear:both;display:none}.rtl .mer-nav-wrapper{float:right}.rtl .mer-legal-nav-wrapper{float:left}.rtl .mer-footer .mer-nav-main li:first-child,.rtl .mer-footer .mer-nav-secondary li:first-child{margin-right:0}.rtl .mer-footer .mer-lang-toggle,.rtl .mer-footer .mer-nav-tertiary{text-align:left}.rtl .mer-footer .mer-lang-toggle li:last-child,.rtl .mer-footer .mer-nav-tertiary li:last-child{border-left:medium none;margin-left:0}.rtl .mer-footer .mer-lang-toggle li:last-child a,.rtl .mer-footer .mer-nav-tertiary li:last-child a{padding-left:0}.rtl .mer-footer .mer-lang-toggle li:first-child{border-left:1px solid #eaeced}@media (max-width:768px){.merchant-footer .mer-footer{min-width:94%}.merchant-footer .mer-footer .mer-legal-nav-wrapper,.merchant-footer .mer-footer .mer-nav-wrapper{float:none;text-align:center}.merchant-footer .mer-footer .mer-legal-nav-wrapper{width:100%}.merchant-footer .mer-footer .mer-lang-toggle,.merchant-footer .mer-footer .mer-nav-main,.merchant-footer .mer-footer .mer-nav-secondary,.merchant-footer .mer-footer .mer-nav-tertiary{text-align:center}.merchant-footer .mer-footer .mer-lang-toggle{margin-top:20px}.merchant-footer .mer-footer .mer-nav-tertiary{margin:25px 0 0}.merchant-footer .mer-footer .mer-nav-tertiary li{margin:0 18px 12px 0}.merchant-footer .mer-footer ul li.mer-copyright{display:block;margin:0}.merchant-footer .mer-footer ul li:last-child{margin-right:0}.merchant-footer .mer-footer .mer-legal-notes{padding:15px}.rtl .mer-footer ul li:last-child{margin-right:18px}}@font-face{font-family:paypal-icons;src:url(https://www.paypalobjects.com/webstatic/fnt/cweb/paypal-icons_1-0-3/PayPalIcons-Regular.eot);src:url(https://www.paypalobjects.com/webstatic/fnt/cweb/paypal-icons_1-0-3/PayPalIcons-Regular.eot?#iefix) format("embedded-opentype"),url(https://www.paypalobjects.com/webstatic/fnt/cweb/paypal-icons_1-0-3/PayPalIcons-Regular.woff) format("woff"),url(https://www.paypalobjects.com/webstatic/fnt/cweb/paypal-icons_1-0-3/PayPalIcons-Regular.ttf) format("truetype"),url(https://www.paypalobjects.com/webstatic/fnt/cweb/paypal-icons_1-0-3/PayPalIcons-Regular.svg#69ac2c9fc1e0803e59e06e93859bed03) format("svg");font-style:normal;font-weight:400}.icon{font-family:paypal-icons;speak:none;font-style:normal;font-weight:400;font-variant:normal;text-transform:none;line-height:0}.icon-small:before{font-size:1.58rem}.icon-medium:before{font-size:2.6rem}.icon-large:before{font-size:7.8rem}.icon-burger-small:before{content:"\e000"}.icon-close-small:before{content:"\e003"}.icon-arrow-down-small:before{content:"\e005"}.icon-arrow-up-small:before{content:"\e006"}.icon-arrow-left-small:before{content:"\e007"}.icon-arrow-right-small:before{content:"\e008"}.icon-arrow-down-half-small:before{content:"\e009"}.icon-arrow-up-half-small:before{content:"\e010"}.icon-arrow-left-half-small:before{content:"\e011"}.icon-arrow-right-half-small:before{content:"\e012"}.icon-clear-half-small:before{content:"\e013"}.icon-checkmark-small:before{content:"\e014"}.icon-checkmark-small-bold:before{content:"\e015"}.icon-action-arrow-half-small:before{content:"\e016"}.icon-info-small:before{content:"\e019"}.icon-positive-small:before{content:"\e020"}.icon-critical-small:before{content:"\e022"}.icon-info-large:before{content:"\e023"}.icon-positive-large:before{content:"\e024"}.icon-critical-large:before{content:"\e026"}.icon-paypal-select-logo:before{content:"\e027"}.icon-select-logo:before{content:"\e028"}.icon-pp-logo:before{content:"\e029"}.icon-profile-large:before{content:"\e037"}.icon-profile-add-large:before{content:"\e038"}.icon-notification-small:before{content:"\e039"}.icon-settings-small:before{content:"\e040"}.icon-profile-small:before{content:"\e041"}.icon-messages:before{content:"\e528"}.accessAid{position:absolute!important;clip:rect(1px,1px,1px,1px);padding:0!important;border:0!important;height:1px!important;width:1px!important;overflow:hidden}

.notification {
	border-radius: 10px;
	background: linear-gradient(top, #FF3019 0, #CF0404 75%);
	border: 1px solid white;
	box-shadow: 1px 1px 5px rgba(0,0,0,.75);
	box-shadow: 1px 1px 5px rgba(0,0,0,.75);
	display: block;
	background: #FF3019;
	background-repeat: repeat-x;
	background: linear-gradient(top, #FF3019 0, #CF0404 75%);
	position: absolute;
	right: -8px;
	font-size: 9px;
	color: white;
	padding: 3px 4px;
	top:5px;
	line-height: 90%;
	text-shadow: none;
}

.vertical-menu {
    width: 200px;
    height: 550px;
   
}

.vertical-menu a {
    background-color: #eee;
    color: black;
    display: block;
    padding: 12px;
    text-decoration: none;
	
}

.vertical-menu a:hover {
    background-color: #ccc;
}

.vertical-menu a.active {
    background-color: #4CAF50;
    color: white;}
    
    table {
	border: 3px solid #ccc;
}
  </style>
</head>
<body  id="page">
<div class="merchant-header">
		<header style="background-color:black; color:white;" class="mer-header ltr">
		<div class="mer-wrapper">
			<div class="mer-content-wrapper">
				<a href="#" class="skip scTrack:header_skip">skip to main
					content</a>
				<%
            
			String uname=(String)session.getAttribute("username");
			session.setAttribute("username",uname);
			out.print("<align='center'>Welcome  \t"+uname);
			System.out.println(uname);

	
	
%>
				<div class="mer-global-links-holder">
					<div class="mer-notification-wrapper">
						<a data-toggle="modal" role="button" aria-owns="Notifications"
							class="mer-open-pop-over-bttn" href="#"> <span
							class="mer-notification-icon"></span> <span class="notification">1</span>
							<span class="accessAid">Notifications</span></a>
						<div tabindex="-1" aria-labelledby="Notifications" role="dialog"
							class="popover mer-notifications-box show-onload">
							<div class="popover-content">
								<div class="popover-head">
									<h2>Notifications</h2>
									<a tabindex="-1" role="button"
										class="mer-close-notifications mer-close-pop-over-bttn"
										href="#"></a>
								</div>
							</div>
						</div>
					</div>
					<div class="mer-settings-wrapper">
						<a class="mer-open-pop-over-bttn" href="#"> <span
							class="mer-settings-nav-icon"></span><span
							class="mer-todos-top-count mer-hide-nav-link"></span> <span
							class="accessAid">Profile</span><span
							class="mer-settings-icon-label hidden-sm hidden-xs">Profile</span></a>
						<div tabindex="-1" aria-labelledby="Business Profile"
							role="dialog" class="popover mer-settings-box">
							<div class="popover-content">
								<div class="popover-head">
									<h2>
										<a href="#">Business Profile</a>
									</h2>
									<a role="button"
										class="mer-close-settings mer-close-pop-over-bttn" href="#"></a>
								</div>
							</div>
						</div>
					</div>
					<div class="mer-logout-wrapper hidden-xs">
						<a class="mer-logout-button scTrack:header_logout"
							href="LogoutServlet">Log out</a>
					</div>
					<button id="mer-hamburger-bttn" class="icon icon-burger-small"></button>
				</div>
			</div>
		</div>
		</header>
	</div>
	
		<div class="vertical-menu">
	<a href="AdminHome.html">Home</a>
	<a href="StudentDetails.jsp">Search Student Details</a>
	<a href="AllStudentDetails.jsp">All Student Details</a>
	<a href="StudentPaymentDetails.jsp">Student Payment Details</a>
	<a href="StudentMonthlyReport.jsp">Student Monthly Report</a>
	<a href="StudentYearlyReport.jsp">Student Yearly Report</a>
	
	<a href="#">Contact Us</a>
</div>


<% 
		String fname = request.getParameter("firstname");
		System.out.println(fname);
		String lname = request.getParameter("lastname");
		System.out.println(lname);
		
		
		
		
%>

<div style="position:absolute; top:350px; left:380px;">
<table align="center" border="1">
<lable><h5><b><i>All month days time and payment details table</i></b></h5></lable><br>

		<tr>
		</tr>
		<td><b>Student Name</b></td>
		<td><b>Date</b></td>
		<td><b>In Time</b></td>
		<td><b>Out Time</b></td>
		<td><b>Total Hours</b></td>
		<td><b>Total Payment</b></td>
		
		</tr>
		
		<% 
		
			try {
				String username=null;

				Class.forName("com.mysql.jdbc.Driver");

				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentdetailsdb", "root", "root");
				
				Statement statement = con.createStatement();
				String sql1 = ("SELECT username from student where fname = '"+fname+"' and lname = '"+lname+"' ");
				ResultSet resultSet1 = statement.executeQuery(sql1);
				while(resultSet1.next()){
				username = resultSet1.getString("username");
				System.out.println("After Query execution totalhours: "+username);
				}
				
				String sql = ("SELECT *from workingtime where username='"+username+"' and MONTH(date) = MONTH(CURDATE())" );
				ResultSet resultSet = statement.executeQuery(sql);
				while (resultSet.next()) {
					
		%>
		<tr>

			<td><%=resultSet.getString("username")%></td>
			<td><%=resultSet.getString("date")%></td>
			<td><%=resultSet.getString("intime")+ "  hrs."%></td>
			<td><%=resultSet.getString("outtime")+ " hrs."%></td>
			<td><%=resultSet.getString("totalhours")+ " hrs."%></td>
			<td><%=resultSet.getDouble("totalpayment")%></td>
			
			

		</tr>
	
		<%
		
		
			}
				

			 } catch (Exception e) {
				e.printStackTrace();
			} 
		%>
		</table>

</div>


<!-- Monthly payment total table -->

<div style="position:absolute; top:200px; left:380px;">
<table align="center" border="1">
<lable><h5><b><i>The monthly total payment details table</i></b></h5></lable><br>

		<tr>
		</tr>
		<td><b>Student Name</b></td>
		<td><b>month</b></td>
		<td><b>Payment of month</b></td>
		
		</tr>
		
		<% 
		
			try {
				String username=null;
				
				Class.forName("com.mysql.jdbc.Driver");

				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentdetailsdb", "root", "root");
				
				Statement statement = con.createStatement();
				String sql1 = ("SELECT username from student where fname = '"+fname+"' and lname = '"+lname+"' ");
				ResultSet resultSet1 = statement.executeQuery(sql1);
				while(resultSet1.next()){
				username = resultSet1.getString("username");
				System.out.println("After Query execution username: "+username);
				}
				
			
				
				
			
				String sql = ("SELECT *from monthlypayment where username='"+username+"'");
				ResultSet resultSet = statement.executeQuery(sql);
				while (resultSet.next()) {
					
		%>
		 <tr>

			<td><%=resultSet.getString("username")%></td>
			<td><%=resultSet.getString("month")%></td>
			<td><%=resultSet.getString("totalmonthlypayment")%></td>
		
		</tr>
	
		<%
		
		
			}
				

			 } catch (Exception e) {
				e.printStackTrace();
			} 
		%>
		</table>

</div>
<div>
		<img src="large.jpg" style="width: 1400px; height: 200px;">
	</div>
	<footer class="container-fluid text-center">
	<p align="center" background-color="black">Online Earn and Learn
		System</p>
	</footer>
	  </body>


</html>