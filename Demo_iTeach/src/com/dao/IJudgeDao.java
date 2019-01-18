package com.dao;

import java.sql.ResultSet;

import com.model.Judge;

public interface IJudgeDao {
	public void addJudge(Judge judge);
	public ResultSet showJudge(String paper_id);
}
