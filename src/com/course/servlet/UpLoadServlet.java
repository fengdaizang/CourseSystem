package com.course.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.course.bean.Task;
import com.course.dao.TaskDao;

public class UpLoadServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UpLoadServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/**
		 * 文件上传：
		 * http://www.jb51.net/article/70543.htm
		 * 
		 */

		request.setCharacterEncoding("utf-8");  
        response.setCharacterEncoding("utf-8");  
        //更改响应字符流使用的编码，还能告知浏览器用什么编码进行显示  
        response.setContentType("text/html;charset=utf-8");
        
        TaskDao taskDao=new TaskDao();
        Task task=new Task();
        
        //上传时生成的临时文件保存目录
        String tempPath = this.getServletContext().getRealPath("/WEB-INF/temp");
        File tmpFile = new File(tempPath);
        if (!tmpFile.exists()) {
        	//创建临时目录
        	tmpFile.mkdir();
        }
             
        //消息提示
       	String message = "";
       	try{
       		//使用Apache文件上传组件处理文件上传步骤：
           	//1、创建一个DiskFileItemFactory工厂
           	DiskFileItemFactory factory = new DiskFileItemFactory();
          	//设置工厂的缓冲区的大小，当上传的文件大小超过缓冲区的大小时，就会生成一个临时文件存放到指定的临时目录当中。
         	factory.setSizeThreshold(1024*100);//设置缓冲区的大小为100KB，如果不指定，那么缓冲区的大小默认是10KB
          	//设置上传时生成的临时文件的保存目录
         	factory.setRepository(tmpFile);
           	//2、创建一个文件上传解析器
           	ServletFileUpload upload = new ServletFileUpload(factory);
          	
            //解决上传文件名的中文乱码
            upload.setHeaderEncoding("UTF-8"); 
            //3、判断提交上来的数据是否是上传表单的数据
            if(!ServletFileUpload.isMultipartContent(request)){
            	//按照传统方式获取数据
            	return;
            }
              
            //设置上传单个文件的大小的最大值，目前是设置为1024*1024字节，也就是1MB
            upload.setFileSizeMax(1024*1024);
            //设置上传文件总量的最大值，最大值=同时上传的多个文件的大小的最大值的和，目前设置为10MB
            upload.setSizeMax(1024*1024*10);
            //4、使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
            List<FileItem> list = upload.parseRequest(request);
            for(FileItem item : list){
            	//如果fileitem中封装的是普通输入项的数据
            	if(item.isFormField()){
            		String name = item.getFieldName();
            		//解决普通输入项的数据的中文乱码问题
            		String value = item.getString("UTF-8");
            		
            		//得到学号和作业标号
            		if(name.equals("sid")){
            			task.setSid(Integer.parseInt(value));
            		}
            		if(name.equals("hw_id")){
            			task.setHw_id(Integer.parseInt(value));
            		}
            	//如果fileitem中封装的是上传文件
            	}else{
            		//得到上传的文件名称
            		String filename = item.getName();
            		if(filename==null || filename.trim().equals("")){
            			continue;
            		}
            		//注意：不同的浏览器提交的文件名是不一样的，有些浏览器提交上来的文件名是带有路径的，如： c:\a\b\1.txt，而有些只是单纯的文件名，如：1.txt
            		//处理获取到的上传文件的文件名的路径部分，只保留文件名部分
            		filename = filename.substring(filename.lastIndexOf("\\")+1);
               
            		//得到上传文件的扩展名
            		String fileExtName = filename.substring(filename.lastIndexOf(".")+1);
               
            		//获取item中的上传文件的输入流
            		InputStream in = item.getInputStream();
            		
            		//得到文件保存的名称
            		String saveFilename = UUID.randomUUID().toString() + "_"+filename;
            		
            		//得到上传文件的保存目录，将上传的文件存放于WEB-INF目录下，不允许外界直接访问，保证上传文件的安全
                    String savePath = this.getServletContext().getRealPath("/WEB-INF/upload");
                    //创建作业对应的文件夹
            		File f_savePath = new File(savePath);
            		if (!f_savePath.exists()) {
                    	//创建临时目录
            			f_savePath.mkdir();
                    }
            		//得到文件的保存目录
            		String realSavePath =savePath+"\\"+task.getHw_id();
            		
            		//得到文件路径
            		String file_url=(realSavePath+"\\"+saveFilename).replaceAll("\\\\","\\\\\\\\");
            		task.setFile_url(file_url);
            		
            		//保存作业信息进数据库
            		taskDao.stuUploadTask(task);
            		
            		//创建作业文件路劲
            		File f_realSavePath = new File(savePath+"/"+task.getHw_id());
            		if (!f_realSavePath.exists()) {
                    	//创建临时目录
            			f_realSavePath.mkdir();
                    }
            		//创建一个文件输出流
            		OutputStream out = new FileOutputStream(realSavePath + "\\" + saveFilename);
            		//创建一个缓冲区
            		byte buffer[] = new byte[1024];
            		int len = 0;
            		//循环将输入流读入到缓冲区当中，(len=in.read(buffer))>0就表示in里面还有数据
            		while((len=in.read(buffer))>0){
            			//使用FileOutputStream输出流将缓冲区的数据写入到指定的目录(savePath + "\\" + filename)当中
            			out.write(buffer, 0, len);
            		}
            		//关闭输入流
            		in.close();
            		//关闭输出流
            		out.close();        
            		item.delete();       
            		message = "文件上传成功！";
            	}
            }
       	}catch (FileUploadBase.FileSizeLimitExceededException e) {
       		e.printStackTrace();
       		request.setAttribute("message", "单个文件超出最大值！！！");
       	}catch (FileUploadBase.SizeLimitExceededException e) {
        	e.printStackTrace();
        	request.setAttribute("message", "上传文件的总的大小超出限制的最大值！！！");
          	return;
    	}catch (Exception e) {
    		message= "文件上传失败！";
         	e.printStackTrace();
     	}
        response.sendRedirect("student/homework.jsp");  
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
