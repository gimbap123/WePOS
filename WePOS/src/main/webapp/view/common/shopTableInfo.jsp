<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="../assets/plugins/counter/jquery.counterup.min.js"></script>
<script type="text/javascript" src="../assets/plugins/counter/waypoints.min.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function() {		
		App.initCounter();       
    });
</script>

<!-- Counters --> 
<div class="main-counters margin-bottom-30">
    <div class="margin-bottom-40"></div>

    <div class="row margin-bottom-40">
    	<div class="counters col-md-4 col-sm-3">
            <span class="counter">${tableInfoMap.TOTALTABLE}</span>   
            <h4>총 테이블</h4>
        </div>
		<div class="counters col-md-4 col-sm-3">
			<span class="counter">${tableInfoMap.USETABLE}</span> 
	        <h4>사용중인 테이블</h4>
		</div>
	    <div class="counters col-md-4 col-sm-3">
			<span class="counter">${tableInfoMap.EMPTYTABLE}</span>
	        <h4>빈 테이블</h4>
		</div> 
    </div>
    <div class="row">
    	<div class="col-md-6 col-md-offset-3">
    		<div class="heading heading-v4">
    			<h2>현재 ${tableInfoMap.TOTALTABLE}개의 테이블 중에  빈 테이블은  ${tableInfoMap.EMPTYTABLE}개입니다.</h2>
    		</div>
    	</div>
    </div>   
</div>