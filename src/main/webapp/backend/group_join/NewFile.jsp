<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.group_join.model.*"%>
<jsp:useBean id="group_buySvc" scope="page" class="com.group_buy.model.Group_BuyService" />
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"
	integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
	crossorigin="anonymous"></script>
<title>員工資料修改</title>
<style type="text/css">
/*fonts*/
@import url(https://fonts.googleapis.com/css?family=PT+Sans:400,400italic);

@import url(https://fonts.googleapis.com/css?family=Droid+Serif);

/* html, body{ */
/*   background:#2F1E27; */
/* } */

body{
  counter-reset:section;
  text-align:center;
}

.container{
  position:relative;
  top:100px;
}

.container h1, .container span{
  font-family:"Pt Sans", helvetica, sans-serif;
}

.container h1{
  text-align:center;
  color:#fff;
  font-weight:100;
  font-size:2em; 
  margin-bottom:10px;
}

.container h2{
  font-family:"droid serif";
  font-style:italic;
  color:#d3b6ca; 
  text-align:center;
  font-size:1.2em;
}

.container form span:before {
  counter-increment:section;
  content:counter(section);
  border:2px solid #4c2639;
  width:40px;
  height:40px;
  color:#fff;
  display:inline-block;
  border-radius:50%;
  line-height:1.6em;
  font-size:1.5em;
  position:relative;
  left:-22px;
  top:-11px;
  background:#2F1E27;
}

form{
  margin-top:25px;
  display:inline-block;
}

.fields{
  border-left:2px solid #4c2639
}

.container span{
    margin-bottom:22px; 
    display:inline-block;
}

.container span:last-child{
   margin-bottom:-11px;
}

input{
  border:none;
  outline:none;
  display:inline-block;
  height:34px;
  vertical-align:middle;
  position:relative;
  bottom:14px;
  right:9px;
  border-radius:22px;
  width:220px;
  box-sizing:border-box;
  padding:0 18px; 
}

input[type="button"]{ 
  background:rgba(197,62,126,.33) ! important;
  color:#fff;
  position:relative;
  left:9px;
  top:25px; 
  width:100px;
  cursor:pointer;
}
</style>
</head>
<body>

<<article class="l-design-widht">
  <h1>Mini CSS-vars Design System</h1>

  <p>Most of the projects I work on have about <mark>3</mark> important colors: Main- , Accent-  and Background-Color. Naturally tons of other colors are used in a typical Project, but they are mostly used within specific components.</p>
  
  <p>I find it useful to set those 3 colors as vars on the root and change them in specific contexts. It turns out that the complexity of the components I build is dramatically cut down by this. And also gives me a lot of control over the cascade.</p>
  
  <div class="card">
    <h2><svg class="icon" aria-hidden="true">
      <use xlink:href="#icon-coffee" href="#icon-coffee" /></svg>Regular</h2>
    <label class="input">
      <input class="input__field" type="text" placeholder=" " />
      <span class="input__label">Some Fancy Label</span>
    </label>
    <div class="button-group">
      <button>Send</button>
      <button type="reset">Reset</button>
    </div>
  </div>
  <div class="card card--inverted">
    <h2> <svg class="icon" aria-hidden="true">
      <use xlink:href="#icon-coffee" href="#icon-coffee" />
    </svg>Inverted</h2>
    <label class="input">
      <input class="input__field" type="text" placeholder=" " value="Valuable value" />
      <span class="input__label">Some Fancy Label</span>
    </label>
   
    <div class="button-group">
      <button>Send</button>
      <button type="reset">Reset</button>
    </div>
  </div>
    <div class="card card--accent">
    <h2><svg class="icon" aria-hidden="true">
      <use xlink:href="#icon-coffee" href="#icon-coffee" />
    </svg>Accent</h2>
    <label class="input">
      <input class="input__field" type="text" placeholder=" " />
      <span class="input__label">Some Fancy Label</span>
    </label>
    
    <div class="button-group">
      <button>Send</button>
      <button type="reset">Reset</button>
    </div>
  </div>
  
    <div class="card card--inverted">
    <h2>Colors</h2>
    <p>Play around with the colors</p>
    <input type="color" data-color="light" value="#ffffff" />
    <input type="color" data-color="dark" value="#212121" />
    <input type="color" data-color="signal" value="#fab700" />
  </div>
</article>

<svg xmlns="http://www.w3.org/2000/svg" class="hidden">
  <symbol id="icon-coffee" viewBox="0 0 20 20">
    <title>icon-coffee</title>
    <path fill="currentColor" d="M15,17H14V9h3a3,3,0,0,1,3,3h0A5,5,0,0,1,15,17Zm1-6v3.83A3,3,0,0,0,18,12a1,1,0,0,0-1-1Z"/>
    <rect fill="currentColor" x="1" y="7" width="15" height="12" rx="3" ry="3"/>
    <path fill="var(--color-accent)" d="M7.07,5.42a5.45,5.45,0,0,1,0-4.85,1,1,0,0,1,1.79.89,3.44,3.44,0,0,0,0,3.06,1,1,0,0,1-1.79.89Z"/>
    <path fill="var(--color-accent)" d="M3.07,5.42a5.45,5.45,0,0,1,0-4.85,1,1,0,0,1,1.79.89,3.44,3.44,0,0,0,0,3.06,1,1,0,1,1-1.79.89Z"/>
    <path fill="var(--color-accent)" d="M11.07,5.42a5.45,5.45,0,0,1,0-4.85,1,1,0,0,1,1.79.89,3.44,3.44,0,0,0,0,3.06,1,1,0,1,1-1.79.89Z"/>
  </symbol>
</svg>
</body>
</html>