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

//뷰를 작성 => AbstractView를 상속받아야 뷰가 됩니다.
public class DownloadView extends AbstractView {

	//생성자에서 먼저 다운로드 화면으로 설정하여 줍니다
	public DownloadView(){
		//default => "text/html;charset=utf=8"
		setContentType("application/download;charset=utf-8");
	}
	
	//DetailController에서 전달해주는 Model값을 처리해주는 메서드
	//[1번째]뷰에게 전달되는 Map객체(Model객체) [2번째]request객체 [3번째]response객체
	@Override
	protected void renderMergedOutputModel(
		Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {

		File file=(File)model.get("downloadFile"); //Key=>DetailController에서 "downloadFile" 이라고 지정했었음
	
		//클라이언트가 받을수 있도록 환경설정을 해줍니다(어디서? 응답객체에서)
		response.setContentType(getContentType()); //다운로드 화면으로 바꾸어라!
		// ==>위 생성자 부분에서 설정한 값을 가지고 와서 설정하여 준 것입니다
		response.setContentLength((int)file.length());
		// ==>다운로드 화면으로 전환되면서 다운로드 받은 파일의 길이를 설정합니다
		
		//브라우저의 종류에 따라서 한글처리를 해줍니다
		String userAgent=request.getHeader("User-Agent"); //브라우저 정보
		boolean ie=userAgent.indexOf("MSIE") > -1; //MSIE라는 값이 있다면 Internet Explorer에 접속하였구나!
		String boardFile=null; //다운로드 받을 파일명
		
		//만약 찾는 브라우저가 Internet Explorer라면
		if(ie==true){ //==true는 생략 가능
			boardFile=URLEncoder.encode(file.getName(), "utf-8");
		}else{ //chrome, firefox... => 영어는 Iso-8859-1
			boardFile=new String(file.getName().getBytes("utf-8"), "Iso-8859-1");			
		}
		
		//접속하면 자동으로 키값이 등록이 되는 것을 Header라고 한다고?
		//대화상자 형태로 나오게 하고 싶다면(위치경로, 파일명, 이진파일)
		response.setHeader("Content-Disposition", "attachment);filename=\""+boardFile+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary"); //이진파일
		
		//데이터를 주고 받을때 필요한 입출력 객체가 필요합니다
		OutputStream out=response.getOutputStream();
		FileInputStream fis=null;
		
		//입출력은 꼭 예외처리를 해주어야 합니다
		try{
			fis=new FileInputStream(file); //file객체게 위치와 파일정보가 이미 들어있다
			//파일을 전송하는데 서버쪽에서 클라이언트 쪽으로 복사 =>FileCopyUtils Class 이용
			FileCopyUtils.copy(fis, out); //입력받는쪽, 출력하는쪽
		}catch(Exception e){
			e.printStackTrace();
		}finally{ //메모리 해제하는 구문(코딩)
			if(fis!=null){
				try{fis.close();} catch(IOException e){e.printStackTrace();}
			}
		}
		out.flush(); //파일의 양이 적든 많든 무조건 출력하라(flush()=>무조건 출력)
		
		
	}

}
