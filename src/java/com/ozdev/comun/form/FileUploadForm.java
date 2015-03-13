/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ozdev.comun.form;

import java.util.List;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author rberrezueta
 */
public class FileUploadForm {
    
	private List<MultipartFile> files;

	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}    
    
}
