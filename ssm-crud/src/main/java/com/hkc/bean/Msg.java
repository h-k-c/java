package com.hkc.bean;

import java.util.HashMap;
import java.util.Map;

/**
 * 通用的返回類
 * @author 胡开成
 * **/
public class Msg {
	//100代表成功，200代表失败
	//狀態碼
	private int code;
	
	//提示信息
	private String msg;
	
	//用戶要返回給瀏覽器的數據
	private Map<String,Object> extend=new HashMap<String, Object>();
	
	public static Msg success(){
		Msg result=new Msg();
		result.setCode(100);
		result.setMsg("處理成功");
		return result;
	}
	
	public Msg add(String key,Object value) {
		this.getExtend().put(key, value);
		return this;
	}
	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Map<String, Object> getExtend() {
		return extend;
	}

	public void setExtend(Map<String, Object> extend) {
		this.extend = extend;
	}

	public static Msg fail() {
		// TODO Auto-generated method stub
		Msg result=new Msg();
		result.setCode(200);
		result.setMsg("處理失败");
		return result;
	}
	
	
}
