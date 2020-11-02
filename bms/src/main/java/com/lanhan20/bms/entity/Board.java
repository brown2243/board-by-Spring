package com.lanhan20.bms.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Board {
	private int brd_id = 0;
	private String brd_title = null;
	private String brd_content = null;
	private int hit = 0;
	private byte[] img = null;
	private String reg_date = null;
	private String reg_userid = null;
}
