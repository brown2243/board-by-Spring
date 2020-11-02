package com.lanhan20.bms.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Notice {
	private long id = 0;
	private String title = null;
	private String content = null;
	private String notice_yn = null;
	private String created_at = null;
	private String created_by = null;
	private String modified_at = null;
	private String modified_by = null;
	
}
