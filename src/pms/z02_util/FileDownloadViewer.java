package pms.z02_util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class FileDownloadViewer extends AbstractView {
	// 다운로드할 절대 경로 설정된 변수 호출
	@Value("${upload}")
	private String upload;

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String filename = (String) model.get("downloadFile");
		File file = new File(upload + filename);

		response.setContentType("application/download; charset-utf-8");
		response.setContentLength((int) file.length());
		filename = URLEncoder.encode(filename, "utf-8").replaceAll("\\+", " ");
		response.setHeader("Content-Disposition", "attachment;filename=\"" + filename + "\"");
		response.setHeader("Content-Transfer-Encoding", "binary");

		FileInputStream fis = new FileInputStream(file);
		OutputStream out = response.getOutputStream();
		FileCopyUtils.copy(fis, out);
		out.flush();

	}

}