package com.lanhan20.bms.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.lanhan20.bms.entity.Board;

@Mapper
public interface BoardMapper {

	@Select({"SELECT * FROM BOARD"})
	public List<Board> getList();
	
	@Select({"SELECT * FROM BOARD WHERE brd_id = #{id}"})
	public Board getBoard(@Param("id") long id);
	
	@Insert({"INSERT INTO BOARD (brd_id, brd_title, brd_content, hit, reg_date, reg_userid) "
		   + "VALUES (BOARD_SEQ.NEXTVAL, #{item.brd_title}, "
		   + "#{item.brd_content}, #{item.hit}, SYSDATE, #{item.reg_userid})"})
	public int setBoard(@Param("item") Board item);
}
 