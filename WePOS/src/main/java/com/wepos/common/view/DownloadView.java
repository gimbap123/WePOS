package com.wepos.common.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

// AbstractView를 상속받아야 뷰가 된다.
public class DownloadView extends AbstractView {

	public DownloadView()  // 다운로드 화면으로 설정
	{
		// text/html;charset=UTF-8을 application/download; charset=UTF-8로 변경
		setContentType("application/download; charset=UTF-8");
	}
	
	
	// DetailController에서 전달해주는 Model값을 처리해주는 메서드
	// 1. 뷰에게 전달되는 Map 객체(Model 객체), 2. request, 3. response
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		File file = (File)model.get("downloadFile");
		
		// 클라이언트가 받을 수 있도록 설정
		response.setContentType(getContentType());
		response.setContentLength((int)file.length());  // 다운로드 받을 파일의 길이 설정
		
		// 브라우저의 종류에 따른 한글 처리
		String userAgent = request.getHeader("User-Agent");  // 브라우저의 정보
		boolean ie = userAgent.indexOf("MSIE") > -1;  // MSIE가 없으면 -1이기때문에 -1보다 크면 익스플로러가 맞음
		String filename = null;
		
		if(ie)
		{
			filename = URLEncoder.encode(file.getName(), "UTF-8");			
		}
		else  // 다른 브라우저라면 영어로 처리
		{			
			filename = new String(file.getName().getBytes("UTF-8"), "iso-8859-1");
		}
		
		// 다운로드 대화상자
		// 위치 경로, 파일명
		response.setHeader("Content-Disposition", "attachment;filename=\"" + filename + "\";");
		// 이진파일 다운로드 받을 수 있도록 설정
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		OutputStream out = response.getOutputStream();
		FileInputStream fis = null;
		
		try
		{
			fis = new FileInputStream(file);
			// 파일을 복사해서 전송 - FileCopyUtils 이용
			FileCopyUtils.copy(fis, out);  // 입력받는쪽, 출력하는 쪽			
		}
		catch(IOException e)
		{
			e.printStackTrace();
		}
		finally
		{
			// 메모리 해제
			if(fis != null)
			{
				try
				{
					fis.close();
				}
				catch(IOException e)
				{
					e.printStackTrace();
				}
			}
		}
		
		out.flush();  // 출력하도록 설정(flush() - 데이터의 양에 상관없이 무조건 출력)			
	}

}

