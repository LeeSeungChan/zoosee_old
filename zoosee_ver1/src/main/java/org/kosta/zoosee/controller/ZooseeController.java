package org.kosta.zoosee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ZooseeController {
	
	@RequestMapping("{viewId}.do")
	public String showView(@PathVariable String viewId){
		System.out.println("@PathVariable : "+viewId);
		return viewId;
	}

	

}
