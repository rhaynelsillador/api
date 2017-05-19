<%@ page language="java" 
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import='javax.servlet.jsp.jstl.fmt.LocalizationContext'%> 
<%@ page import='java.util.*'%>
<%@ page import='javax.servlet.http.*'%>
<% 
HttpSession session1 = request.getSession();
String lang = (String)session1.getAttribute("lang");
ResourceBundle rb = ResourceBundle.getBundle(lang==null? "en" :lang, Locale.ENGLISH);

   LocalizationContext lc = new LocalizationContext(rb);
   pageContext.setAttribute("messages", lc);

%>
<!DOCTYPE html>
<html>
  <head>
    <%@ include file="../../player-includes/player-css-files.jsp" %> 
    
    <link rel="stylesheet" href="../assets/plugins/daterangepicker/daterangepicker-bs3.css">
  </head>
  
  <body class="hold-transition skin-blue sidebar-mini">
  
    <div class="wrapper">   
      <%@ include file="../../player-includes/player-header.jsp" %>      
      <%@ include file="../../player-includes/player-aside.jsp" %>
      
	      <!-- Content Wrapper. Contains page content -->
	      <div class="content-wrapper">
      		<%@ include file="../../player-includes/player-provider.jsp" %>
	        <!-- Content Header (Page header) -->
	        <section class="content-header">
	          <h1 class="pull-left">
	            <fmt:message key="TRANSACTIONHISTORY"  bundle="${messages}"/>
	          </h1>
			  <%@ include file="ShortcutLinks.jsp" %>
	        </section>
	        <br clear="all">
        	<section class="content">
        		<div class="row">
        			<div class="col-sm-12">
        				<div class="box box-primary box-solid">
        					<div class="box-header">
        						<label><fmt:message key="PLAYERTRANSACTIONHISTORY"  bundle="${messages}"/></label>
        					</div>
        					<div class="box-body">
        							<div class="col-sm-12 history-search">
        								<div class="pull-left">
		        							<div class="form-group">
				        						<label><fmt:message key="DATESTART"  bundle="${messages}"/></label>
										    	<input type='text' class="form-control" id="datetimepicker_start"/>
										   	</div>
									        <div class="form-group">
									       		<label><fmt:message key="DATEEND"  bundle="${messages}"/></label>
									            <input type='text' class="form-control" id="datetimepicker_end"/>
									        </div>
									        <button class="btn btn-default btn-date" name="advancesearch" id="advancesearch"><i class="fa fa-arrow-circle-right" aria-hidden="true"></i> <fmt:message key="SHOWADVANCEOPTION"  bundle="${messages}"/></button>
		        							<div class="form-group advance">
				        						<label><fmt:message key="TRANSACTIONNO"  bundle="${messages}"/></label>
									       		<input type='text' class="form-control" id="transasction_number_search"/>
									        </div>
									  	    
		        							<div class="form-group advance">
				        						<label><fmt:message key="AMOUNTBETWEEN"  bundle="${messages}"/></label>
									       		<input type='text' class="form-control" id="amount_minimum"/>
									        </div>
									  	    
									        <div class="form-group advance">
									        	<label><fmt:message key="AND"  bundle="${messages}"/></label>
									            <input type='text' class="form-control" id="amount_maximum"/>
									        </div>
								        </div>
										<button class="btn btn-default btn-date pull-left" name="reset_button" id="reset_button" type="submit"><i class="fa fa-refresh" aria-hidden="true"></i> <fmt:message key="RESET"  bundle="${messages}"/></button>
        								<button class="btn btn-warning btn-date pull-left" name="submit_button" id="submit_button" type="button" id="search_submit"><i class="fa fa-check" aria-hidden="true"></i> <fmt:message key="SUBMIT"  bundle="${messages}"/></button>
        								<button style="display:none;" class="btn btn-info btn-date pull-left" name="submit_date_range" type="submit" id="export_to_csv" disabled="disabled"><i class="fa fa-file-text" aria-hidden="true"></i> <fmt:message key="EXPORTTOCSV"  bundle="${messages}"/></button>
							        </div>
						        
							    <div class="table-responsive">
	        						<table class="table table-striped" id="transaction_history">
	        							<thead>
	        								<tr>
	        									<th>#</<th>
	        									<th><fmt:message key="PLAYERID"  bundle="${messages}"/></th>
	        									<th><fmt:message key="TRANSACTIONNO" bundle="${messages}"/></th>
	        									<th><fmt:message key="DATE" bundle="${messages}"/></th>
	        									<th><fmt:message key="AMOUNT" bundle="${messages}"/></th>
	        									<th><fmt:message key="BALANCEBEFORE" bundle="${messages}"/></th>
	        									<th><fmt:message key="BALANCEAFTER" bundle="${messages}"/></th>
	        									<th><fmt:message key="CURRENCY" bundle="${messages}"/></th>
	        									<th><fmt:message key="OPERATOR" bundle="${messages}"/></th>
	        									<th><fmt:message key="TRANSACTION" bundle="${messages}"/></th>
	        									<%-- <th><fmt:message key="STATUS" bundle="${messages}"/></th> --%>
	        								</tr>
	        							</thead>
	        							<tbody>
	        								
	        							</tbody>
	        						</table>
        						</div>
        					</div>
        				</div>
        			</div>
        		</div>
        	</section>
        	
      	</div>
	
		<%@ include file="../../Applications/Components/Footer.jsp" %>
		
      	<div class="control-sidebar-bg"></div>

    </div>
	
	
	
    <%@ include file="StartOperationModal.jsp" %>
    <%@ include file="WithdrawModal.jsp" %>
    <%@ include file="DepositModal.jsp" %>
    <%@ include file="../../player-includes/js-files.jsp" %>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>
    <script src="../assets/plugins/daterangepicker/daterangepicker.js"></script>
    <script src="../player-assets/dist/js/playertransactionhistory.js"></script>
    <script type="text/javascript">
    
	    var AGENT = '<fmt:message key="AGENT"  bundle="${messages}"/>';
		var PLAYER = '<fmt:message key="PLAYER"  bundle="${messages}"/>';
		var STARTOPERATION = '<fmt:message key="STARTOPERATION"  bundle="${messages}"/>';
		var WITHDRAW = '<fmt:message key="WITHDRAW"  bundle="${messages}"/>';
		var REFUND = '<fmt:message key="REFUND"  bundle="${messages}"/>';
		var WINNING = '<fmt:message key="WINNING"  bundle="${messages}"/>';
		var ADDOPERATION = '<fmt:message key="ADDOPERATION"  bundle="${messages}"/>';
		var START = '<fmt:message key="STARTSMALL"  bundle="${messages}"/>';
		var ENDOPERATION = '<fmt:message key="ENDOPERATION"  bundle="${messages}"/>';
		var DEPOSIT = '<fmt:message key="DEPOSIT"  bundle="${messages}"/>';
		var TRASNFER = '<fmt:message key="TRASNFER"  bundle="${messages}"/>';
		var CANCELOPERATION = '<fmt:message key="CANCELOPERATION"  bundle="${messages}"/>';
	    
		$('.advance').hide();
		$('#advancesearch').click(function(){
			$('#advancesearch').hide();
			$('.advance').show();
		});
		
		var SUCCESS = '<fmt:message key="SUCCESS" bundle="${messages}"/>';
		var ERROR = '<fmt:message key="ERROR" bundle="${messages}"/>';
		var WARNING = '<fmt:message key="WARNING" bundle="${messages}"/>';
		var LOADING = '<fmt:message key="LOADING" bundle="${messages}"/>';
    	var loginagent = '${sessionScope.agentPlayer.username}';
    </script>
    
  </body>
</html>
