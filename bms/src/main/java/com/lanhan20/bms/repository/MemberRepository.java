package com.lanhan20.bms.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.lanhan20.bms.entity.Member;

@Repository
public interface MemberRepository extends JpaRepository<Member, Long>{
	Member findByUserid(String userid);
}
