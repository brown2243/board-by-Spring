package com.lanhan20.bms.entity;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.SequenceGenerator;

import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
@Entity
public class Member {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "MEMBER_SEQ")
	@SequenceGenerator(name = "MEMBER_SEQ", sequenceName = "MEMBER_SEQ", allocationSize = 1)
	private Long id;
	private String userid;
	private String userpw;
	private String username;
	private String userphone;
	
//	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") 데이트 타임 포맷 사용할 때 사용. 지금 잘 작동해서 사용 안함
	private LocalDateTime createdAt;
	private String createdBy;
	
}
