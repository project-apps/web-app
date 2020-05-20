package com.app.controller;

import java.io.IOException;
import java.net.URI;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestClientException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponentsBuilder;

import com.app.exception.CourseContentNotFoundException;
import com.app.util.WebAppConstants;
/**
 * @author Rajan Mishra
 *
 */
@RestController
@RequestMapping(path = {"/course"})
public class CourseController extends RestTemplateURIExchange{
	@GetMapping("/{course}")
	public ModelAndView home(@PathVariable(required = true) String course, HttpServletRequest request) {
		ModelAndView mv = new  ModelAndView("course.page");
		ResponseEntity<String> responseEntity = new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		try {
			URI targetUri= UriComponentsBuilder.fromUriString(getPropValue(WebAppConstants.API_GATEWAY_HOST))
					.path(WebAppConstants.CMS_BUCKET_FILE_URI).queryParam(WebAppConstants.PATH, course+"/"+WebAppConstants.COURSE_HOME_PAGE).build().toUri();
			responseEntity = exchange(targetUri);
			mv.addObject("courseContent", responseEntity.getBody());
			request.setAttribute("course", course);
		}catch (RestClientException ex) {
			request.setAttribute("HttpStatus", responseEntity.getStatusCode());
			ex.printStackTrace();
			throw new RestClientException(ex.getMessage(), ex);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return mv;		
	}
	@GetMapping(path = {"/index/{course}"},produces = {MediaType.APPLICATION_JSON_VALUE} )
	public String leftMenuUrl(@PathVariable String course, HttpServletRequest request) {
		ResponseEntity<String> responseEntity = new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		try {
			URI targetUri = UriComponentsBuilder.fromUriString(getPropValue(WebAppConstants.API_GATEWAY_HOST))
					.path(WebAppConstants.CMS_BUCKET_METADATA_URI).queryParam(WebAppConstants.PATH, course).build().toUri();
			responseEntity = exchange(targetUri);
		}catch (RestClientException ex) {
			request.setAttribute("HttpStatus", responseEntity.getStatusCode());
			ex.printStackTrace();
			throw new CourseContentNotFoundException(ex.getMessage(), ex);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return responseEntity.getBody();
	}
	@GetMapping("/{course}/{page}")
	public ModelAndView coursePage(@PathVariable(required = true) String course, @PathVariable String page, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("course.page");
		ResponseEntity<String> responseEntity = new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		try {
			URI targetUri= UriComponentsBuilder.fromUriString(getPropValue(WebAppConstants.API_GATEWAY_HOST))
					.path(WebAppConstants.CMS_BUCKET_FILE_URI).queryParam(WebAppConstants.PATH, course+"/"+page.replaceAll("-", "/").concat(WebAppConstants.COURSE_FILE_EXT)).build().toUri();
			responseEntity = exchange(targetUri);
			mv.addObject("courseContent", responseEntity.getBody());
			request.setAttribute("course", course);
		} catch (RestClientException ex) {
			request.setAttribute("HttpStatus", responseEntity.getStatusCode());
			logger.error(ex.getMessage());
			ex.printStackTrace();
			throw new CourseContentNotFoundException(ex.getMessage(), ex);
		} catch (Exception e) {
			logger.error(e.getMessage());
			e.printStackTrace();
		}
		return mv;
	}
	@PostMapping("/{course}/{page}")
	public ModelAndView getContent(@PathVariable(required = true) String course, @PathVariable String page, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("course.content");
		ResponseEntity<String> responseEntity = new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		try {
			URI targetUri= UriComponentsBuilder.fromUriString(getPropValue(WebAppConstants.API_GATEWAY_HOST))
					.path(WebAppConstants.CMS_BUCKET_FILE_URI).queryParam(WebAppConstants.PATH, course+"/"+page.replaceAll("-", "/").concat(WebAppConstants.COURSE_FILE_EXT)).build().toUri();
			responseEntity = exchange(targetUri);
			mv.addObject("courseContent", responseEntity.getBody());
			request.setAttribute("course", course);
		}catch (RestClientException ex) {
			request.setAttribute("HttpStatus", responseEntity.getStatusCode());
			ex.printStackTrace();
			throw new CourseContentNotFoundException(ex.getMessage(), ex);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return mv;
	}
}
