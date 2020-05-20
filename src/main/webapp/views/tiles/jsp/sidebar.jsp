<%@ page session="true"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<link rel="stylesheet" href="<c:url value='/views/css/sidebar.css'/>">

<style type="text/css" >
</style>

<div class="row" id="body-row">
    <div id="sidebar-container" class="sidebar-expanded d-none d-md-block"><!-- d-* hiddens the Sidebar in smaller devices. Its itens can be kept on the Navbar 'Menu' -->
        <ul class="list-group">
           <%-- <a href="<c:url value="/course/${requestScope.course}/home.html"/>" class="list-group-item list-group-item-action">
                <div class="d-flex w-100 justify-content-start align-items-center">
                   <span class="menu-collapsed submenu-header">${requestScope.course}</span>  
                </div>
            </a> --%>
            
            <a href="#submenu1" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start">
                <div class="d-flex w-100 justify-content-start align-items-center">
                    <span class="menu-collapsed submenu-header">${requestScope.course}</span>
                    <span class="submenu-icon ml-auto"></span>
                </div>
            </a>
            <div id='submenu1' class="sidebar-submenu">
                
                <!-- <a href="#" class="list-group-item list-group-item-action">
                    <span class="menu-collapsed">Charts</span>
                </a>
                <a href="#" class="list-group-item list-group-item-action">
                    <span class="menu-collapsed">Reports</span>
                </a>
                <a href="#" class="list-group-item list-group-item-action">
                    <span class="menu-collapsed">Tables</span>
                </a> -->
                
            </div>
            
            
            
            
           <%--  <li class="list-group-item sidebar-separator-title text-muted d-flex align-items-center menu-collapsed">
                <span><a href='<c:url value="/course/${requestScope.course}/home.html"/>' class="submenu-header"><small>${requestScope.course}</small></a></span>
            </li>
             --%>
            
            <!-- <a href="#submenu1" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start">
                <div class="d-flex w-100 justify-content-start align-items-center">
                    <span class="menu-collapsed">Dashboard</span>
                    <span class="submenu-icon ml-auto"></span>
                </div>
            </a> -->
            <!-- <div id='submenu1' class="collapse sidebar-submenu">
                <a href="#" class="list-group-item list-group-item-action">
                    <span class="menu-collapsed">Charts</span>
                </a>
                <a href="#" class="list-group-item list-group-item-action">
                    <span class="menu-collapsed">Reports</span>
                </a>
                <a href="#" class="list-group-item list-group-item-action">
                    <span class="menu-collapsed">Tables</span>
                </a>
            </div> -->
            
            
            
           <!--  <a href="#" class=" list-group-item list-group-item-action">
                <div class="d-flex w-100 justify-content-start align-items-center">
                    <span class="menu-collapsed">Tasks</span>    
                </div>
            </a> -->
        </ul>
    </div>
</div>

      
      <!--  <ul class="nav flex-column submenu-toogle">
         <li class="nav-item">
           <a class="nav-link active" href="#">
             Dashboard <span class="sr-only">(current)</span>
           </a>
         </li>
       </ul> -->
       
       
<div class="text-center spinner">
  <div class="spinner-border text-dark" role="status">
    <span class="sr-only">Loading...</span>
  </div>
