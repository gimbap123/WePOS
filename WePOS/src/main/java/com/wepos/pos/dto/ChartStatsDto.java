package com.wepos.pos.dto;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ChartStatsDto implements Comparable<ChartStatsDto>{
	
	private String label;
	private String totalPrice;
	
	public int compareTo(ChartStatsDto chartStats) {		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
		int result = 0;
		try 
		{
			Date thisDate = sdf.parse(this.label);
			Date chartStatsDate = sdf.parse(chartStats.getLabel());
			String thisString = sdf.format(thisDate);
			String chartStatsString = sdf.format(chartStatsDate);
			int thisInt = Integer.parseInt(thisString);
			int chartStatsInt = Integer.parseInt(chartStatsString);	
			result = (thisInt > chartStatsInt) ? -1 : (thisInt < chartStatsInt)? 1 : 0;
		}
		catch (ParseException e) 
		{			
			e.printStackTrace();
		}
		
		return result;
	}
			
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public String getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	
}
