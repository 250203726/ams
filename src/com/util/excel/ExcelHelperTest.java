package com.util.excel;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jodd.datetime.JDateTime;

import org.apache.poi.ss.usermodel.Cell;

/**
 * poi包操作excel测试
 *
 * @createTime: 2012-4-13 下午06:21:10
 * @author: <a href="mailto:hubo@feinno.com">hubo</a>
 * @version: 0.1
 * @lastVersion: 0.1
 * @updateTime: 
 * @updateAuthor: <a href="mailto:hubo@feinno.com">hubo</a>
 * @changesSum: 
 * 
 */
public class ExcelHelperTest {
//	@Test
	public void excelHelperImportTest() {
		// excel列结构
		List<ExcelColumn> excelColumns = new ArrayList<ExcelColumn>();
		excelColumns.add(new ExcelColumn(0, "", "序号"));
		excelColumns.add(new ExcelColumn(1, "orderDate", "日期"));
		excelColumns.add(new ExcelColumn(2, "belongOrgName", "分支机构"));
		excelColumns.add(new ExcelColumn(3, "agentName", "代理商名称"));
		excelColumns.add(new ExcelColumn(4, "entName", "企业名称"));
		excelColumns.add(new ExcelColumn(5, "businessSum", "业务金额"));
		excelColumns.add(new ExcelColumn(6, "contractSum", "合同金额"));
		excelColumns.add(new ExcelColumn(7, "dividePercent", "分成比例"));
		excelColumns.add(new ExcelColumn(8, "divideSum", "分成金额"));
		excelColumns.add(new ExcelColumn(9, "orderType", "订单类型"));
		excelColumns.add(new ExcelColumn(10, "payforSum", "应结算金额（元）"));
		excelColumns.add(new ExcelColumn(11, "payforDate", "应结算日期"));
		excelColumns.add(new ExcelColumn(12, "isReceive", "是否到帐"));
		excelColumns.add(new ExcelColumn(13, "receiveSum", "到帐金额（元）"));
		excelColumns.add(new ExcelColumn(14, "receiveDate", "到帐日期"));
		excelColumns.add(new ExcelColumn(15, "remark", "备注"));
		
		// 需要特殊转换的单元
		Map<String, Map> excelColumnsConvertMap = new HashMap<String, Map>();
		Map<String, Integer> isReceive = new HashMap<String, Integer>();
		isReceive.put("是", 1);
		isReceive.put("否", 0);
		excelColumnsConvertMap.put("isReceive", isReceive);
		Map<String, Integer> orderType = new HashMap<String, Integer>();
		orderType.put("新订单", 1);
		orderType.put("续订订单", 2);
		excelColumnsConvertMap.put("orderType", orderType);
		
		File sourceFile = new File("./xls/务工易后向产品销售明细表、销售汇总表.xls");
		
		ExcelHead head = new ExcelHead();
		head.setRowCount(2); // 头所占行数
		head.setColumns(excelColumns);	// 列的定义
		head.setColumnsConvertMap(excelColumnsConvertMap); // 列的转换
		
		List<AgentSalesDetail> agentSalesList =  ExcelHelper.getInstanse().importToObjectList(head, sourceFile, AgentSalesDetail.class);
		
		for (AgentSalesDetail agentSalesDetail : agentSalesList) {
			System.out.println(agentSalesDetail);
		}
	}
	
