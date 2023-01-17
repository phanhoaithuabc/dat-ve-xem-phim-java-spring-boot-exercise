package com.qnu.api;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Base64;

import javax.servlet.ServletContext;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.qnu.dto.FilmDTO;
import com.qnu.service.IFilmService;

@RestController(value = "filmAPIOfAdmin")
public class FilmAPI {
	
	@Autowired
	private IFilmService filmService;
	
	@Autowired
	private ServletContext context; 
	
	@PostMapping("/api-film")
	public FilmDTO createFilm(@RequestBody FilmDTO filmDTO) {
		//String root = request.getServletContext().getRealPath("upload");
		String root = context.getRealPath("/template/upload/");
		System.out.println(root);
		try {
			
            byte[] decodeBase64 = Base64.getDecoder().decode(filmDTO.getThumbnailBase64().getBytes());
            
            File file = new File(StringUtils.substringBeforeLast(root + "/thumbnail/"+filmDTO.getThumbnail(), "/"));
            if (!file.exists()) {
                file.mkdir();
            }
            try(FileOutputStream fileOutputStream = new FileOutputStream(new File(root + "/thumbnail/"+filmDTO.getThumbnail()))) {
                fileOutputStream.write(decodeBase64);
            } catch (IOException e) {
                e.printStackTrace();
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
		return filmService.save(filmDTO);
	}
	
	@PutMapping("/api-film")
	public FilmDTO updateFilm(@RequestBody FilmDTO updateFilm) {
		String root = context.getRealPath("/template/upload/");
		System.out.println(root);
		try {
			
            byte[] decodeBase64 = Base64.getDecoder().decode(updateFilm.getThumbnailBase64().getBytes());
            
            File file = new File(StringUtils.substringBeforeLast(root + "/thumbnail/"+updateFilm.getThumbnail(), "/"));
            if (!file.exists()) {
                file.mkdir();
            }
            try(FileOutputStream fileOutputStream = new FileOutputStream(new File(root + "/thumbnail/"+updateFilm.getThumbnail()))) {
                fileOutputStream.write(decodeBase64);
            } catch (IOException e) {
                e.printStackTrace();
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
		return filmService.save(updateFilm);
	}
	
	@DeleteMapping("/api-film")
	public void deleteFilm(@RequestBody long[] ids) {
		filmService.delete(ids);
	}
}
