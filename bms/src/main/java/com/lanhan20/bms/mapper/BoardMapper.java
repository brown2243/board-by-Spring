package com.lanhan20.bms.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.lanhan20.bms.entity.Board;

@Mapper
public interface BoardMapper {

	@Select({"SELECT * FROM BOARD ORDER BY brd_id DESC"})
	public List<Board> getList();
	
	@Select({"SELECT * FROM BOARD WHERE brd_id = #{id}"})
	public Board getBoard(@Param("id") Long id);
	
	@Insert({"INSERT INTO BOARD (brd_id, brd_title, brd_content, hit, reg_date, reg_userid) "
		   + "VALUES (BOARD_SEQ.NEXTVAL, #{item.brd_title}, "
		   + "#{item.brd_content}, #{item.hit}, SYSDATE, #{item.reg_userid})"})
	public int setBoard(@Param("item") Board item);
	
	@Update({"UPDATE BOARD SET brd_title = #{item.brd_title}, brd_content = #{item.brd_content} "
			+"WHERE brd_id = #{item.brd_id} "})
	public int setUpdateBoard(@Param("item") Board item);
	
	@Delete({"DELETE FROM BOARD WHERE brd_id = #{id}"})
	public int delBoard(@Param("id") Long id);
	
	@Update({"UPDATE BOARD SET HIT = HIT + 1 WHERE brd_id = #{id}"})
	public void updateBoardHit(@Param("id") Long id);
}
 