	public void excelHelperExportTest() {
		List<AgentSalesDetail> agentSalesDetails = new ArrayList<AgentSalesDetail>();
		for (int i = 0; i < 20; i++) {
			AgentSalesDetail asd = new AgentSalesDetail();
			asd.setOrderDate(new JDateTime(2012, 04, 04).convertToDate());
			asd.setBelongOrgName("杭州办");
			asd.setAgentName("杭州萧聘网络\n科技有限公司");
			asd.setEntName("杭州悦奥体育用品销售有限公司");
			asd.setBusinessSum(900);
			asd.setContractSum(900);
			asd.setDividePercent(55);
			asd.setDivideSum(495);
			asd.setOrderType(1);
			asd.setPayforSum(495);
			asd.setPayforDate(new JDateTime(2012, 04, 04).convertToDate());
			asd.setIsReceive(2);
			asd.setReceiveSum(495);
			asd.setReceiveDate(new JDateTime(2012, 04, 04).convertToDate());
			
			agentSalesDetails.add(asd);
		}
		
		// excel结构
		List<ExcelColumn> excelColumns = new ArrayList<ExcelColumn>();
		excelColumns.add(new ExcelColumn(0, "", "序号"));
		excelColumns.add(new ExcelColumn(1, "orderDate", "日期", Cell.CELL_TYPE_NUMERIC));
		excelColumns.add(new ExcelColumn(2, "belongOrgName", "分支机构", Cell.CELL_TYPE_STRING));
		excelColumns.add(new ExcelColumn(3, "agentName", "代理商名称", Cell.CELL_TYPE_STRING));
		excelColumns.add(new ExcelColumn(4, "entName", "企业名称", Cell.CELL_TYPE_STRING));
		excelColumns.add(new ExcelColumn(5, "businessSum", "业务金额", Cell.CELL_TYPE_NUMERIC));
		excelColumns.add(new ExcelColumn(6, "contractSum", "合同金额", Cell.CELL_TYPE_NUMERIC));
		excelColumns.add(new ExcelColumn(7, "dividePercent", "分成比例", Cell.CELL_TYPE_NUMERIC));
		excelColumns.add(new ExcelColumn(8, "divideSum", "分成金额", Cell.CELL_TYPE_NUMERIC));
		excelColumns.add(new ExcelColumn(9, "orderType", "订单类型", Cell.CELL_TYPE_NUMERIC));
		excelColumns.add(new ExcelColumn(10, "payforSum", "应结算金额（元）", Cell.CELL_TYPE_NUMERIC));
		excelColumns.add(new ExcelColumn(11, "payforDate", "应结算日期", Cell.CELL_TYPE_NUMERIC));
		excelColumns.add(new ExcelColumn(12, "isReceive", "是否到帐", Cell.CELL_TYPE_STRING));
		excelColumns.add(new ExcelColumn(13, "receiveSum", "到帐金额（元）", Cell.CELL_TYPE_NUMERIC));
		excelColumns.add(new ExcelColumn(14, "receiveDate", "到帐日期", Cell.CELL_TYPE_NUMERIC));
		excelColumns.add(new ExcelColumn(15, "remark", "备注", Cell.CELL_TYPE_STRING));
		
		// 需要特殊转换的单元
		Map<String, Map> excelHeadConvertMap = new HashMap<String, Map>();
		Map isReceive = new HashMap();
		isReceive.put(1, "是");
		isReceive.put(0, "否");
		excelHeadConvertMap.put("isReceive", isReceive);
		Map orderType = new HashMap();
		orderType.put(1, "新订单");
		orderType.put(2, "续订订单");
		excelHeadConvertMap.put("orderType", orderType);
		
		File modelFile = new File("./xls/2010销售明细_model.xlsx");
		File outputFile = new File("./xls/2010销售明细_export.xlsx");
		
		ExcelHead head = new ExcelHead();
		head.setRowCount(2); // 模板中头部所占行数
		head.setColumns(excelColumns);	// 列的定义
		head.setColumnsConvertMap(excelHeadConvertMap); // 列的转换
		
		ExcelHelper.getInstanse().exportExcelFile(head, modelFile, outputFile, agentSalesDetails);
	}
	
//	@Test
	public void excelHelperExcelFileConvertToList() throws Exception {
		FileInputStream fis = new FileInputStream("./xls/upload_4df3a05f_136cdc915cf__7ffd_00000000.tmp");
		List<List> dataList = ExcelHelper.getInstanse().excelFileConvertToList(fis);
		for (List list : dataList) {
			for (Object object : list) {
				System.out.print(object);
				System.out.print("\t\t\t");
			}
			System.out.println();
		}
	}
}
