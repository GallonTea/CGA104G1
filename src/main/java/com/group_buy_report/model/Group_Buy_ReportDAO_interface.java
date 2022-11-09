package com.group_buy_report.model;

import java.util.*;

public interface Group_Buy_ReportDAO_interface {

	public void insert(Group_Buy_ReportVO Group_Buy_ReportVO);

	public void update(Group_Buy_ReportVO Group_Buy_ReportVO);

	public void delete(Integer gbfrep_id);

	public Group_Buy_ReportVO findByPrimaryKey(Integer gbfrep_id);

	public List<Group_Buy_ReportVO> getAll();
}
