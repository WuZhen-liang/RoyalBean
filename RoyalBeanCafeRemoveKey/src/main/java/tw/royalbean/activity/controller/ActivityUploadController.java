package tw.royalbean.activity.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import tw.royalbean.activity.model.ActivityUploadService;

@Controller
public class ActivityUploadController {
	
	@Autowired
	private ActivityUploadService activityUploadService;
	
	@PostMapping(value = "/uploadImg", produces = MediaType.ALL_VALUE)
	@ResponseBody
	public String upload(@RequestParam("myfile") MultipartFile multipartFile, Model m) {

		System.out.println("originalFilename:" + multipartFile.getOriginalFilename());
		System.out.println("name:" + multipartFile.getName());
		
		if (!multipartFile.isEmpty()) {
			
			String Base64Img;
			try {
				Base64Img = activityUploadService.fileToBase64(multipartFile);
				String uploadImg = activityUploadService.uploadImg(Base64Img);
					 
				System.out.println("得到圖片url:"+uploadImg);
				
				// parsing JSON
                JSONObject jsonResponse;
				try {
					
					jsonResponse = new JSONObject(uploadImg);
					JSONObject dataObject = (JSONObject)jsonResponse.get("data");
					
					System.out.println("link is:" + (String)dataObject.get("link"));
					return (String)dataObject.get("link");
					
				} catch (JSONException e) {
					e.printStackTrace();
				}
				
			} catch (IOException e) {
				e.printStackTrace();
			}
				
		}else {
			System.out.println("空的multipartFile");
		}
		
		return "無multipartFile";
		
	}

}
