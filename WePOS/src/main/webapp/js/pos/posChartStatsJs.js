/**
 * posChartStats.jsp의 자바스크립트
 */

function checkPosChartStats()
{
	if($("#chartType").val() == 0)
	{
		alert("차트를 선택하세요.");
		return false;
	}
	else if($("#startMonth").val() == 0)
	{
		alert("시작되는 월을 선택하세요.");
		return false;
	}
	else if($("#endMonth").val() == 0)
	{
		alert("끝나는 월을 선택하세요.");
		return false;
	}
	
	document.chartStatsOption.submit();	
}