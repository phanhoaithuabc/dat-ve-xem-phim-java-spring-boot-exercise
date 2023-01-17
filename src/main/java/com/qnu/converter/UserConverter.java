package com.qnu.converter;

import org.springframework.stereotype.Component;

import com.qnu.dto.UserDTO;
import com.qnu.entity.UserEntity;

@Component
public class UserConverter {
	
	public UserDTO toDto(UserEntity entity) {
		UserDTO result = new UserDTO();
		result.setId(entity.getId());
		result.setUserName(entity.getUserName());
		result.setPassWord(entity.getPassWord());
		result.setFullName(entity.getFullName());
		result.setPhone(entity.getPhone());
		result.setEmail(entity.getEmail());
		result.setStatus(entity.getStatus());
		return result;
	}
	
	public UserEntity toEntity(UserDTO dto) {
		UserEntity result = new UserEntity();
		result.setUserName(dto.getUserName());
		result.setFullName(dto.getFullName());
		result.setPhone(dto.getPhone());
		result.setEmail(dto.getEmail());
		result.setPassWord(dto.getPassWord());
		return result;
	}
}
