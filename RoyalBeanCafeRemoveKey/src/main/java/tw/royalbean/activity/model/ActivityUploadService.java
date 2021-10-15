package tw.royalbean.activity.model;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.IOUtils;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ActivityUploadService {
	
	//Base64
	public String fileToBase64(MultipartFile file) throws IOException {

		InputStream inputStream = file.getInputStream();
		byte[] bytes = IOUtils.toByteArray(inputStream);
		String encoded = java.util.Base64.getEncoder().encodeToString(bytes);

		return encoded;
	}
	
	//imgur資訊
	public static final String IMGUR_URL = "https://api.imgur.com/3/image"; //Imgurl_api
	public static final String CLIENT_ID = "aa6c3adbad85669";
	public static final String Token = "85bb6e63d44f2725cc2c74bfc5f1a522ddc7114c";
	public static final String Album = "XXXX"; //若要指定傳到某個相簿，就填入相簿的 ID
	
	//上傳圖片method
	public String uploadImg(String base64String) {
		
		String content = null;
		
		//使用Apache HttpClient將HTTP Request推送到伺服器
		CloseableHttpClient httpClient = HttpClients.createDefault();         
		HttpPost httpPostRequest = new HttpPost(IMGUR_URL);
		httpPostRequest.setHeader("Authorization", "Client-ID " + CLIENT_ID); // Client-ID後一定要空白
		
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("image", base64String));
		try {
			httpPostRequest.setEntity(new UrlEncodedFormEntity(params));
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		//處理Response
		try {
			
			CloseableHttpResponse response = httpClient.execute(httpPostRequest);
			HttpEntity entity = response.getEntity();
			content = EntityUtils.toString(entity, "UTF-8");
			
			System.out.println("HttpEntity" + content);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return content;
	}
	
}
