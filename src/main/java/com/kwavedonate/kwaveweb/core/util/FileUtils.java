package com.kwavedonate.kwaveweb.core.util;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

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
		this.rootPath = httpServletRequest.getSession().getServletContext().getRealPath("\\");
		this.filePath = "resources\\upload\\";
	}
    
    public List<String> parseInsertFileInfo() {
    	String storagePath = rootPath + filePath;
    	System.out.println("storagePath : " + storagePath);
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)httpServletRequest;
        Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
         
        MultipartFile multipartFile = null;
        String originalFileName = null;
        String originalFileExtension = null;
        String storedFileName = null;

        // 파일이 여러개인 경우 업로드
        List<String> fileList = new ArrayList<String>();

        File file = new File(storagePath);
        if(!file.exists()){
            file.mkdirs();
        }
         
        while(iterator.hasNext()){
            multipartFile = multipartHttpServletRequest.getFile(iterator.next());
            if(multipartFile.isEmpty() == false){
                originalFileName = multipartFile.getOriginalFilename();
                originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
                storedFileName = CommonUtils.getRandomString() + originalFileExtension;
                
	            System.out.println("name : "+multipartFile.getName());
	            System.out.println("filename : "+multipartFile.getOriginalFilename());
	            System.out.println("size : "+multipartFile.getSize());
	          
                file = new File(storagePath + storedFileName);
                
                try {
                	 multipartFile.transferTo(file); 
                } catch(Exception e) {
                	e.printStackTrace();;
                }
                fileList.add(storedFileName);
            }
        }
        return fileList;
    }
}
