<%@ page session="true"%> <%@ page isELIgnored="false"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<h5>
	<a href="${requestScope.course}/index.html" class="logo">${requestScope.course}</a>
</h5>
<hr/>
<ul class="nav submenu-toogle flex-column overflow-auto" id="navSubmenu">
</ul>
<script src= "https://unpkg.com/react@16/umd/react.production.min.js"></script>
<script src= "https://unpkg.com/react-dom@16/umd/react-dom.production.min.js"></script>
<script src="https://unpkg.com/babel-standalone@6.15.0/babel.min.js"></script>

<script type="text/babel">
class Menu extends React.Component{
	render(){
		return (
			<li class="nav-item"><a class="nav-link submenu-link" href={this.props.link}>{this.props.value}</a></li>
		);
	}
}
class Board extends React.Component{
	renderMenu(name, link){
		return <Menu value={name} link={link}/>;
	}
	render(){
		return(
			 this.renderMenu('Menu-1','abc')
		);
	}
}

ReactDOM.render(<Board />,$('#navSubmenu')[0]);
</script>
