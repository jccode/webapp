package tk.jcchen.miniweb.util;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.io.FilenameUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

public class FileuploadUtils {
	
//	public static final String IMG_UPLOAD_RELATIVE_PATH = "web" + File.separator + "upload";
//
//	public static final String IMG_UPLOAD_PATH = Env.WEBROOT + IMG_UPLOAD_RELATIVE_PATH;
	
	private static SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");;

	/**
	 * save image to server under the /web/upload folder.
	 * 
	 * @param filename
	 * @return
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	public static String saveImage(MultipartFile file) throws IllegalStateException, IOException {
		String filename = file.getOriginalFilename();
		if (!isImage(filename)) {
			throw new IllegalStateException("File isn't a image.");
		}
		
		// append a timestamp to fileName
		String basename = FilenameUtils.getBaseName(filename), 
			extension = FilenameUtils.getExtension(filename), 
			newname = basename + "_" + currentTimestamp() + "." + extension;
		
		String toSave = Env.WEBROOT + StringUtils.arrayToDelimitedString(
				new String[]{"static", "upload", newname}, File.separator);
		
//		String toSave = IMG_UPLOAD_PATH + File.separator + newname;
		File image = forceNewFile(toSave);
		file.transferTo(image);
		
//		String uploadPath = File.separator.equals("\\")? 
//				IMG_UPLOAD_RELATIVE_PATH.replaceAll("\\\\", "/"): IMG_UPLOAD_RELATIVE_PATH;
//		return "/" + uploadPath + "/" + newname;
		
		return StringUtils.arrayToDelimitedString(
				new String[]{"static", "upload", newname}, "/");
	}

	private static String currentTimestamp() {
		return simpleDateFormat.format(new Date());
	}

	public static boolean isImage(String filename) {
		String[] extensions = new String[] { 
				"jpg", "bmp", "jpeg", "gif", "png", 
				"JPG", "BMP", "JPEG", "GIF", "PNG" };
		return FilenameUtils.isExtension(filename, extensions);
	}
	
	/**
	 * force create a new file
	 * @param name
	 * @return
	 * @throws IOException
	 */
	public static File forceNewFile(String name) throws IOException {
		File file = new File(name);
		if(!file.exists()) {
			File parentFile = file.getParentFile();
			if(parentFile != null) {
				parentFile.mkdirs();
			}
			file.createNewFile();
		}
		return file;
	}
}