</div>
<script	type="text/javascript" src="<c:url value='/views/js/jquery-3.4.1.min.js'/>"></script>
<script src="https://unpkg.com/react@16/umd/react.development.js" crossorigin></script>
<script src="https://unpkg.com/react-dom@16/umd/react-dom.development.js" crossorigin></script>
<script type="text/javascript" src="<c:url value='/views/js/sidebar.js'/>"></script>
<script type="text/javascript">
	var rootPath;
	$(function() {
		$.ajax({
			url: '<c:url value="/course/index/${requestScope.course}"/>',
		}).done(function(data) {
			$('div.spinner').hide()
			rootPath = data.path;
			if(data){
				/* TODO:  parseMenuTree */
				parseSubmenu(data, $('#submenu1'));
			}else{
			}
		}).fail(function(data){
		});
		$('span.submenu-header').text(formatMenu($('span.submenu-header').text()));
	});

	function parseMenuTree(data, dom){
		var children = data.children;
		var headerMenu='';
		for(var i=0; i< children.length; i++){
			var row = children[i];
			if(row.type=='directory' || row.type=='Directory'){
				var submenuId = Math.floor(Math.random()*10)+1;
				//var mutedMenu = '<li class="nav-item collapsed"><a class="nav-link" href="#">'+ row.name +'<i class="fas fa-plus-circle"></i></a></li>';
					headerMenu =  '<a href="#submenu_'+submenuId+'" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start">'
                					+'<div class="d-flex w-100 justify-content-start align-items-center">'
                						+'<span class="menu-collapsed">'+row.name+'</span>'
                						+'<span class="submenu-icon ml-auto"></span>'
            						+'</div>'
        						   +'</a>';
        			headerMenu +='<div id="submenu_'+submenuId+'" class="collapse sidebar-submenu">';
        							
        			headerMenu+='<a href="#" class="list-group-item list-group-item-action">'
                    +'<span class="menu-collapsed">Charts</span>'
                    +'</a>'
                    +'<a href="#" class="list-group-item list-group-item-action">'
                    +'<span class="menu-collapsed">Reports</span>'
                    +'</a>'
                    +'<a href="#" class="list-group-item list-group-item-action">'
                    +'<span class="menu-collapsed">Tables</span>'
                    +'</a>';
        			
        			headerMenu+='</div>';
				
				dom.append(headerMenu);
				parseMenuTree(row, dom);
			}else{
				var uri = row.path.replace(rootPath,'');
				uri = '<c:url value="/course/${requestScope.course}"/>/'+uri.substr(1, uri.length).split('/').join('-');
				var linkMenu = '<a href="'+uri+'" onclick="loadContent(this);return false; class="list-group-item list-group-item-action">'
                    			+'<span class="menu-collapsed">'+formatMenu(row.name)+'</span>'
                    		   +'</a>';
				//dom.append('<li class="nav-item collapse collapse-toggle"><a class="nav-link" onclick="loadContent(this);return false;" href="'+uri+'">'+formatMenu(row.name)+'</a></li>');
				dom.append(linkMenu);
			}
			
		}
		
	}
	
	function parseSubmenu(data, dom){
		var children = data.children;
		var headerMenu='';
		for(var i=0; i< children.length; i++){
			var row = children[i];
			var itemName = formatMenu(row.name);
			var itemType = row.type;
			if((itemType.toUpperCase()==='FILE') && (itemName.toUpperCase()!='HOME')){
				var uri = row.path.replace(rootPath,'');
				uri = '<c:url value="/course/${requestScope.course}"/>/'+uri.substr(1, uri.length).split('/').join('-');
				var item =  '<a href="'+uri+'" class=" list-group-item list-group-item-action">'
	                +'<span class="menu-collapsed">'+formatMenu(row.name)+'</span>'
	                +'</a>';
	                
				dom.append(item);
			}
			parseSubmenu(row, dom);
		}
		
	}
	
	function loadContent(element){
		var url = $(element).attr('href');
		$.ajax({
			url: url,
			method : 'POST'
		}).done(function(data) {
			if(data){
				processAjaxData(data, url);
			}else{
			}
		}).fail(function(data){
		});
	}
	 function processAjaxData(response, urlPath){
		 $('#content').html(response);
	     window.history.pushState({"html":response},"", urlPath);
	 }
	function formatMenu(name){
		name = name.split('.')[0];
		name = name.charAt(0).toUpperCase()+name.slice(1);
		return name;
	}
	
/* 	$(".collapsed").click(function(){
       var _this = this;
        $('.collapse-toggle').on('show.bs.collapse', function () {
        	$(_this).find('a i').removeClass('fa-plus-circle').addClass('fa-minus-circle');
        }).on('hide.bs.collapse', function(){
        	$(_this).find('a i').removeClass('fa-minus-circle').addClass('fa-plus-circle');
        });
        $(".collapse-toggle").collapse('toggle');
    }); */

</script>

