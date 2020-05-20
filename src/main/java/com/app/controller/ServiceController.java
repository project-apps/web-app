package com.app.controller;

import java.io.IOException;
import java.net.URI;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestClientException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponentsBuilder;

import com.app.entity.dto.PincodeDto;
import com.app.util.WebAppConstants;

@RestController
@RequestMapping(path = {"/service"})
public class ServiceController extends RestTemplateURIExchange {

	@GetMapping(path = {"/pincode"})
	public ModelAndView pincodePage(@ModelAttribute PincodeDto pincodeDto, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("service.pincode");
		ResponseEntity<String> responseEntity = new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		try {
			if(!StringUtils.isEmpty(pincodeDto.getPincode())) {
				URI targetUri= UriComponentsBuilder.fromUriString(getPropValue(WebAppConstants.API_GATEWAY_HOST))
						.path(WebAppConstants.PINCODE_URI).path("/").path(pincodeDto.getDataView()).path("/").path(pincodeDto.getPincode()).build().toUri();
				
				responseEntity = exchange(targetUri);
				mv.addObject("pincodeJSON", responseEntity.getBody());
			}
		} catch (RestClientException ex) {
			request.setAttribute("HttpStatus", responseEntity.getStatusCode());
			ex.printStackTrace();
			throw new RestClientException(ex.getMessage(), ex);
		} catch (IOException e) {
			e.printStackTrace();
		}
		mv.addObject(pincodeDto);
		return mv;
	}
}