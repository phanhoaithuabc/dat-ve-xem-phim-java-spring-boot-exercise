package com.qnu.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.qnu.dto.BillDTO;
import com.qnu.service.IBillService;

@RestController(value = "billAPIOfAdmin")
public class BillAPI {
	
	@Autowired
	private IBillService billService;
	
	@PostMapping("/api-bill")
	public BillDTO createBill(@RequestBody BillDTO billDTO) {
		return billService.save(billDTO);
	}
	
	@PutMapping("/api-bill")
	public BillDTO updateBill(@RequestBody BillDTO billDTO) {
		return billService.save(billDTO);
	}
}
