package com.lanhan20.bms.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.lanhan20.bms.entity.Notice;

@Mapper
public interface NoticeMapper {
	
	@Select({"SELECT * FROM Notice ORDER BY id DESC"})
	public List<Notice> getList();
	
	@Select({"SELECT * FROM Notice WHERE id = #{id}"})
	public Notice getNotice(@Param("id") Long id);
	
	@Insert({"INSERT INTO Notice (id, title, content, notice_yn, created_at, created_by) "
		   + "VALUES (Notice_SEQ.NEXTVAL, #{item.title}, "
		   + "#{item.content}, #{item.notice_yn}, SYSDATE, #{item.created_by})"})
	public int setNotice(@Param("item") Notice item);
	
	@Update({"UPDATE Notice SET title = #{item.title}, content = #{item.content}, modified_by=#{modi}, modified_at= SYSDATE "
			+"WHERE id = #{item.id} "})
	public int setUpdateNotice(@Param("item") Notice item, @Param("modi") String modi);
	
	@Delete({"DELETE FROM Notice WHERE brd_id = #{id}"})
	public int delNotice(@Param("id") Long id);
	
	
}
 
