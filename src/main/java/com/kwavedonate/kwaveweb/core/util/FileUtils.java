package com.kwavedonate.kwaveweb.core.util;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class FileUtils {
	
	private HttpServletRequest httpServletRequest;
	private String rootPath;
	private String filePath;
	public FileUtils() { }
	
	public FileUtils(HttpServletRequest httpServletRequest) {
		this.httpServletRequest = httpServletRequest;
		this.rootPath = httpServletRequest.getSession().getServletContext().getRealPath("/resources/uploads");
		this.filePath = "";
	}
    
    public Map<String, String> parseInsertFileInfo() {
    	String storagePath = rootPath + filePath;
    	System.out.println("storagePath : " + storagePath);
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)httpServletRequest;
        Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
        MultipartFile multipartFile = null;
        String originalFileName = null;
        String originalFileExtension = null;
        String storedFileName = null;

        // 파일이 여러개인 경우 업로드
        Map<String, String> fileList = new HashMap<String, String>();
        String[] urlParsingResult;
        File file = new File(storagePath);
        if(!file.exists()){
            file.mkdirs();
        }
        
        if(iterator.hasNext()) {
        	// 파일이 있는 경우
        	while(iterator.hasNext()){
                multipartFile = multipartHttpServletRequest.getFile(iterator.next());
                String fileName = multipartFile.getName();
                if(multipartFile.isEmpty() == false){
                    originalFileName = multipartFile.getOriginalFilename();
                    originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
                    storedFileName = CommonUtils.getRandomString() + originalFileExtension;
                    file = new File(storagePath + "/" + storedFileName);
                    System.out.println("file 저장되는 곳 : "+storagePath + "/" + storedFileName);
                    try {
                    	 multipartFile.transferTo(file); 
                    } catch(Exception e) {
                    	e.printStackTrace();;
                    }
                    fileList.put(fileName, storedFileName);
                }
            }
        } else {
        	// 파일이 없는 경우는 수정사항에서 밖에 없음
            // 파일 validation을 javascript에서 거치기 때문임...
        	
        	if(httpServletRequest.getParameter("rewardImgFile") != null) {
        		urlParsingResult = httpServletRequest.getParameter("rewardImg").split("/");
        		System.out.println(urlParsingResult[urlParsingResult.length -1]);
        		fileList.put("rewardImgFile", urlParsingResult[urlParsingResult.length -1]);
        	}
        	
        	if((httpServletRequest.getParameter("campaignImgFile") != null) && (httpServletRequest.getParameter("youtubeImgFile") != null)) {
        		urlParsingResult = httpServletRequest.getParameter("campaignImg").split("/");
        		fileList.put("campaignImgFile", urlParsingResult[urlParsingResult.length -1]);
        		urlParsingResult = httpServletRequest.getParameter("youtubeImg").split("/");
        		fileList.put("youtubeImgFile", urlParsingResult[urlParsingResult.length -1]);
        	}
        }
        
        if(fileList.get("rewardImgFile") == null){
        	if(fileList.get("campaignImgFile") == null){
        		System.out.println("dddddd:" + httpServletRequest.getParameter("campaignImg"));
	        	urlParsingResult = httpServletRequest.getParameter("campaignImg").split("/");
	    		fileList.put("campaignImgFile", urlParsingResult[urlParsingResult.length -1]);
	        }if(fileList.get("youtubeImgFile") == null){
	        	urlParsingResult = httpServletRequest.getParameter("youtubeImg").split("/");
	    		fileList.put("youtubeImgFile", urlParsingResult[urlParsingResult.length -1]);
	        }
        }
        
        return fileList;
    }
    
    public HashMap<String, String> ckEditorImageUpload() throws UnsupportedEncodingException {
    	String storagePath = rootPath + filePath;
    	System.out.println("storagePath : " + storagePath);
    	
    	HashMap<String, String> responseMap = new HashMap<String, String>();
    	MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)httpServletRequest;
    	Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
    	httpServletRequest.setCharacterEncoding("utf-8");        

    	MultipartFile multipartFile = null;
    	String originalFileName = null;
        String originalFileExtension = null;
        String storedFileName = null;
        File file = new File(storagePath);
    	OutputStream out = null;
        PrintWriter printWriter = null;
       
        while(iterator.hasNext()){
        	multipartFile = multipartHttpServletRequest.getFile(iterator.next());
        	if(multipartFile.isEmpty() == false){
        		try{
        			//byte[] bytes = multipartFile.getBytes();
        			originalFileName = multipartFile.getOriginalFilename();
                    originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
                    storedFileName = CommonUtils.getRandomString() + originalFileExtension;
                    file = new File(storagePath + "/" + storedFileName);
                    
                    //out = new FileOutputStream(new File(storagePath +"/" + storedFileName)); out.write(bytes);
                    try {
                   	 multipartFile.transferTo(file); 
                   } catch(Exception e) {
                   	e.printStackTrace();;
                   }
                    
                    responseMap.put("CKEditorFuncNum", httpServletRequest.getParameter("CKEditorFuncNum"));
                    System.out.println("=============================");
                    System.out.println(storagePath + "/" + storedFileName);
                    System.out.println("=============================");
                    responseMap.put("storagePath", storedFileName);
                }
        		catch(Exception e){e.printStackTrace();} 
        		finally {
                    try { if (out != null) { out.close();} if (printWriter != null) { printWriter.close(); }} 
                    catch (IOException e) {e.printStackTrace();}
                }
        	}
        }
        return responseMap;
    }
}
